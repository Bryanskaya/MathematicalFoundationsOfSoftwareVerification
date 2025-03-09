#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - labs/lab02/lab02.pml:22 - [(run A())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - labs/lab02/lab02.pml:23 - [(run B())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - labs/lab02/lab02.pml:24 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC B */
	case 6: // STATE 1 - labs/lab02/lab02.pml:14 - [tmp = x] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->tmp;
		((P1 *)_this)->tmp = now.x;
#ifdef VAR_RANGES
		logval("B:tmp", ((P1 *)_this)->tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - labs/lab02/lab02.pml:15 - [tmp = (tmp-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->tmp;
		((P1 *)_this)->tmp = (((P1 *)_this)->tmp-1);
#ifdef VAR_RANGES
		logval("B:tmp", ((P1 *)_this)->tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - labs/lab02/lab02.pml:16 - [x = tmp] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = now.x;
		now.x = ((P1 *)_this)->tmp;
#ifdef VAR_RANGES
		logval("x", now.x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 4 - labs/lab02/lab02.pml:18 - [printf('x=%d\\n',x)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		Printf("x=%d\n", now.x);
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 5 - labs/lab02/lab02.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC A */
	case 11: // STATE 1 - labs/lab02/lab02.pml:5 - [tmp = x] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->tmp;
		((P0 *)_this)->tmp = now.x;
#ifdef VAR_RANGES
		logval("A:tmp", ((P0 *)_this)->tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - labs/lab02/lab02.pml:6 - [tmp = (tmp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((P0 *)_this)->tmp;
		((P0 *)_this)->tmp = (((P0 *)_this)->tmp+1);
#ifdef VAR_RANGES
		logval("A:tmp", ((P0 *)_this)->tmp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 3 - labs/lab02/lab02.pml:7 - [x = tmp] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.x;
		now.x = ((P0 *)_this)->tmp;
#ifdef VAR_RANGES
		logval("x", now.x);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 4 - labs/lab02/lab02.pml:9 - [printf('x=%d\\n',x)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		Printf("x=%d\n", now.x);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 5 - labs/lab02/lab02.pml:10 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

