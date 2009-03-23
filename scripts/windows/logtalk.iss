; Script generated by the Inno Setup Script Wizard.

#define MyAppName "Logtalk"
#define MyAppVerName "Logtalk 2.36.0"
#define MyAppPublisher "Logtalk.org"
#define MyAppURL "http://logtalk.org"
#define MyAppUrlName "Logtalk Web Site.url"
#define MyAppRegURL "http://logtalk.org/regform.html"
#define MyAppRegUrlName "Logtalk Registration.url"

#define LOGTALKHOME "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment,LOGTALKHOME|{pf}\Logtalk}"
#define LOGTALKUSER "{reg:HKCU\Environment,LOGTALKUSER|{userdocs}\Logtalk}"

#define MyBaseDir "C:\lgtsvn"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={#LOGTALKHOME}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#MyBaseDir}\LICENSE.txt
InfoBeforeFile={#MyBaseDir}\README.txt
OutputBaseFilename=lgt2360
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none

VersionInfoVersion=2.36.0
VersionInfoCopyright=� Paulo Moura, 1998-2009

AllowRootDirectory=yes
UninstallFilesDir="{userdocs}\Logtalk uninstaller"

MinVersion=0,5.0

[Types]
Name: "full"; Description: "Full installation (recommended)"
Name: "base"; Description: "Base system installation"
Name: "user"; Description: "User data files installation (must be run by all end-users)"
Name: "prolog"; Description: "Prolog integration (see documentation for compatibility details)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "base"; Description: "Base system"; Types: full base custom; Flags: disablenouninstallwarning
Name: "user"; Description: "User data files"; Types: full user custom; Flags: checkablealone disablenouninstallwarning
Name: "user\backup"; Description: "Backup current user data files"; Types: full user custom; Flags: disablenouninstallwarning
Name: "prolog"; Description: "Prolog integration"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\bp"; Description: "B-Prolog integration (version 7.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\ciao"; Description: "Ciao Prolog integration (version 1.10; requires patching Logtalk)"; Types: custom; Flags: disablenouninstallwarning
Name: "prolog\cxprolog"; Description: "CxProlog integration (version 0.97.2 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\eclipse"; Description: "ECLiPSe integration (versions 5.10, 6.0)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\gprolog"; Description: "GNU Prolog integration (version 1.3.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\plc"; Description: "K-Prolog integration (version 6.0.4)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\quintus"; Description: "Quintus Prolog integration (version 3.5; requires patching Logtalk)"; Types: custom; Flags: disablenouninstallwarning
Name: "prolog\sicstus"; Description: "SICStus Prolog integration (versions 3.12.x, 4.0.x)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\swi"; Description: "SWI-Prolog integration (version 5.6.44 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\xsb"; Description: "XSB integration (version 3.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\yap"; Description: "YAP integration (version 5.1.3 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning

[Tasks]
Name: registration; Description: "&Register {#MyAppName} (opens a web page; requires an Internet connection)"; Components: base user
Name: shortcut; Description: "&Create a desktop shortcut to the Logtalk user folder"; Components: user

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=Logtalk 2.36.0 � Paulo Moura, 1998-2009

[Dirs]
Name: {code:GetLgtUserDir}; Components: user; Flags: uninsneveruninstall
Name: "{userdocs}\Logtalk uninstaller"

[Files]
Source: "{#MyBaseDir}\*"; Excludes: ".*,CVS"; DestDir: "{app}"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#MyBaseDir}\configs\amzi.pl"; DestDir: "{app}\configs"; DestName: "amzi.pro"; Components: base; Flags: ignoreversion uninsneveruninstall

Source: "{#MyBaseDir}\contributions\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\contributions"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\examples\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\examples"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\libpaths\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\libpaths"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\library\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\library"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\xml\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\xml"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall

Source: "{#MyBaseDir}\settings.lgt"; DestDir: "{code:GetLgtUserDir}"; DestName: "settings.lgt"; Components: user; Flags: ignoreversion uninsneveruninstall
Source: "{#MyBaseDir}\VERSION.txt"; DestDir: "{code:GetLgtUserDir}"; DestName: "VERSION.txt"; Components: user; Flags: ignoreversion uninsneveruninstall
Source: "{#MyBaseDir}\libpaths\libpaths.pl"; DestDir: "{code:GetLgtUserDir}\libpaths"; DestName: "libpaths_no_env_var.pl"; Components: user; Flags: ignoreversion uninsneveruninstall

Source: "{#MyBaseDir}\scripts\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion
Source: "{#MyBaseDir}\xml\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion

[INI]
Filename: "{app}\{#MyAppUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppURL}"; Components: base
Filename: "{app}\{#MyAppRegUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppRegURL}"; Components: base

[Icons]
Name: "{group}\Bibliography"; Filename: "{app}\BIBLIOGRAPHY.bib"; Components: base
Name: "{group}\Documentation"; Filename: "{app}\manuals\index.html"; Components: base
Name: "{group}\License"; Filename: "{app}\LICENSE.txt"; Components: base
Name: "{group}\Release Notes"; Filename: "{app}\RELEASE_NOTES.txt"; Components: base
Name: "{group}\Read Me"; Filename: "{app}\README.txt"; Components: base
Name: "{group}\Customization instructions"; Filename: "{app}\CUSTOMIZE.txt"; Components: base

Name: "{group}\Web Site"; Filename: "{#MyAppUrl}"; Components: base

Name: "{group}\Logtalk - B-Prolog"; Filename: "{code:GetBPExePath}"; Parameters: "-g ""consult('$LOGTALKHOME/integration/logtalk_bp.pl'), $bp_top_level"""; Comment: "Runs Logtalk with B-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\bp; Flags: createonlyiffileexists

Name: "{group}\Logtalk - Ciao Prolog"; Filename: "{code:GetCiaoExePath}"; Parameters: "-l ""$LOGTALKHOME/integration/logtalk_ciao.pl"""; Comment: "Runs Logtalk with Ciao Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\ciao; Flags: createonlyiffileexists

Name: "{group}\Logtalk - CxProlog"; Filename: "{code:GetCxExePath}"; Parameters: "--goal ""silent_consult('%LOGTALKHOME%/integration/logtalk_cx.pl')"""; Comment: "Runs Logtalk with CxProlog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\cxprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - ECLiPSe 5.10"; Filename: "{code:GetEclipse5ExePath}"; Parameters: "-b ""$LOGTALKHOME/integration/logtalk_eclipse5.pl"""; Comment: "Runs Logtalk with ECLiPSe 5.10"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\eclipse; Flags: createonlyiffileexists

Name: "{group}\Logtalk - ECLiPSe 6.0"; Filename: "{code:GetEclipse6ExePath}"; Parameters: "-b ""$LOGTALKHOME/integration/logtalk_eclipse6.pl"""; Comment: "Runs Logtalk with ECLiPSe 6.0"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\eclipse; Flags: createonlyiffileexists

Name: "{group}\Logtalk - GNU Prolog"; Filename: "{code:GetGPExePath}"; Parameters: "--init-goal ""set_prolog_flag(suspicious_warning, off), set_prolog_flag(multifile_warning, off), ['$LOGTALKHOME/integration/logtalk_gp.pl'], set_prolog_flag(suspicious_warning, on), set_prolog_flag(multifile_warning, on)"""; Comment: "Runs Logtalk with GNU Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\gprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - K-Prolog"; Filename: "{code:GetKPExePath}"; Parameters: "-h 4096k -l 2048k -g 4096k -e ""(consult('$LOGTALKHOME/integration/logtalk_plc6.pl'), '$root')."""; Comment: "Runs Logtalk with K-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\plc; Flags: createonlyiffileexists

Name: "{group}\Logtalk - Quintus Prolog"; Filename: "{code:GetQuintusExePath}"; Parameters: "+l ""%LOGTALKHOME%\integration\logtalk_quintus.pl"" +z ""%LOGTALKHOME%"" ""%LOGTALKUSER%"""; Comment: "Runs Logtalk with Quintus Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\quintus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 3.12"; Filename: "{code:GetSP3ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus3.pl"""; Comment: "Runs Logtalk with SICStus Prolog 3.12"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 4.0"; Filename: "{code:GetSP4ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus4.pl"""; Comment: "Runs Logtalk with SICStus Prolog 4.0"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SWI-Prolog"; Filename: "{code:GetSWIExePath}"; Parameters: "-f ""%LOGTALKHOME%\integration\logtalk_swi.pl"""; Comment: "Runs Logtalk with SWI-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\swi; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB"; Filename: "C:\XSB\config\x86-pc-windows\bin\xsb.exe"; Parameters: "-l -e ""['%LOGTALKHOME%\\integration\\logtalk_xsb.pl']."""; Comment: "Runs Logtalk with XSB"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\xsb; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB-MT"; Filename: "C:\XSB\config\i686-pc-cygwin-mt\bin\xsb.exe"; Parameters: "--shared_predicates -l -e ""['%LOGTALKUSER%\\configs\\xsb.pl', '%LOGTALKHOME%\\compiler\\logtalk.pl', '%LOGTALKUSER%\\libpaths\\libpaths.pl']."""; Comment: "Runs Logtalk with XSB-MT"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\xsb; Flags: createonlyiffileexists

Name: "{group}\Logtalk - YAP"; Filename: "{code:GetYAPExePath}"; Parameters: "-l ""$LOGTALKHOME/integration/logtalk_yap.pl"""; Comment: "Runs Logtalk with YAP"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\yap; Flags: createonlyiffileexists

Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

Name: "{code:GetLgtUserDir}\configs"; Filename: "{app}\configs"; Components: user
Name: "{code:GetLgtUserDir}\manuals"; Filename: "{app}\manuals"; Components: user
Name: "{code:GetLgtUserDir}\wenv"; Filename: "{app}\wenv"; Components: user

Name: "{userdesktop}\Logtalk user files"; Filename: "{code:GetLgtUserDir}"; Components: user; Tasks: shortcut

[Registry]
Root: HKLM; Subkey: "Software\Logtalk"; ValueType: dword; ValueName: "Version"; ValueData: "2360"; Components: base; Flags: deletevalue uninsdeletevalue
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "LOGTALKHOME"; ValueData: "{app}"; Components: base; Flags: deletevalue uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKUSER"; ValueData: "{code:GetLgtUserDir}"; Flags: deletevalue uninsdeletevalue

[Run]
Filename: "{app}\RELEASE_NOTES.txt"; Description: "View the release notes"; Components: base user; Flags: postinstall shellexec skipifsilent
Filename: "{app}\CUSTOMIZE.txt"; Description: "Read the customization instructions for completing your setup"; Components: base user; Flags: postinstall shellexec skipifsilent

Filename: "{app}\{#MyAppRegUrlName}"; Flags: shellexec nowait; Tasks: registration

[UninstallDelete]
Type: filesandordirs; Name: "{app}"; Components: base
Type: filesandordirs; Name: "{group}"; Components: base

[Code]
var
  LgtUserDirPage: TInputDirWizardPage;
  WarningPage: TOutputMsgWizardPage;
  Explanation, Warning, BackupFolder: String;

procedure InitializeWizard;
var
  Version, InstalledVersion: Cardinal;
  LOGTALKHOME: String;
begin
  Explanation := 'Select the folder in which Setup should install Logtalk user data files, then click Next.'
                 + Chr(13) + Chr(13)
                 + 'These files allows each user to independently customize Logtalk and to freely modify the provided programming examples.'
                 + Chr(13) + Chr(13)
                 + 'A copy of these files must exist in the user home folder in order to use the Logtalk-Prolog integration scripts available from the Start Menu.'
                 + Chr(13) + Chr(13)
                 + 'Addtional end-users may use this installer to make a copy of these files on their home folders after a full installation of Logtalk.';
  LgtUserDirPage := CreateInputDirPage(wpSelectDir,
    'Select folder for Logtalk user data files', 'Where should Logtalk user data files be installed?',
    Explanation,
    False, 'New Folder');
  LgtUserDirPage.Add('');
  LgtUserDirPage.Values[0] := ExpandConstant('{#LOGTALKUSER}');
  if not IsAdminLoggedOn then
  begin
    Warning := 'Full installation of Logtalk requires an administrative user.'
               + Chr(13) + Chr(13)
               + 'If the base Logtalk system is already installed, you may proceed in order to setup Logtalk for you as an end-user.'
               + Chr(13) + Chr(13)
               + 'If Logtalk is already set for you, this installer will make a backup copy of your current files (if you choose the same installation folder) and will restore all user data files to their default, pristine state.';
    WarningPage := CreateOutputMsgPage(wpWelcome,
  'Information', 'Please read the following important information before continuing.', Warning);
  end;
  if RegQueryDWordValue(HKLM, 'Software\Logtalk\', 'Version', Version) then
    InstalledVersion := Version
  else if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'LOGTALKHOME', LOGTALKHOME) and DirExists(LOGTALKHOME) then
    InstalledVersion := 0
  else
    InstalledVersion := -1;
  if IsAdminLoggedOn and (InstalledVersion >= 0) and (InstalledVersion < 2360) then
  begin
    Warning := 'Older Logtalk settings files are incompatible with this new version. See the pristine "settings.lgt" file in your Logtalk user data folder for upgrade instructions.'
               + Chr(13) + Chr(13)
               + 'All aditional Logtalk users on your computer must also update their Logtalk settings files.';
    WarningPage := CreateOutputMsgPage(wpWelcome,
  'Warning', 'Logtalk settings files update required.', Warning);
  end
end;

function GetLgtUserDir(Param: String): String;
begin
  Result := LgtUserDirPage.Values[0]
end;

function GetCurrentDate(Param: String): String;
begin
  Result := GetDateTimeString('dddddd tt', '-', '-')
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = wpSelectDir) and not IsAdminLoggedOn then
    Result := True
  else if (PageID = wpSelectComponents) and not IsAdminLoggedOn then
  begin
    WizardForm.TypesCombo.ItemIndex := 2;
    WizardForm.TypesCombo.OnChange(nil);
    Result := True
  end
  else if (PageID = wpReady) and not IsAdminLoggedOn then
    Result := True
  else
    Result := False;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  NewFolder: String;
begin
  NewFolder := LgtUserDirPage.Values[0];
  if (CurStep = ssInstall) and DirExists(NewFolder) and (pos('backup', WizardSelectedComponents(False)) > 0) then begin
    BackupFolder := NewFolder + '-backup-' + GetDateTimeString('yyyy-mm-dd-hhnnss', '-', ':');
    RenameFile(NewFolder, BackupFolder)
  end
  else if (CurStep = ssPostInstall) and FileExists(BackupFolder + '\settings.lgt') then begin
    RenameFile(NewFolder + '\settings.lgt', NewFolder + '\settings-pristine.lgt');
    FileCopy(BackupFolder + '\settings.lgt', NewFolder + '\settings.lgt', False)
  end
end;

function GetBPExePath(Param: String): String;
var
  BPDIR: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'BPDIR', BPDIR) then
    Result := BPDIR + '\bp.bat'
  else begin
    Warning := 'Failed to detect B-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetCiaoExePath(Param: String): String;
var
  CiaoDir: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\Ciao Prolog\', 'ciao_dir', CiaoDir) then
    Result := CiaoDir + '\shell\ciaosh.cpx'
  else begin
    Warning := 'Failed to detect Ciao Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetCxExePath(Param: String): String;
var
  CxDir: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'SOFTWARE\CxProlog\', 'CXPROLOGDIR', CxDir) then
    Result := CxDir + '\cxprolog.exe'
  else begin
    Warning := 'Failed to detect CxProlog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetEclipse5ExePath(Param: String): String;
var
  ECLIPSEDIR: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\5.10\', 'ECLIPSEDIR', ECLIPSEDIR) then
    Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
  else begin
    Warning := 'Failed to detect ECLiPSe Prolog 5 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetEclipse6ExePath(Param: String): String;
var
  ECLIPSEDIR: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\6.0\', 'ECLIPSEDIR', ECLIPSEDIR) then
    Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
  else begin
    Warning := 'Failed to detect ECLiPSe Prolog 6 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetGPExePath(Param: String): String;
var
  RootPath: String;
  Warning: String;
begin
  if RegQueryStringValue(HKCU, 'Software\GnuProlog\', 'RootPath', RootPath) then
    Result := RootPath + '\bin\gprolog.exe'
  else begin
    Warning := 'Failed to detect GNU Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetKPExePath(Param: String): String;
var
  Path: String;
  Warning: String;
begin
  Path := GetEnv('PLC') + '\plc.exe';
  if FileExists(Path) then
    Result := Path
  else begin
    Warning := 'Failed to detect K-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetQuintusExePath(Param: String): String;
var
  Path: String;
  Warning: String;
begin
  Path := GetEnv('Quintus') + '\bin\ix86\qpwin.exe';
  if FileExists(Path) then
    Result := Path
  else begin
    Warning := 'Failed to detect Quintus Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetSP3ExePath(Param: String): String;
var
  SP_PATH: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SICS\SICStus3.12_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else begin
    Warning := 'Failed to detect SICStus Prolog 3 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetSP4ExePath(Param: String): String;
var
  SP_PATH: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SICS\SICStus4.0_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else begin
    Warning := 'Failed to detect SICStus Prolog 4 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetSWIExePath(Param: String): String;
var
  Home: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SWI\Prolog\', 'home', Home) then
    Result := Home + '\bin\plwin.exe'
  else begin
    Warning := 'Failed to detect SWI-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;

function GetYAPExePath(Param: String): String;
var
  Home: String;
  Warning: String;
begin
  if RegQueryStringValue(HKLM, 'Software\YAP\Prolog\', 'home', Home) then
    Result := Home + '\bin\yap.exe'
  else begin
    Warning := 'Failed to detect YAP installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
    Result := 'lgt_exe_does_not_exist'
  end
end;