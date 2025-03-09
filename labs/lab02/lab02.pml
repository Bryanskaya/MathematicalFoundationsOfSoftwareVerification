int x = 1024, mutex = 0;

proctype A() {
    atomic {
        (mutex == 0) -> mutex++

        int tmp
        tmp = x
        tmp++
        x = tmp

        printf("x=%d\n", x)

        mutex--
    }
}

proctype B() {
    atomic {
        (mutex == 0) -> mutex++

        int tmp
        tmp = x
        tmp--
        x = tmp

        printf("x=%d\n", x)

        mutex--
    }
}

init {
    run A()
    run B()
}

