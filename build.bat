:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Builds Windows 32-bit and 64-bit gems for Windows
:: Usage: BuildWindowsGems VERSION
::
:: Make sure you have installed the following before running:
::   a. Windows SDK for Windows version you are on
::   b. Cmake
::   c. The 32-bit and 64-bit versions of msys2 for Ruby 2.4
::   d. Qt built with msys for both 32-bit and 64-bit Ruby 2.4
::      See BuildQt4Win32Ruby24.bat and BuildQt4Win64Ruby24.bat
::   e. Ruby version 2.4 both 32-bit and 64-bit version
::   f. Update all the paths below to your installations
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set MSYS64_64_PATH=C:\msys64
set RUBY27_64_PATH=C:\Ruby27-x64

:: Down to the main directory
::SET var=%cd%
::ECHO %var%
::cd ..
::SET var=%cd%
::ECHO %var%
::mkdir release

:: 64-bit version

:: Cleanup

set PATH=!MSYS64_64_PATH!\mingw64\bin;!PATH!
set PATH=!RUBY27_64_PATH!\bin;!PATH!
echo.
echo Cleanup
::call ruby -e "puts RUBY_VERSION"
::echo.
::call rake distclean

:: Build 64-bit
echo.
echo Building 64-bit
echo.

echo.
echo Ruby
call ruby -e "puts RUBY_VERSION"
echo.
call rake build

echo.

::move *.gem release
::move release\*.gemspec .

:exit

ENDLOCAL