@echo off
cls
if exist chm2txt.exe del chm2txt.exe
perlapp --force --nologo --add utf8 chm2txt.pl
