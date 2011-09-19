
:- object(integer,
	extends(number)).

	:- info([
		version is 1.51,
		author is 'Paulo Moura',
		date is 2011/9/19,
		comment is 'Integer data type predicates.']).

	:- public(between/3).
	:- mode(between(+integer, +integer, +integer), zero_or_one).
	:- mode(between(+integer, +integer, -integer), zero_or_more).
	:- info(between/3, [
		comment is 'Returns integers in the interval defined by the two first arguments.',
		argnames is ['Lower', 'Upper', 'Integer']]).

	:- public(plus/3).
	:- mode(plus(+integer, +integer, ?integer), zero_or_one).
	:- mode(plus(+integer, ?integer, +integer), zero_or_one).
	:- mode(plus(?integer, +integer, +integer), zero_or_one).
	:- info(plus/3, [
		comment is 'Reversible integer sum. At least two of the arguments must be instantiated to integers.',
		argnames is ['I', 'J', 'Sum']]).

	:- public(succ/2).
	:- mode(succ(+integer, ?integer), zero_or_one).
	:- mode(succ(?integer, +integer), zero_or_one).
	:- info(succ/2, [
		comment is 'Successor of a natural number. At least one of the arguments must be instantiated to a natural number.',
		argnames is ['I', 'J']]).

	:- public(sequence/3).
	:- mode(sequence(+integer, +integer, -list(integer)), zero_or_one).
	:- info(sequence/3,
		[comment is 'Generates a list with the sequence of all integers in the interval [Inf, Sup], assuming Inf =< Sup.',
		 argnames is ['Inf', 'Sup', 'List']]).

	:- if(predicate_property(between(_, _, _), built_in)).

		between(Lower, Upper, Integer) :-
			{between(Lower, Upper, Integer)}.

	:- else.

		between(Lower, Upper, Integer) :-
			integer(Lower),
			integer(Upper),
			(	var(Integer) ->
				Lower =< Upper,
				generate(Lower, Upper, Integer)
			;	integer(Integer),
				Lower =< Integer,
				Integer =< Upper
			).

		generate(Lower, _, Lower).
		generate(Lower, Upper, Integer) :-
			Lower < Upper,
			Next is Lower + 1,
			generate(Next, Upper, Integer).

	:- endif.

	:- if(predicate_property(plus(_, _, _), built_in)).

	    plus(I, J, Sum) :-
	    	{plus(I, J, Sum)}.

	:- else.

	    plus(I, J, Sum) :-
			integer(I),
			integer(J), !,
			Sum is I + J.
	    plus(I, J, Sum) :-
			integer(I),
			integer(Sum), !,
			J is Sum - I.
	    plus(I, J, Sum) :-
			integer(J),
			integer(Sum), !,
			I is Sum - J.

	:- endif.

	:- if(predicate_property(succ(_, _), built_in)).

		succ(I, J) :-
			{succ(I, J)}.

	:- else.

		succ(I, J) :-
			integer(I), !,
			I >= 0,
			J is I + 1.
		succ(I, J) :-
			integer(J),
			(	J =:= 0 ->
			   	fail
			;	J > 0,
				I is J - 1
			).

	:- endif.

	sequence(Inf, Sup, List) :-
        Inf =< Sup,
        gen_sequence(Inf, Sup, List).

	gen_sequence(Sup, Sup, List) :-
		!,
		List = [Sup].
	gen_sequence(Inf, Sup, [Inf| List]) :-
		Next is Inf + 1,
		gen_sequence(Next, Sup, List).

	valid(Integer) :-
		integer(Integer).

	check(Term) :-
		this(This),
		sender(Sender),
		(	integer(Term) ->
			true
		;	var(Term) ->
			throw(error(instantiation_error, This::check(Term), Sender))
		;	throw(error(type_error(This, Term), This::check(Term), Sender))
		).

:- end_object.
