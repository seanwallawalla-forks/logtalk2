
:- object(attvars_hook,
	implements(expanding)).

	:- info([
		version is 0.1,
		author is 'Paulo Moura',
		date is 2011/02/16,
		comment is 'Hook object for compiling objects and categories using attributed variables.']).

	:- if(current_logtalk_flag(prolog_dialect, xsb)).
		term_expansion((attr_unify_hook(Att, Var) :- Body), [{(:- import(from(/(install_verify_attribute_handler,4), machine)))},{(:- install_verify_attribute_handler(Module,Att,Var,TAttrUnifyHookHead))},(attr_unify_hook(Att, Var) :- Body)]) :-
			logtalk_load_context(entity_name, Module),
			logtalk::compile_predicate_heads(attr_unify_hook(Att, Var), TAttrUnifyHookHead).
	:- else.
		term_expansion((attr_unify_hook(Att, Var) :- Body), [(:- multifile(Module:attr_unify_hook/2)), (Module:attr_unify_hook(Att, Var) :- Body)]) :-
			logtalk_load_context(entity_name, Module).
	:- endif.

	:- if(current_logtalk_flag(prolog_dialect, xsb)).
		term_expansion((attribute_goals(X) --> Body), [{(:- import(from(/(install_attribute_portray_hook,3), machine)))},{(:- install_attribute_portray_hook(Module,X,TAttrUnifyHookHead))},(attribute_goals(X) --> Body)]) :-
			logtalk_load_context(entity_name, Module),
			logtalk::expand_term((attribute_goals(X) --> Body), (AttrUnifyHookHead :- _)),
			logtalk::compile_predicate_heads(AttrUnifyHookHead, TAttrUnifyHookHead).
	:- else.
		term_expansion((attribute_goals(X) --> Body), [(:- multifile(Module:attribute_goals//1)), (Module:attribute_goals(X) --> Body)]) :-
			logtalk_load_context(entity_name, Module).
	:- endif.

:- end_object.
