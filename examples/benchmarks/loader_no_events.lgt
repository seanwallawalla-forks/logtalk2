
:- initialization((
	logtalk_load([category, objects, database, plain, benchmarks], [events(deny)]),
	(current_logtalk_flag(modules, supported) -> ensure_loaded(module); true)
)).
