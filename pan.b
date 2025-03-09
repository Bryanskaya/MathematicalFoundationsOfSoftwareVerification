	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC B */

	case 6: // STATE 1
		;
		((P1 *)_this)->tmp = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 2
		;
		((P1 *)_this)->tmp = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 3
		;
		now.x = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC A */

	case 11: // STATE 1
		;
		((P0 *)_this)->tmp = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 2
		;
		((P0 *)_this)->tmp = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 3
		;
		now.x = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;
	}

