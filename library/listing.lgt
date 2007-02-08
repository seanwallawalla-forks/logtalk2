
:- category(listing).

	:- info([
		version is 1.0,
		author is 'Paulo Moura',
		date is 2007/2/6,
		comment is 'Listing predicates.']).

	:- public(listing/0).
	:- mode(listing, one).
	:- info(listing/0, [
		comment is 'Lists all clauses of all dynamic predicates to the current output stream.']).

	:- public(listing/1).
	:- mode(listing(+predicate_indicator), one).
	:- info(listing/1, [
		comment is 'Lists all clauses of a dynamic predicate to the current output stream.',
		argnames is ['Predicate']]).

	:- public(portray_clause/1).
	:- mode(portray_clause(+clause), one).
	:- info(portray_clause/1, [
		comment is 'Pretty prints a clause to the current output stream.',
		argnames is ['Clause']]).

	:- protected(portray_body/1).
	:- mode(portray_body(+callable), one).
	:- info(portray_body/1, [
		comment is 'Pretty prints a clause body to the current output stream.',
		argnames is ['Body']]).

	:- protected(spaces/1).
	:- mode(spaces(+integer), one).
	:- info(spaces/1, [
		comment is 'Prints N spaces to the current output stream.',
		argnames is ['N']]).

	listing :-
		::current_predicate(Functor/Arity),
		functor(Head, Functor, Arity),
		::predicate_property(Head, (dynamic)),
		nl,
		listing_properties(Head, Functor, Arity),
		listing_clauses(Head),
		fail.
	listing.

	listing(Functor/Arity) :-
		atom(Functor),
		integer(Arity),
		::current_predicate(Functor/Arity),
		functor(Head, Functor, Arity),
		::predicate_property(Head, (dynamic)), !,
		listing_properties(Head, Functor, Arity),
		listing_clauses(Head).

	listing_properties(Head, Functor, Arity) :-
		write('% '), writeq(Functor/Arity), nl,
		::predicate_property(Head, declared_in(DclEntity)),
		write('%   '), writeq(declared_in(DclEntity)),
		(	::predicate_property(Head, defined_in(DefEntity)) ->
			write('  '), writeq(defined_in(DefEntity))
		;	true
		), nl,
		(	::predicate_property(Head, non_terminal(NonTerminal//NTArity)) ->
			write('%   '), writeq(non_terminal(NonTerminal//NTArity)), nl
		;	true
		), nl,
		fail.

	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, public),
		write(':- public('), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, protected),
		write(':- protected('), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, private),
		write(':- private('), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, (dynamic)),
		write(':- dynamic('), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(Head, _, _) :-
		::predicate_property(Head, meta_predicate(Mode)),
		write(':- meta_predicate('), writeq(Mode), write(').'), nl,
		fail.
	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, synchronized),
		write(':- synchronized('), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(Head, Functor, Arity) :-
		::predicate_property(Head, alias(OFunctor/OArity)),
		write(':- alias('), writeq(OFunctor/OArity), write(', '), writeq(Functor/Arity), write(').'), nl,
		fail.
	listing_properties(_, _, _) :-
		nl.

	listing_clauses(Head) :-
		::clause(Head, Body),
		::portray_clause((Head :- Body)),
		fail.
	listing_clauses(_).

	portray_clause((Head :- true)) :-
		!,
		numbervars(Head, 0, _),
		write_term(Head, [numbervars(true), quoted(true)]), write('.'), nl.
	portray_clause((Head :- Body)) :-
		numbervars((Head:-Body), 0, _),
		write_term(Head, [numbervars(true), quoted(true)]), write(' :-'), nl,
		::portray_body(Body),
		write('.'), nl.

	portray_body(Body) :-
		spaces(4), write_term(Body, [numbervars(true), quoted(true)]).

	spaces(0) :-
		!.
	spaces(N) :-
		put_char(' '),
		N2 is N - 1,
		spaces(N2).

:- end_category.
