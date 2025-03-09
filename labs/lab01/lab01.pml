proctype Factorial(int num; int result) {
	if
	:: num == 0 -> printf("Factorial num=%d is %d", num, result)
	:: else -> run Factorial(num - 1, result * num)
	fi
}

init {
    run Factorial(5, 1)
}