// =================================================================
// Logtalk - Object oriented extension to Prolog
// Release 2.20.1
//
// Copyright (c) 1998-2004 Paulo Moura.  All Rights Reserved.
// =================================================================

if (WScript.Arguments.Unnamed.Length > 0) {
	usage_help();
	WScript.Quit(0);
}

WScript.Echo('');
WScript.Echo('Installing Logtalk...');
WScript.Echo('');

var WshShell = new ActiveXObject("WScript.Shell");
var WshSystemEnv = WshShell.Environment("SYSTEM");
var FSObject = new ActiveXObject("Scripting.FileSystemObject");

WshShell.CurrentDirectory = "..";

WshSystemEnv.Item("LOGTALKHOME") = WshShell.CurrentDirectory;

var ProgramsPath = WshShell.SpecialFolders("AllUsersPrograms");

if (!FSObject.FolderExists(ProgramsPath + "\\Logtalk")) 
	FSObject.CreateFolder(ProgramsPath + "\\Logtalk");

var link = WshShell.CreateShortcut(ProgramsPath + "\\Logtalk\\Logtalk Web Site.lnk");

link.Description = "Go to Logtalk Web Site";
link.TargetPath = "http://www.logtalk.org/";
link.Save();

link = WshShell.CreateShortcut(ProgramsPath + "\\Logtalk\\Logtalk HTML Documentation.lnk");

link.Description = "Browse Logtalk Documentation";
link.TargetPath = "%LOGTALKHOME%\\manuals\\index.html";
link.Save();

link = WshShell.CreateShortcut(ProgramsPath + "\\Logtalk\\Logtalk Readme.lnk");

link.Arguments = "%LOGTALKHOME%\\manuals\\README";
link.Description = "Open Logtalk ReadMe";
link.TargetPath = "%SystemRoot%\\system32\\notepad.exe";
link.Save();

link = WshShell.CreateShortcut(ProgramsPath + "\\Logtalk\\Logtalk Quick Start.lnk");

link.Arguments = "%LOGTALKHOME%\\manuals\\QUICK_START";
link.Description = "Open Logtalk Quick Start";
link.TargetPath = "%SystemRoot%\\system32\\notepad.exe";
link.Save();

WScript.Echo('Logtalk installation completed.');
WScript.Echo('');

WScript.Echo('Make sure that the LOGTALKHOME environment variable');
WScript.Echo('is defined for all users wishing to use Logtalk.');
WScript.Echo('');

WScript.Quit(0);

function usage_help() {
	WScript.Echo('');
	WScript.Echo('This script creates a shortcut named "Logtalk - CIAO" for running Logtalk');
	WScript.Echo('with CIAO. The script must be run by a user with administrative rights.');
	WScript.Echo('The LOGTALKHOME environment variable must be defined before running this');
	WScript.Echo('script.');
	WScript.Echo('');
	WScript.Echo('Usage:');
	WScript.Echo('  ' + WScript.ScriptName + ' help');
	WScript.Echo('  ' + WScript.ScriptName);
	WScript.Echo('');
}
