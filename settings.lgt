
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Logtalk - Open source object-oriented logic programming language
%  Release 2.36.0
%  
%  Copyright (c) 1998-2009 Paulo Moura.        All Rights Reserved.
%  Logtalk is free software.  You can redistribute it and/or modify
%  it under the terms of the "Artistic License 2.0" as published by 
%  The Perl Foundation. Consult the "LICENSE.txt" file for details.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%  This is a sample settings file for Logtalk that can be used to override
%  the default flag values in the back-end Prolog compiler config files.
%  Using settings files allows Logtalk to easily support project-specific
%  settings. Note that the settings defined here can always be overridden
%  by using the logtalk_compile/2 and logtalk_load/2 built-in predicates.
%
%  To use this feature, simply copy this file to the directory containing
%  your Logtalk source files and customize it (see the examples below).
%  Note that, for setting Logtalk flags, we must use the set_logtalk_flag/2
%  predicate (wrapped in an initialization/1 directive) as the scope of the
%  set_logtalk_flag/2 directive is local to a source file.
%
%  If you use more than one back-end Prolog compiler and want to use
%  different settings per compiler you will need to use the Logtak 
%  conditional compilation directives and the "prolog_dialect" compiler
%  flag. See the User and Reference Manuals for details. 
%
%  Unfortunately, limitations of the back-end Prolog compilers may prevent
%  this feature to work. Consult the "configs/NOTES.txt" for details on
%  the supported back-end Prolog compiler and operating-systems.


%  To define a "library" path for your project, customize and uncomment the
%  following lines (the library path must end with a slash character):

/*
:- initialization((
	assertz(logtalk_library_path(my_project, '$HOME/my_project/'))
)).
*/


%  To make Logtalk completely silent for batch processing uncomment the
%  following lines:

/*
:- initialization((
	set_logtalk_flag(startup_message, none),
	set_logtalk_flag(report, off)
)).
*/


%  To make Logtalk startup and compilation less verbose uncomment the
%  following lines:

/*
:- initialization((
	set_logtalk_flag(startup_message, flags(compact)),
	set_logtalk_flag(report, warnings)
)).
*/


%  To compile all your source files in debug mode uncomment the following
%  lines:

/*
:- initialization((
	set_logtalk_flag(debug, on),
	set_logtalk_flag(smart_compilation, off),
	set_logtalk_flag(reload, always),
	set_logtalk_flag(unknown, warning),
	set_logtalk_flag(misspelt, warning)
)).
*/


%  To reduce clutter in the directory containing your source files uncomment
%  the following lines:

/*
:- initialization((
	set_logtalk_flag(altdirs, on)
)).
*/


%  To collect all XML documenting files in the same place for generating 
%  (X)HTML or PDF documentation of your project uncomment the following
%  lines:

/*
:- initialization((
	set_logtalk_flag(altdirs, on),
	set_logtalk_flag(xmldocs, on),
	set_logtalk_flag(xmldir, '/home/user/my_project_docs/')
)).
*/


%  To develop portable Logtalk applications uncomment the following lines:

/*
:- initialization((
	set_logtalk_flag(portability, warning)
)).
*/


%  To maximize performance by turning off all optional features uncomment the
%  following lines:

/*
:- initialization((
	set_logtalk_flag(events, off),
	set_logtalk_flag(complements, off),
	set_logtalk_flag(dynamic_declarations, off)
)).
*/
