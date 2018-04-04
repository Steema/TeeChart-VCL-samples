@echo off

rem Remove ALL

rmdir /s tmp

rem Compile

set d7=c:\program files (x86)\borland\delphi7
set xe5=c:\program files (x86)\embarcadero\rad studio\12.0

cd sources
"%d7%\bin\dcc32" -B -DFASTMM;PNGIMAGE -Q -R"%d7%\lib" -Uc:\root\teechartvcl\demos9\teemaker\pngimage -Uc:\root\teerecompile\fastmm -U..\..\..\sources9 -I..\..\..\sources9 TeeChartOffice.dpr

cd ..
mkdir tmp
mkdir tmp\32bit
move sources\TeeChartOffice.exe tmp\32bit

signcode -spc c:\root\teechartvcl\installers\signkeys\steema.spc -v c:\root\teechartvcl\installers\signkeys\steema.pvk tmp\32bit\TeeChartOffice.exe

cd sources
"%xe5%\bin\dcc64" -B -Q -U"%xe5%\lib\win64\release" -NSSystem;VCLTee;Data;WinAPI;VCL;System.Win;Data.Win;VCL.Imaging -U..\..\..\sources9\vcl -I..\..\..\sources9\vcl TeeChartOffice.dpr
cd ..

mkdir tmp\64bit
move sources\TeeChartOffice.exe tmp\64bit\TeeChartOffice.exe

signcode -spc c:\root\teechartvcl\installers\signkeys\steema.spc -v c:\root\teechartvcl\installers\signkeys\steema.pvk tmp\64bit\TeeChartOffice.exe

rem Copy extra files

copy Readme.txt tmp\32bit
copy Readme.txt tmp\64bit

mkdir tmp\32bit\Samples
mkdir tmp\64bit\Samples

xcopy /Q Samples\*.tee tmp\32bit\Samples
xcopy /Q Samples\*.tee tmp\64bit\Samples

mkdir tmp\32bit\Data
mkdir tmp\64bit\Data

xcopy /Q Data\*.* tmp\32bit\Data
xcopy /Q Data\*.* tmp\64bit\Data

rem Create zips

cd tmp

cd 32bit
c:\root\teerecompile\zip\zip.exe -9 -q -r ..\TeeChartOffice_41_win32.zip *.*

cd ..
cd 64bit
c:\root\teerecompile\zip\zip.exe -9 -q -r ..\TeeChartOffice_41_win64.zip *.*

cd ..


