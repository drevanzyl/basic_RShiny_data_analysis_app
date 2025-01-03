; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D4AD924C-E62A-430E-93B4-E7E8BB7E527D}}
AppName=Basic RShiny Data Analysis App
AppVersion=1.0
DefaultDirName={pf}\BasicRShinyDataAnalysisApp
DefaultGroupName=Basic RShiny Data Analysis App
OutputBaseFilename=BasicRShinyDataAnalysisAppInstaller
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\andre\Documents\Git\basic_RShiny_data_analysis_app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Basic RShiny Data Analysis App"; Filename: "{app}\basic_RShiny_data_analysis_app.bat"

[Run]
Filename: "{app}\basic_RShiny_data_analysis_app.bat"; Description: "Launch Basic RShiny Data Analysis App"; Flags: shellexec