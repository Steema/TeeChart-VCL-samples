# ---------------------------------------------------------------------------
!if !$d(BCB)
BCB = $(MAKEDIR)\..
!endif

# ---------------------------------------------------------------------------
# IDE SECTION
# ---------------------------------------------------------------------------
# The following section of the project makefile is managed by the BCB IDE.
# It is recommended to use the IDE to change any of the values in this
# section.
# ---------------------------------------------------------------------------

VERSION = BCB.06.00
# ---------------------------------------------------------------------------
PROJECT = TeeMapsC6.exe
OBJFILES = TeeMapsC6.obj UnitTestSHP.obj
RESFILES = TeeMapsC6.res
MAINSOURCE = TeeMapsC6.cpp
RESDEPEN = $(RESFILES) UnitTestSHP.dfm
LIBFILES = 
IDLFILES = 
IDLGENFILES = 
LIBRARIES = visualclx.lib dbxcds.lib cds.lib bdecds.lib bcbsmp.lib adortl.lib xmlrtl.lib
PACKAGES = Vcl.bpi Vclx.bpi Vcldb.bpi bdertl.bpi vcldbx.bpi bcbie.bpi vclie.bpi \
    inetdb.bpi inet.bpi Tee9c6.bpi TeeDB9c6.bpi TeeUI9c6.bpi TeePro9c6.bpi \
    TeeLanguage9c6.bpi TeeImage9c6.bpi rtl.bpi dbrtl.bpi TeeGL9c6.bpi
SPARELIBS = Vcl.lib vclx.lib vcldb.lib bdertl.lib vcldbx.lib tee9c6.lib teedb9c6.lib \
    teeui9c6.lib teepro9c6.lib teelanguage9c6.lib teeimage9c6.lib rtl.lib \
    dbrtl.lib xmlrtl.lib bdertl.lib vclie.lib adortl.lib bcbsmp.lib \
    visualclx.lib TeeGL9c6.lib
DEFFILE = 
OTHERFILES = 
# ---------------------------------------------------------------------------
DEBUGLIBPATH = $(BCB)\lib\debug
RELEASELIBPATH = $(BCB)\lib\release
USERDEFINES = 
SYSDEFINES = _RTLDLL;NO_STRICT;USEPACKAGES
INCLUDEPATH = $(TEEINCPATH);$(BCB)\include;$(BCB)\include\vcl
LIBPATH = $(TEELIBPATH);$(BCB)\lib\obj;$(BCB)\lib
WARNINGS= -w-par
PATHCPP = .;
PATHASM = .;
PATHPAS = .;
PATHRC = .;
PATHOBJ = .;$(LIBPATH)
# ---------------------------------------------------------------------------
CFLAG1 = -O2 -H=$(BCB)\lib\vcl60.csm -Hc -Vx -Ve -X- -a8 -b- -k- -vi -c -tW -tWM
IDLCFLAGS = 
PFLAGS = -$Y- -$L- -$D- -$C- -$A8 -I$(TEEINCPATH) -U$(TEELIBPATH) -Q -v -JPHNE -M
RFLAGS = 
AFLAGS = /mx /w2 /zn
LFLAGS = -D"" -aa -Tpe -x -Gn
# ---------------------------------------------------------------------------
ALLOBJ = c0w32.obj $(PACKAGES) sysinit.obj $(OBJFILES)
ALLRES = $(RESFILES)
ALLLIB = $(LIBFILES) $(LIBRARIES) import32.lib cp32mt.lib
# ---------------------------------------------------------------------------
!ifdef IDEOPTIONS

[Version Info]
IncludeVerInfo=0
AutoIncBuild=0
MajorVer=1
MinorVer=0
Release=0
Build=0
Debug=0
PreRelease=0
Special=0
Private=0
DLL=0

[Version Info Keys]
CompanyName=
FileDescription=
FileVersion=1.0.0.0
InternalName=
LegalCopyright=
LegalTrademarks=
OriginalFilename=
ProductName=
ProductVersion=1.0.0.0
Comments=

[Debugging]
DebugSourceDirs=$(BCB)\source\vcl

!endif





# ---------------------------------------------------------------------------
# MAKE SECTION
# ---------------------------------------------------------------------------
# This section of the project file is not used by the BCB IDE.  It is for
# the benefit of building from the command-line using the MAKE utility.
# ---------------------------------------------------------------------------

.autodepend
# ---------------------------------------------------------------------------
!if "$(USERDEFINES)" != ""
AUSERDEFINES = -d$(USERDEFINES:;= -d)
!else
AUSERDEFINES =
!endif

!if !$d(BCC32)
BCC32 = bcc32
!endif

!if !$d(CPP32)
CPP32 = cpp32
!endif

!if !$d(DCC32)
DCC32 = dcc32
!endif

!if !$d(TASM32)
TASM32 = tasm32
!endif

!if !$d(LINKER)
LINKER = ilink32
!endif

!if !$d(BRCC32)
BRCC32 = brcc32
!endif


# ---------------------------------------------------------------------------
!if $d(PATHCPP)
.PATH.CPP = $(PATHCPP)
.PATH.C   = $(PATHCPP)
!endif

!if $d(PATHPAS)
.PATH.PAS = $(PATHPAS)
!endif

!if $d(PATHASM)
.PATH.ASM = $(PATHASM)
!endif

!if $d(PATHRC)
.PATH.RC  = $(PATHRC)
!endif

!if $d(PATHOBJ)
.PATH.OBJ  = $(PATHOBJ)
!endif
# ---------------------------------------------------------------------------
$(PROJECT): $(OTHERFILES) $(IDLGENFILES) $(OBJFILES) $(RESDEPEN) $(DEFFILE)
    $(BCB)\BIN\$(LINKER) @&&!
    $(LFLAGS) -L$(LIBPATH) +
    $(ALLOBJ), +
    $(PROJECT),, +
    $(ALLLIB), +
    $(DEFFILE), +
    $(ALLRES)
!
# ---------------------------------------------------------------------------
.pas.hpp:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.pas.obj:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.cpp.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.cpp.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.asm.obj:
    $(BCB)\BIN\$(TASM32) $(AFLAGS) -i$(INCLUDEPATH:;= -i) $(AUSERDEFINES) -d$(SYSDEFINES:;= -d) $<, $@

.rc.res:
    $(BCB)\BIN\$(BRCC32) $(RFLAGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -fo$@ $<



# ---------------------------------------------------------------------------




