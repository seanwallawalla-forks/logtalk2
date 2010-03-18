
:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1.0,
		author is 'Parker Jones and Paulo Moura',
		date is 2010/03/16,
		comment is 'Unit tests for the "shapes_ph" example.']).

	test(ph_1) :-
		square::nsides(N),
		N == 4.

	test(ph_2) :-
		square::area(A),
		A == 1.

	test(ph_3) :-
		q1::(color(Color), side(Side), position(X, Y)),
		Color == red, Side == 1, X == 0, Y == 0.

	test(ph_4) :-
		q2::(side(Side), area(Area), perimeter(Perimeter)),
		Side == 3, Area == 9, Perimeter == 12.

:- end_object.
