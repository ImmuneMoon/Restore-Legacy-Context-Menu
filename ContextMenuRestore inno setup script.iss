[Setup]
; Basic App Information
AppName=Windows Context Menu Restore
AppVersion=1.0
AppPublisher=Fulllion Creative Works
SetupIconFile=MenuIcon.ico

; Displays warning.txt file as a "License Agreement" screen
LicenseFile=warning.txt

; Forces 64-bit mode so the registry key goes to the correct location
ArchitecturesInstallIn64BitMode=x64compatible

; Where the uninstaller will be saved (Program Files)
DefaultDirName={autopf}\WinContextMenuRestore
DefaultGroupName=Windows Context Menu Restore
UninstallDisplayIcon={app}\unins000.exe

; Output settings for the final installer .exe
OutputDir=installer
OutputBaseFilename=WinContextMenuRestore
Compression=lzma2
SolidCompression=yes

; Only modifying the Current User (HKCU) registry, so make it the lowest privileges
PrivilegesRequired=lowest

[Registry]
; Applies the Windows 11 right-click fix. 
; The 'uninsdeletekey' flag tells the Uninstaller to delete this key and revert the fix automatically
Root: HKCU; Subkey: "Software\Classes\CLSID\{{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"; ValueType: string; ValueName: ""; ValueData: ""; Flags: uninsdeletekey

[Run]
; Kills Explorer silently, then launches it again.
Filename: "{cmd}"; Parameters: "/c taskkill /f /im explorer.exe & start explorer.exe"; Flags: runhidden

[UninstallRun]
; Does the exact same clean restart when the user uninstalls the fix
Filename: "{cmd}"; Parameters: "/c taskkill /f /im explorer.exe & start explorer.exe"; Flags: runhidden; RunOnceId: "RestartExplorer"

[Messages]
FinishedHeadingLabel=Installation Complete!
FinishedLabel=The classic Windows right-click menu has been restored. File Explorer will now restart to apply the changes.