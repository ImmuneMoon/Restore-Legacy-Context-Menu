# Restore Legacy Context Menu

Brings back the classic, full right-click menu on Windows 11, so you no longer have to click **Show more options** to reach it.

## Install

1. Download `WinContextMenuRestore.exe` from the
   [latest release](https://github.com/ImmuneMoon/Restore-Legacy-Context-Menu/releases/latest).
2. Save any open work. The installer briefly restarts File Explorer.
3. Run the installer and follow the prompt.

Right-click anywhere afterwards and the classic menu appears straight away.

### Without the installer

Download and run `ContextMenuRestore.bat` instead. It does exactly the same thing.

## What it changes

The fix adds one empty registry key under your own user account:

```text
HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32
```

It then restarts File Explorer so the change takes effect. Nothing is installed system-wide and no administrator rights are needed.

## Undo

To go back to the Windows 11 menu, run this in a Command Prompt and then restart File Explorer or sign out:

```bat
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
```

## Requirements

- Windows 11

## Building from source

To compile the installer yourself you need:

- [Inno Setup 6](https://jrsoftware.org/isinfo.php) or newer
- `MenuIcon.ico` in the repository root
- `warning.txt` in the repository root, which is used for the setup prompt

Steps:

1. Clone this repository.
2. Open the `.iss` script in the Inno Setup Compiler.
3. Choose **Build > Compile**, or press Ctrl+F9.
4. The compiled installer is written to an `installer` folder as `WinContextMenuRestore.exe`.

You can also package the `.bat` file with IExpress instead of Inno Setup. See the
[IExpress Universal Shortcut](https://github.com/ImmuneMoon/iexpress-universal-shortcut) for quick access to that tool.

## ☕ Support the Project

If you find this project helpful and want to support further development by Fulllion Creative Works, consider leaving a tip!

* [Donate via PayPal](https://www.paypal.com/donate/?hosted_button_id=LCDZX75HR4CLC)
* [Support on Ko-fi](https://ko-fi.com/fulllion)

---
© 2026 Fulllion Creative Works. All rights reserved.
