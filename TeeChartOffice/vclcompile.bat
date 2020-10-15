@echo off

rem Remove ALL

rmdir /s tmp

rem Compile

set rad=E:\Program Files (x86)\Embarcadero\Studio\21.0
set root=C:\root
set teechart=%root%\TeeChartVCL
set teechartoffice=%teechart%\Demos9\VCL\TeeChartOffice

rem 32bit
cd sources
"%rad%\bin\dcc32" -B -Q -U"%rad%\lib\win32\release" -NSSystem;VCLTee;Data;WinAPI;VCL;System.Win;Data.Win;VCL.Imaging -U%teechart%\sources9\vcl -I%teechart%\sources9\vcl TeeChartOffice.dpr

cd ..
mkdir tmp
mkdir tmp\32bit
move sources\TeeChartOffice.exe tmp\32bit

rem Sign
"%root%\TeeAdmin\Keys\signtool" sign /v /f "%root%\TeeAdmin\Keys\steema.pfx" /p starling /d "TeeChart Office" /du "http://www.steema.com" /t "http://timestamp.verisign.com/scripts/timstamp.dll" "%teechartoffice%\tmp\32bit\TeeChartOffice.exe"

rem 64bit
cd sources
"%rad%\bin\dcc64" -B -Q -U"%rad%\lib\win64\release" -NSSystem;VCLTee;Data;WinAPI;VCL;System.Win;Data.Win;VCL.Imaging -U%teechart%\sources9\vcl -I%teechart%\sources9\vcl TeeChartOffice.dpr
cd ..

mkdir tmp\64bit
move sources\TeeChartOffice.exe tmp\64bit\TeeChartOffice.exe

rem Sign 
"%root%\TeeAdmin\Keys\signtool" sign /v /f "%root%\TeeAdmin\Keys\steema.pfx" /p starling /d "TeeChart Office" /du "http://www.steema.com" /t "http://timestamp.verisign.com/scripts/timstamp.dll" "%teechartoffice%\tmp\64bit\TeeChartOffice.exe"

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
%root%\teerecompile\zip\zip.exe -9 -q -r ..\TeeChartOffice_45_win32.zip *.*

cd ..
cd 64bit
%root%\teerecompile\zip\zip.exe -9 -q -r ..\TeeChartOffice_45_win64.zip *.*

cd ..
cd ..