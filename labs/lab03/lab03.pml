typedef packet {
  bit a_bit 
  int data
}

int cnt = 0

chan server_to_client = [5] of {packet}
chan client_to_server = [5] of {bit}


proctype Client() {
  bit a_bit = 0
  packet p
  do
  :: server_to_client?p ->
    printf("[RECEIVER] Data was got, a_bit=%d data=%d\n", p.a_bit, p.data)

    if
    :: p.a_bit == a_bit ->  client_to_server!p.a_bit
                            a_bit = 1 - a_bit
    :: else -> skip
    fi
  od
}

proctype Server() {
  bit a_bit = 0
  bit ack
  packet p
  do
  :: atomic {
      p.a_bit = a_bit
      p.data = cnt

      server_to_client!p

      printf("[SERVER] Data was send, a_bit=%d data=%d\n", p.a_bit, p.data)

      client_to_server?ack

      printf("[SERVER] Data was got, a_bit=%d\n", a_bit)
    } ->
    if
    :: ack == a_bit ->  a_bit = 1 - a_bit
                        cnt = (cnt + 1) % 100
    :: else -> skip
    fi
  od
}

init {
  atomic {
    run Server()
    run Client()
  }
}
