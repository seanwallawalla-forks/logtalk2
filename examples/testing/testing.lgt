
:- object(ctx_call_tests,
	extends(lgtunit)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/03/16,
		comment is 'Tests for the <</2 built-in control construct.']).

	:- initialization(::run).
%	:- initialization(::run('bios_tests.txt', write)).
%	:- initialization(::run('results.txt', write)).

	throws(ctx1, error(instantiation_error, _, _)) :-
		_ << goal.
	throws(ctx2, error(instantiation_error, _, _)) :-
		object << _.
	throws(ctx3, error(type_error(object_identifier, 3), _, _)) :-
		{3 << goal}.
	throws(ctx4, error(type_error(callable, 3), _, _)) :-
		{object << 3}.
	throws(ctx5, error(existence_error(procedure, goal/0), _)) :-
		this(This),
		This << goal.
	throws(ctx6, error(existence_error(object, xpto), _, _)) :-
		xpto << goal.

	succeeds(ctx7) :-
		user << true.

	fails(ctx8) :-
		user << fail.

:- end_object.



:- object(bios_tests,
	extends(lgtunit)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/03/16,
		comment is 'Tests built-in objects.']).

	:- initialization(::run).
%	:- initialization(::run('bios_tests.txt', write)).
%	:- initialization(::run('results.txt', append)).

	succeeds(all) :-
		setof(Obj, (current_object(Obj), object_property(Obj, built_in)), Objs),
		Objs == [debugger,logtalk,user].

	succeeds(user0) :-
		current_object(user).
	succeeds(user1) :-
		object_property(user, built_in).
	succeeds(user2) :-
		object_property(user, static).

	succeeds(debugger0) :-
		current_object(debugger).
	succeeds(debugger1) :-
		object_property(debugger, built_in).
	succeeds(debugger2) :-
		object_property(debugger, static).

	succeeds(logtalk0) :-
		current_object(logtalk).
	succeeds(logtalk1) :-
		object_property(logtalk, built_in).
	succeeds(logtalk2) :-
		object_property(logtalk, static).

	succeeds(dynamic0) :-
		this(This),
		current_object(This).

	throws(co0, error(type_error(object_identifier, 1), _)) :-
		current_object(1).

:- end_object.



:- object(list_tests,
	extends(lgtunit)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/03/16,
		comment is 'Tests for the library object "list".']).

	:- initialization(::run).
%	:- initialization(::run('list_tests.txt', write)).
%	:- initialization(::run('results.txt', append)).

	setup :-
		current_logtalk_flag(report, Value),
		set_logtalk_flag(report, off),
		logtalk_load(library(types_loader)),
		set_logtalk_flag(report, Value).

	fails(member0) :-
		list::member(_, []).

	succeeds(member1) :-
		list::member(1, [1,2,3]).
	succeeds(member2) :-
		findall(X, list::member(X, [1,2,3]), L),
		L == [1,2,3].

	succeeds(length) :-
		list::length([1,2,3], Length),
		Length =:= 3.

:- end_object.



:- object(dyn_tests,
	extends(lgtunit)).

	:- info([
		version is 2.0,
		author is 'Paulo Moura',
		date is 2010/03/16,
		comment is 'Tests dynamic objects and dynamic predicates.']).

	:- set_logtalk_flag(unknown, silent).

	:- initialization(::run).
%	:- initialization(::run('dyn_tests.txt', write)).
%	:- initialization(::run('results.txt', append)).

	setup :-
		create_object(dyn_test, [], [set_logtalk_flag(dynamic_declarations, allow)], []).

	succeeds(dyn) :-
		\+ dyn_test::current_predicate(_),
		dyn_test::asserta(a(1)),
		dyn_test::current_predicate(a/1),
		dyn_test::predicate_property(a(_), public),
		dyn_test::predicate_property(a(_), dynamic),
		dyn_test::predicate_property(a(_), declared_in(dyn_test)),
		dyn_test::predicate_property(a(_), defined_in(dyn_test)),
		dyn_test::assertz(a(2)),
		dyn_test::retractall(a(_)),
		\+ dyn_test::a(_),
		dyn_test::predicate_property(a(_), defined_in(dyn_test)),	% closed-world assumption
		dyn_test::current_predicate(a/1),
		dyn_test::abolish(a/1),
		\+ dyn_test::predicate_property(a(_), declared_in(dyn_test)),
		\+ dyn_test::predicate_property(a(_), defined_in(dyn_test)),
		\+ dyn_test::current_predicate(_).

	cleanup :-
		abolish_object(dyn_test).

:- end_object.



:- object(set_tests,
	extends(lgtunit)).

	:- set_logtalk_flag(unknown, silent).

	:- initialization(::run).
%	:- initialization(::run('pj.txt', write)).
%	:- initialization(::run('results.txt', append)).

	setup :-
		current_logtalk_flag(report, Value),
		set_logtalk_flag(report, off),
		logtalk_load(operators(loader)),
		set_logtalk_flag(report, Value).

	test(operators_1) :-
		findall(I-J, double::double(I, J), Solutions),
		Solutions==[1-2,2-4,3-6].

	test(operators_2) :-
		findall(I-J, triple::triple(I, J), Solutions),
		Solutions==[1-3,2-6,3-9].

	% test 3.  % couldn't really test the interesting cases because of compilation errors
	test(operators_3) :-
		findall(N1-N2, graph1::edge(N1, N2), Solutions),
		Solutions==[a-b,a-c,b-d,c-d].

	test(operators_4) :-
		findall(Path, graph1::path(a, d, Path), Solutions),
		Solutions==[[a,b,d],[a,c,d]].

	test(operators_5) :-
		\+ current_op(_P, _T, edge).

:- end_object.
