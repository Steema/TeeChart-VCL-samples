{**********************************************}
{   TeeChart Office - Constant strings         }
{   Copyright (c) 2010 by David Berneda        }
{   All Rights Reserved.                       }
{**********************************************}
unit TeeChartOfficeConstants;
{$I TeeDefs.inc}

interface

Uses TeeOfficeConstants;

Const
  { DO NOT TRANSLATE ! }
  TeeChartOfficeKey          = '\Software\Steema Software\TeeChart Office';
  TeeChartOfficeBuild        = '4.0';
  TeeChartOfficeVersion      = 'TeeChart Office '+TeeChartOfficeBuild;
  TeeMsg_TeeChartOffice      = 'TeeChart Office';
  TeeSteemaMainURL           = TeeChartWeb+'products/TeeChartOffice';
  TeeSteemaSupportURL        = TeeChartWeb+'download/other_projects#office';
  TChartOfficeVersionURL     = 'http://www.teechart.net/files/teechartoffice/version.txt';
  TeeSteemaWebGallerySite    = 'http://www.chartAll.com';
  TeeMsg_URLMagic            = 'TEECHARTOFFICE';

var
  TeeMsg_SureToUploadChart,
  TeeMsg_BarWidth,
  TeeMsg_PieRotation,
  TeeMsg_OpenWithTeeChartOffice,

  TeeMsg_Chart1,

  TeeMsg_LeftWall,
  TeeMsg_BottomWall,
  TeeMsg_RightWall,
  TeeMsg_BackWall,

  TeeMsg_AxisDivider,
  TeeMsg_Table,
  TeeMsg_Query,
  TeeMsg_XMLFile,
  TeeMsg_ExcelFile,
  TeeMsg_ExcelEmptyFile,
  TeeMsg_Expression          : String;

Procedure TeeChartOfficeEnglish;
Procedure TeeChartOfficeSpanish;
Procedure TeeChartOfficeCatalan;
Procedure TeeChartOfficeGalician;
Procedure TeeChartOfficeGerman;
Procedure TeeChartOfficeFrench;
Procedure TeeChartOfficeBrazil;
Procedure TeeChartOfficeDanish;
Procedure TeeChartOfficeDutch;
Procedure TeeChartOfficeSwedish;
Procedure TeeChartOfficeChinese;
Procedure TeeChartOfficeChineseSimp;
Procedure TeeChartOfficePortuguese;
Procedure TeeChartOfficeRussian;
Procedure TeeChartOfficeItalian;
Procedure TeeChartOfficeNorwegian;
Procedure TeeChartOfficeJapanese;
Procedure TeeChartOfficePolish;
Procedure TeeChartOfficeSlovene;
Procedure TeeChartOfficeTurkish;
Procedure TeeChartOfficeHungarian;

implementation

Uses TeeProCo, SysUtils,
     TeeSpanish, TeeCatalan, TeeGerman, TeeFrench, TeeDanish, TeeDutch,
     TeeChinese, TeeBrazil, TeeSwedish, TeeChineseSimp, TeePortuguese,
     TeeRussian, TeeItalian, TeeNorwegian, TeeJapanese, TeePolish,
     TeeSlovene, TeeTurkish, TeeHungarian, TeeGalician;

Procedure TeeChartOfficeSpanish;

Procedure SetSpanishConstants;
begin
  TeeMsg_SureToUploadChart   :='¿Seguro que desea subir el gráfico a la Galeria Web?';
  TeeMsg_BarWidth            :='Ancho Barra %';
  TeeMsg_PieRotation         :='Rotación';
  TeeMsg_OpenWithTeeChartOffice :='Abrir con &TeeChart Office';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_LeftWall           :='Pared Izquierda';
  TeeMsg_BottomWall         :='Pared Inferior';
  TeeMsg_RightWall          :='Pared Derecha';
  TeeMsg_BackWall           :='Pared Trasera';
  TeeMsg_AxisDivider        :='Divisor de ejes';
  TeeMsg_PieTool            :='Porciones Pastel';
  TeeMsg_XMLFile            :='Archivos XML';
  TeeMsg_ExcelFile          :='Archivos Excel';
  TeeMsg_ExcelEmptyFile     :='El nombre de archivo Excel está vacio.';
  TeeMsg_Expression         :='Expresión';
end;

begin
  TeeOfficeSpanish;
  SetSpanishConstants;

  if TeeSpanishLanguage.IndexOf('SERIES LIST')=-1 then
  with TeeSpanishLanguage do
    Text:=Text+#13+
    'SERIES LIST=Lista de Series'#13+
    'WEB CHARTS GALLERY=Galería de Gráficos en Web'#13+
    'TEECHART WEB=Web de TeeChart'#13+
    'X VALUES=Valores X'#13+
    'SHOW AT LEGEND=Ver en Leyenda'#13+
    'SHOW SERIES MARKS=Ver Marcas en puntos'#13+
    'WALL=Pared'#13+
    'SERIES MARKS=Marcas de Series'#13+
    'AXIS LINE=Linea de Eje'+#13+
    'MINOR GRID=Rejilla menor'#13+
    'AXIS DIVIDER=Divisor de Ejes'#13+
    'PIE SLICES=Porciones de Pastel'#13+
    'TEECHART OFFICE OPTIONS=Opciones de TeeChart Office'#13+
    'LEFT WALL=Pared Izquierda'#13+
    'BOTTOM WALL=Pared Inferior'#13+
    'RIGHT WALL=Pared Derecha'#13+
    'BACK WALL=Pared Trasera'#13+
    'STAIRS INVERTED=Escalera Inv.'#13+
    'LOAD CHART FROM WEB ADDRESS=Cargar gráfico de Web'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Ver la Galería de Gráficos en www.Steema.com'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Subir su Gráfico a la Galería en el Web'#13+
    'TEECHART OFFICE WEB GALLERY=Galería de Gráficos en el Web'#13+
    'CHART NAME=Nombre Gráfico'#13+
    'AXIS 2=Eje 2';
end;

Procedure TeeChartOfficeGalician;

Procedure SetGalicianConstants;
begin
  TeeMsg_SureToUploadChart   :='¿Seguro que desea subir el gráfico a la Galeria Web?';
  TeeMsg_BarWidth            :='Ancho Barra %';
  TeeMsg_PieRotation         :='Rotación';
  TeeMsg_OpenWithTeeChartOffice :='Abrir con &TeeChart Office';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_LeftWall           :='Pared Izquierda';
  TeeMsg_BottomWall         :='Pared Inferior';
  TeeMsg_RightWall          :='Pared Derecha';
  TeeMsg_BackWall           :='Pared Trasera';
  TeeMsg_AxisDivider        :='Divisor de ejes';
  TeeMsg_PieTool            :='Porciones Pastel';
  TeeMsg_XMLFile            :='Archivos XML';
  TeeMsg_ExcelFile          :='Archivos Excel';
  TeeMsg_ExcelEmptyFile     :='El nombre de archivo Excel está vacio.';
  TeeMsg_Expression         :='Expresión';
end;

begin
  TeeOfficeGalician;
  SetGalicianConstants;

  if TeeGalicianLanguage.IndexOf('SERIES LIST')=-1 then
  with TeeGalicianLanguage do
    Text:=Text+#13+
    'SERIES LIST=Lista de Series'#13+
    'WEB CHARTS GALLERY=Galería de Gráficos en Web'#13+
    'TEECHART WEB=Web de TeeChart'#13+
    'X VALUES=Valores X'#13+
    'SHOW AT LEGEND=Ver en Leyenda'#13+
    'SHOW SERIES MARKS=Ver Marcas en puntos'#13+
    'WALL=Pared'#13+
    'SERIES MARKS=Marcas de Series'#13+
    'AXIS LINE=Linea de Eje'+#13+
    'MINOR GRID=Rejilla menor'#13+
    'AXIS DIVIDER=Divisor de Ejes'#13+
    'PIE SLICES=Porciones de Pastel'#13+
    'TEECHART OFFICE OPTIONS=Opciones de TeeChart Office'#13+
    'LEFT WALL=Pared Izquierda'#13+
    'BOTTOM WALL=Pared Inferior'#13+
    'RIGHT WALL=Pared Derecha'#13+
    'BACK WALL=Pared Trasera'#13+
    'STAIRS INVERTED=Escalera Inv.'#13+
    'LOAD CHART FROM WEB ADDRESS=Cargar gráfico de Web'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Ver la Galería de Gráficos en www.Steema.com'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Subir su Gráfico a la Galería en el Web'#13+
    'TEECHART OFFICE WEB GALLERY=Galería de Gráficos en el Web'#13+
    'CHART NAME=Nombre Gráfico'#13+
    'AXIS 2=Eje 2'
  ;
end;

Procedure TeeChartOfficeCatalan;

Procedure SetCatalanConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Selecciona';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Obrir';
  TeeMsg_New                 :='Nou';
  TeeMsg_ImportingWeb        :='Important del Web: %s';
  TeeMsg_Annotation          :='Anotació';
  TeeMsg_Modified            :='Modificat';

  TeeMsg_Next                :='&Seguent >';
  TeeMsg_OK                  :='Aceptar';
  TeeMsg_Close               :='Tancar';
  TeeMsg_Go                  :='&Anar !';
  TeeMsg_Upload              :='&Pujar !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='Ja té l''última versió.';
  TeeMsg_ClickToUpdateVersion:='Premi Actualitzar per rebre la versió actualitzada.';
  TeeMsg_UpdateButton        :='&Actualitza...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Seleccionar carpeta';
  TeeMsg_EmailNotValid       :='L''adreça de Correu no és correcte.';
  TeeMsg_NameNotValid        :='Si us plau escrigui el seu Nom.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                               'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                               'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='La Clau s''ha enviat a la seva adreça de Correu.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Editor de Títol';
  TeeMsg_BarWidth            :='Ample Barra %';
  TeeMsg_EnterValue          :='Entrar valor';
  TeeMsg_PieRotation         :='Rotació';
  TeeMsg_PointWidth          :='Ample';
  TeeMsg_PointHeight         :='Alt';

  TeeMsg_Position            :='Posició: %d,%d';
  TeeMsg_Size                :='Tamany: %d x %d';

  TeeMsg_BetaWarning         :='Nota: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Obrir amb &TeeChart Office';

  TeeMsg_Caps               :='MAJU';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='DES';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Guardar com...';
  TeeMsg_LeftWall           :='Paret Esquerra';
  TeeMsg_BottomWall         :='Paret Inferior';
  TeeMsg_RightWall          :='Paret Dreta';
  TeeMsg_BackWall           :='Paret Posterior';

  TeeMsg_ShouldClose        :='Si us plau tanqui i tornir a arrencar TeeChartOffice.';
  TeeMsg_AxisDivider        :='Divisor d''eixos';
  TeeMsg_PieTool            :='Porcions Pastís';
  TeeMsg_Table              :='Taula';
  TeeMsg_Query              :='Consulta';
  TeeMsg_XMLFile            :='Arxius XML';
  TeeMsg_ExcelFile          :='Arxius Excel';
  TeeMsg_ExcelEmptyFile     :='El nom de l''arxiu Excel está buit.';
  TeeMsg_Expression         :='Expressió';
end;

begin
  TeeOfficeCatalan;
  SetCatalanConstants;

  if TeeCatalanLanguage=nil then
  with TeeCatalanLanguage do
    Text:=Text+#13+
    'SERIES LIST=Llista de Series'#13+
    'GALLERY=Galería'+#13+
    'TOOLBARS=Barres d''Eines'#13+
    'PAGE=Pàgina'#13+
    'AS TAB=Com tapeta'#13+
    'AS WINDOW=Com finestre'#13+
    'HIDE=Ocultar'#13+
    'WEB CHARTS GALLERY=Galería de Gráfics al Web'#13+
    'UPDATE VERSION=Actualitzar versió'#13+
    'TEXT MODE=Modus Texte'#13+
    'TEECHART WEB=Web de TeeChart'#13+
    'ONLINE SUPPORT=Suport en línea'#13+
    'EXIT=Sortir'#13+
    'SEND BY E-MAIL=Enviar per Correu'#13+
    'TEXT LABELS=Etiquetes'#13+
    'X VALUES=Valors X'#13+
    'DUPLICATE=Duplicar'#13+
    'SELECT ALL=Seleccionar Totes'#13+
    'MOVE UP=Moure a dalt'#13+
    'MOVE DOWN=Moure a baix'#13+
    'HIDE SERIES LIST=Ocultar Llista'#13+
    'VIEW 3D=Veure en 3D'#13+
    'AUTO SIZE=Tamany Autom.'#13+
    'ADD ANNOTATION=Afegir Anotació'#13+
    'ENABLE ZOOM=Permetre Zoom'#13+
    'ENABLE SCROLL=Permetre Desplazament'#13+
    'DRAW LINES=Dibuixar Linees'#13+
    'SHOW HINTS=Veure Ajudes'#13+
    'COLOR EACH POINT=Colorejar punts'#13+
    'SHOW AT LEGEND=Veure a Legenda'#13+
    'SHOW SERIES MARKS=Veure Marques a punts'#13+
    'PROPERTY=Propietat'#13+
    'MODIFIED=Modificat'#13+
    'WALL=Paret'#13+
    'SERIES MARKS=Marques de Series'#13+
    'SIDE MARGINS=Marges laterals'#13+
    'RIGHT SIDE=Costat dret'#13+
    'ALIGN TO TOP=Alinear a dalt'#13+
    'ALIGN TO BOTTOM=Alinear a baix'#13+
    'FONT COLOR=Color de Font'#13+
    'FONT NAME=Nom de Font'#13+
    'FONT SIZE=Tamany de Font'#13+
    'BOLD=Negreta'#13+
    'ITALIC=Cursiva'#13+
    'UNDERLINE=Subrallat'#13+
    'STRIKE OUT=Taxat'#13+
    'LEFT JUSTIFY=Ajustar a la Esquerra'#13+
    'RIGHT JUSTIFY=Ajustar a la Dreta'#13+
    'INTER-CHAR SIZE=Espai entre caracters'#13+
    'HIDE INSPECTOR=Ocultar Inspector'#13+
    'SELECT=Selecciona'#13+
    'CUSTOM POSITION=Posició person.'#13+
    'AXIS LINE=Linea d''Eix'+#13+
    'MINOR GRID=Rejilla menor'#13+
    'CAPS=MAJU'#13+
    'NUM=NUM'#13+
    'SCR=DES'#13+
    'YES=Sí'#13+
    'NO=No'#13+
    'CHECK-BOXES=Casillas'#13+
    'ANNOTATION=Anotació'#13+
    'CONNECT TO STEEMA.COM TO UPDATE THIS SOFTWARE.=Conecti a Steema.com per actualitzar la versió.'#13+
    'CURRENT VERSION=Versió actual'#13+
    'LATEST VERSION=Ultima versió'#13+
    'CONNECT=Conectar'#13+
    'UPDATE=Actualitzar'#13+
    'HANDLES=Llápis'#13+
    'AXIS DIVIDER=Divisor d''Eixos'#13+
    'PIE SLICES=Porcions de Pastel'#13+
    'DRAG STYLE=Estil arrastre'#13+
    'TEECHART OFFICE OPTIONS=Opcions de TeeChart Office'#13+
    'LANGUAGE=Llenguatje'#13+
    'RED=Vermell'#13+
    'GREEN=Verd'#13+
    'BLUE=Blau'#13+
    'WHITE=Blanco'#13+
    'YELLOW=Groc'#13+
    'BLACK=Negre'#13+
    'SILVER=Plata'#13+
    'DKGRAY=Gris fosc'#13+
    'BTNFACE=Gris'#13+
    'GRAY SCALE VISUAL=Grisos visual'#13+
    'INVERTED GRAY SCALE=Grisos Invertits'#13+
    'LEFT WALL=Paret Esquerra'#13+
    'BOTTOM WALL=Paret Inferior'#13+
    'RIGHT WALL=Paret Dreta'#13+
    'BACK WALL=Paret Darrera'#13+
    'STAIRS INVERTED=Escala Inv.'#13+
    'FORMATTING=Format'#13+
    'FLOATING POINT=Decimal'#13+
    'DATE-TIME=Data / Hora'#13+
    'CHOOSE AN OPTION=Escolli una opció'+#13+
    'IMPORTING FROM WEB: %S=Agafant del web: %s'#13+
    'LOAD CHART FROM WEB ADDRESS=Agafar gráfic del Web'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Veure la Galería de Gràfics a www.Steema.com'#13+
    'GO !=Anar !'#13+
    'UPLOAD !=Pujar !'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Pujar el seu Gràfic a la Galería al Web'#13+
    'TEECHART OFFICE WEB GALLERY=Galería de Gràfics al Web'#13+
    'YOUR NAME=El seu Nom'#13+
    'YOUR E-MAIL=El seu e-Mail'#13+
    'PASSWORD=Mot de clau'#13+
    'OBTAIN PASSWORD=Obtenir Clau'#13+
    'CHART NAME=Nom Gràfic'#13+
    'FIRST=Primera'#13+
    'PRIOR=Anterior'#13+
    'NEXT=Seguent'#13+
    'LAST=Ultima'#13+
    'CREATE NEW DATASET=Crear nova Taula o Consulta'#13+
    'DATASET STYLE=Tipus de Base de Dades'#13+
    'SQL QUERY=Consulta SQL'#13+
    'FROM=Desde'#13+
    'TO=Fins'#13+
    'STEP=Cada'#13+
    'VALUE=Valor'#13+
    'EXCEL FILE=Arxiu Excel'#13+
    'WORKSHEET=Llibre'#13+
    'VALUES RANGE=Rang Valors'#13+
    'LABELS RANGE=Rang Textes'#13+
    'FOCUS=Resaltar'#13+
    'EXPLODE=Expandir';
end;

Procedure SetEnglishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

Procedure TeeChartOfficeEnglish;
begin
  SetEnglishConstants;
  TeeSetEnglish;
end;

Procedure TeeChartOfficeGerman;

Procedure SetGermanConstants;
begin
  TeeMsg_ZoomInstructions    :='Ziehen Sie die Maus nach rechts unten für Zoom.';
  TeeMsg_ScrollInstructions  :='Ziehen Sie die Maus, um die Chartinhalte zu srollen.';
  TeeMsg_DrawLineInstructions:='Ziehen Sie die Maus, um Linien zu zeichnen, auszuwählen und zu bewegen.';

  TeeMsg_SureToDeleteDataSet :='Soll der Datensatz wirklich gelöscht werden?'; 
  TeeMsg_Select              :='Auswählen'; 
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Öffnen';
  TeeMsg_New                 :='Neu'; 
  TeeMsg_ImportingWeb        :='Aus dem Web importieren: %s'; 
  TeeMsg_Annotation          :='Kommentar'; 
  TeeMsg_Modified            :='Modifiziert'; 
 
  TeeMsg_Next                :='&Nächster>'; 
  TeeMsg_OK                  :='OK'; 
  TeeMsg_Close               :='Schließen'; 
  TeeMsg_Go                  :='&Go !'; 
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Kann nicht verbinden, um aktuelle Version zu erhalten.' 
                                +#13+'Fehler: %d %s'; 
 
  TeeMsg_CannotGetNewVersion :='Kann aktuelle Version nicht herunterladen.'+#13+'Fehler: %d %s'; 
 
  TeeMsg_WrongVersion        :='Falsche Version erhalten.'; 
  TeeMsg_HasLatestVersion    :='Sie besitzen bereits die letzte Version.';
  TeeMsg_ClickToUpdateVersion:='Klicken Sie die Schaltfläche ''Update'', um die letzt Version zu erhalten.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Falscher File der Version empfangen.';
  TeeMsg_VersionReceived     :='Letzte Version empfangen. Klicken Sie OK zur Installation.';

  TeeMsg_SelectFolder        :='Ordner auswählen';
  TeeMsg_EmailNotValid       :='Email-Adresse ist nicht korrekt.';
  TeeMsg_NameNotValid        :='Ihr Name ist leer. Bitte geben Sie Ihren Namen an.';
  TeeMsg_WrongPassword       :='Paßwort ist leer. Bitte geben Sie Ihr Paßwort an oder'
                                +#13+'klicken Sie auf ''Paßwort erhalten'', um es als e-mail zu empfangen.';
  TeeMsg_WrongChartID        :='Chartname ist leer. Bitte geben Sie einen Chartnamen an, um ihn '+' in der Datenbank der Web-Galerie zu identifizieren.';
 
  TeeMsg_CannotObtainPassword:='Kann nicht verbinden, um Ihr Paßwort zu erhalten.'; 
  TeeMsg_PasswordSent        :='Ihr Paßwort wurde an Ihre  e-mail Adresse gesendet.';
  TeeMsg_Congrats            :='Gratulation.'+#13+'Sie stehen in der Anwender-Datenbank der TeeChart Office'+'Web Charts-Galerie.'+#13+TeeMsg_PasswordSent;
 
  TeeMsg_UploadingWeb        :='Speichern von %s in die Web Galerie...';
  TeeMsg_Uploaded            :='%s wurde in die Web Galerie gespeichert.';
  TeeMsg_SureToUploadChart   :='Sind Sie sicher, den aktuellen Chart zur Web Galerie zu speichern?'; 
 
  TeeMsg_TitleEditor         :='Titel Editor'; 
  TeeMsg_BarWidth            :='Säulenbreite %'; 
  TeeMsg_EnterValue          :='Wert eingeben'; 
  TeeMsg_PieRotation         :='Drehung'; 
  TeeMsg_PointWidth          :='Breite';
  TeeMsg_PointHeight         :='Höhe'; 
 
  TeeMsg_Position            :='Position: %d,%d'; 
  TeeMsg_Size                :='Größe: %d x %d'; 
 
  TeeMsg_BetaWarning         :='Achtung: '+'Das ist eine Pre-Release Software.'+#13+#13+
                               'Einige Features können unvollständig oder'+#13+
                               ' in der späteren Produkt-Version entfernt sein.'+#13+#13+
                               'Geben Sie Probleme und Vorschläge in unsere Website:'+#13+#13+
                               'www.steema.com';
 
  TeeMsg_OpenWithTeeChartOffice :='Öffnen mit &TeeChart Office'; 
 
  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Speichern unter...';
  TeeMsg_LeftWall           :='Linke Wand';
  TeeMsg_BottomWall         :='Untere Wand';
  TeeMsg_RightWall          :='Rechte Wand';
  TeeMsg_BackWall           :='Hintere Wand';
  TeeMsg_ShouldClose        :='Bitte schließen und starten Sie TeeChart Office neu.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetGermanConstants;

  if TeeGermanLanguage=nil then
  begin
    TeeCreateGerman;
    with TeeGermanLanguage do
    Text:=Text+#13+
    'NEW USING WIZARD=Neuer Assistent'#13+
    'OPEN=Öffnen'+#13+
    'SAVE AS=Speichern unter'#13+
    'REOPEN=Wiederherstellen'#13+
    'ABOUT=Über'+#13+
    'PROPERTIES=Eigenschaft'+#13+
    'CHART TOOLS=Werkzeuge'+#13+
    'HELP INDEX=Hilfe Index'+#13+
    'WHAT''S THIS ?=Was ist das?'+#13+
    'VIEW=Sehen'+#13+
    'STATUS BAR=Statusbalken'+#13+
    'SERIES LIST=Liste der Reihen'#13+
    'GALLERY=Galerie'+#13+
    'TOOLBARS=Toolbox'#13+
    'PAGE=Seite'#13+
    'AS TAB=Als Register'#13+
    'AS WINDOW=Als Fenster'#13+
    'HIDE=Verbergen'#13+
    'WEB CHARTS GALLERY=Web Charts Galerie'#13+
    'UPDATE VERSION=Version aktualisieren'#13+
    'TEXT MODE=Textmodus'#13+
    'TEECHART WEB=TeeChart Web'#13+
    'ONLINE SUPPORT=Online Support'#13+
    'EXIT=Verlassen'#13+
    'SEND BY E-MAIL=Als E-mail senden'#13+
    'TEXT LABELS=Text Labels'#13+
    'X VALUES=X Werte'#13+
    'DUPLICATE=Dublizieren'#13+
    'SELECT ALL=Alles auswählen'#13+
    'MOVE UP=Nach oben bewegen'#13+
    'MOVE DOWN=Nach unten bewegen'#13+
    'HIDE SERIES LIST=Reihenliste verbergen'#13+
    'VIEW 3D=3D Ansicht'#13+
    'AUTO SIZE=Autom. Größe'#13+
    'ADD ANNOTATION=Kommentar hinzufügen'#13+
    'ENABLE ZOOM=Zoom erlauben'#13+
    'ENABLE SCROLL=Scroll erlauben'#13+
    'DRAW LINES=Linien zeichnen'#13+
    'SHOW HINTS=Hinweise anzeigen'#13+
    'COLOR EACH POINT=Jeder Punkt farbig'#13+
    'SHOW AT LEGEND=In Legende anzeigen'#13+
    'SHOW SERIES MARKS=ReihenMarks anzeigen'#13+
    'PROPERTY=Eigenschaft'#13+
    'MODIFIED=Verändert'#13+
    'WALL=Wand'#13+
    'SERIES MARKS=ReihenMarks'#13+
    'SIDE MARGINS=Randabstände'#13+
    'RIGHT SIDE=Rechte Seite'#13+
    'ALIGN TO TOP=Obere Ausrichtung'#13+
    'ALIGN TO BOTTOM=Untere Ausrichtung'#13+
    'FONT COLOR=Schriftfarbe'#13+
    'FONT NAME=Schriftname'#13+
    'FONT SIZE=Schriftgröße'#13+
    'BOLD=Fett'#13+
    'ITALIC=Kursiv'#13+
    'UNDERLINE=Unterstrichen'#13+
    'STRIKE OUT=Durchgestrichen'#13+
    'LEFT JUSTIFY=Linksbündig'#13+
    'RIGHT JUSTIFY=Rechsbündig'#13+
    'INTER-CHAR SIZE=Abstand zwischen Buchstaben'#13+
    'HIDE INSPECTOR=Inspector verbergen'#13+
    'SELECT=Auswählen'#13+
    'CUSTOM POSITION=Benutzerdef. Position'#13+
    'AXIS LINE=Achslinie'+#13+
    'MINOR GRID=Untergitter'#13+
    'CAPS=Großbuchstabe'#13+
    'NUM=NUM'#13+
    'SCR=SCR'#13+
    'YES=Ja'#13+
    'NO=Nein'#13+
    'CHECK-BOXES=Kontrollkästchen'#13+
    'ANNOTATION=Kommentar'#13+
    'CONNECT TO STEEMA.COM TO UPDATE THIS SOFTWARE.=Verbinden mit Steema.com zur Aktualisierung ihrer Version.'#13+
    'CURRENT VERSION=Aktuelle Version'#13+
    'LATEST VERSION=Letzte Version'#13+
    'CONNECT=Verbinden'#13+
    'UPDATE=Aktualisieren'#13+
    'HANDLES=Lápiz'#13+
    'AXIS DIVIDER=Achsteiler'#13+
    'PIE SLICES=Kreisscheiben'#13+
    'DRAG STYLE=Stil ziehen'#13+
    'TEECHART OFFICE OPTIONS=TeeChart Office Optionen'#13+
    'LANGUAGE=Sprache'#13+
    'RED=Rot'#13+
    'GREEN=Green'#13+
    'BLUE=Blau'#13+
    'WHITE=Weiß'#13+
    'YELLOW=Gelb'#13+
    'BLACK=Schwarz'#13+
    'SILVER=Silber'#13+
    'DKGRAY=Dunkelgrau'#13+
    'BTNFACE=Grau'#13+
    'GRAY SCALE VISUAL=Graustufen'#13+
    'INVERTED GRAY SCALE=Inverse Graustufen'#13+
    'LEFT WALL=Linke Wand'#13+
    'BOTTOM WALL=Untere Wand'#13+
    'RIGHT WALL=Rechte Wand'#13+
    'BACK WALL=Hintere Wand'#13+
    'STAIRS INVERTED=Inv. Treppen'#13+
    'FORMATTING=Formatieren'#13+
    'FLOATING POINT=Dezimal'#13+
    'DATE-TIME=Datum/Uhrzeit'#13+
    'CHOOSE AN OPTION=Option auswählen'#13+
    'IMPORTING FROM WEB: %S=Aus dem Web importieren: %s'#13+
    'LOAD CHART FROM WEB ADDRESS=Chart aus Web-Adresse laden'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=TeeChart Galerie unter www.Steema.com durchsuchen'#13+
    'GO !=Los !'#13+
    'UPLOAD !=Hochladen !'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Aktuellen Chart zur Web-Galerie hochladen'#13+
    'TEECHART OFFICE WEB GALLERY=TeeChart Office Web Galerie'#13+
    'YOUR NAME=Ihr Name'#13+
    'YOUR E-MAIL=Ihre E-mail'#13+
    'PASSWORD=Paßwort'#13+
    'OBTAIN PASSWORD=Paßwort erhalten'#13+
    'CHART NAME=Chart-Name'#13
    ;
  end;
  TeeSetGerman;
end;

Procedure SetFrenchConstants;
begin
  TeeMsg_ZoomInstructions :='Glissez la souris en bas à droite pour agrandir. En haut à gauche pour réduire.';
  TeeMsg_ScrollInstructions :='Glissez la souris pour faire défiler le contenu du graphique.';
  TeeMsg_DrawLineInstructions:='Glissez la souris pour dessiner, sélectionner ou déplacer des lignes.'; 
  TeeMsg_SureToDeleteDataSet :='Êtes-vous sûr de vouloir supprimer DataSet ?';
  TeeMsg_Select :='Sélectionnez';
  TeeMsg_EMail :='e-mail';
  TeeMsg_Open :='Ouvrir';
  TeeMsg_New :='Nouveau';
  TeeMsg_ImportingWeb :='Importation de : %s du Web';
  TeeMsg_Annotation :='Annotation';
  TeeMsg_Modified :='Modifié'; 
  TeeMsg_Next :='Suite >';
  TeeMsg_OK :='OK';
  TeeMsg_Close :='Fermer';
  TeeMsg_Go :='&Go !';
  TeeMsg_Upload :='Envoyer !'; 
  TeeMsg_CannotGetVersion :='Impossible d''obtenir la version actuelle.'+#13+
  'Erreur : %d %s';
  TeeMsg_CannotGetNewVersion :='Impossible de télécharger la version actuelle.'+#13+
  'Erreur : %d %s'; 
  TeeMsg_WrongVersion :='Numéro de version reçu incorrect.';
  TeeMsg_HasLatestVersion :='Vous avez déjà la dernière version.';
  TeeMsg_ClickToUpdateVersion:='Cliquez sur le bouton Mise à jour pour obtenir la dernière version.';
  TeeMsg_UpdateButton :='Mise à jo&ur...';
  TeeMsg_WrongZip :='Version de fichier incorrecte.';
  TeeMsg_VersionReceived :='Dernière version reçue. Cliquez sur Ok pour l''''installer.';
  TeeMsg_SelectFolder :='Choisir dossier';
  TeeMsg_EmailNotValid :='Adresse e-mail incorrecte.';
  TeeMsg_NameNotValid :='Votre nom est vide. Veuillez saisir votre nom.';
  TeeMsg_WrongPassword :='Le mot de passe est vide. Veuillez saisir votre mot de passe ou '+#13+
  'cliquez sur le boton Obtenir mot de passe pour le recevoir par e-mail.';
  TeeMsg_WrongChartID :='Le nom du graphique est vide. Veuillez saisir le nom du graphique pour '+
  'l''identifier dans la base de données Galerie Web.';
  TeeMsg_CannotObtainPassword:='Connexion impossible pour obtenir votre mot de passe.';
  TeeMsg_PasswordSent :='Votre mot de passe vous a été envoyé à votre adresse e-mail.';
  TeeMsg_Congrats :='Félicitations.'+#13+'Vous avez été ajouté à la base de données '+
  'utilisateurs de la galerie Web de TeeChart Office.'+#13+
  TeeMsg_PasswordSent;
  TeeMsg_UploadingWeb :='Envoi de %s à la galerie Web...';
  TeeMsg_Uploaded :='%s a été envoyé vers la galerie Web.';
  TeeMsg_TitleEditor :='Editeur de titre';
  TeeMsg_EnterValue :='Entrez valeur';
  TeeMsg_PointWidth :='Largeur';
  TeeMsg_PointHeight :='Hauteur';
  TeeMsg_Position :='Position: %d,%d';
  TeeMsg_Size :='Taille : %d x %d';
  TeeMsg_BetaWarning :='Note: '+ 'Version préliminaire.'+#13+#13+
  'Certaines fonctions peuvent être incomplètes ou'+#13+
  'supprimées de la version finale.'+#13+#13+
  'Envoyez vos questions et suggestions à notre site Web :'+#13+#13+
  'www.steema.com';
  TeeMsg_Caps :='MAJ';
  TeeMsg_Num :='NUM';
  TeeMsg_SCR :='SCR';
  TeeMsg_SaveAs :='Enregistrer sous...';
  TeeMsg_ShouldClose :='Fermez et redémarrez l''application.'; 
  { pending }
  TeeMsg_Table :='Table';
  TeeMsg_Query :='Requète';

(* pending:
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Chart1             :='Chart1';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';

  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
*)
end;

Procedure TeeChartOfficeFrench;
begin
  SetFrenchConstants;

  if TeeFrenchLanguage=nil then
  begin
    TeeCreateFrench;
    with TeeFrenchLanguage do Text:=Text+
    'NEW USING WIZARD=Nouveau avec l''assistant'#13+
    'OPEN=Ouvrir'+#13+
    'SAVE AS=Enregistrer sous'#13+
    'SAVE AS...=Enregistrer sous...'#13+
    'REOPEN=Ré-ouvrir'#13+
    'ABOUT=A propos de'+#13+
    'PROPERTIES=Propriétés'+#13+
    'CHART TOOLS=Outils graphiques'+#13+
    'HELP INDEX=Index de l''Aide'+#13+
    'WHAT''S THIS ?=Qu''est-ce que c''est ?'+#13+
    'VIEW=Veure'+#13+
    'STATUS BAR=Barre d''état'+#13+
    'SERIES LIST=Liste des séries'#13+
    'GALLERY=Galerie'+#13+
    'TOOLBARS=Barres d''outils'#13+
    'PAGE=Pàgina'#13+
    'AS TAB=Comme onglet'#13+
    'AS WINDOW=Comme fenêtre'#13+
    'HIDE=Cacher'#13+
    'WEB CHARTS GALLERY=Galerie de graphiques sur le Web'#13+
    'UPDATE VERSION=Mise à jour'#13+
    'TEXT MODE=Mode texte'#13+
    'TEECHART WEB=Site Web de TeeChart'#13+
    'ONLINE SUPPORT=Assistance en-ligne'#13+
    'EXIT=Quitter'#13+
    'SEND BY E-MAIL=Envoyer par e-mail'#13+
    'TEXT LABELS=Etiquettes'#13+
    'X VALUES=Valeurs X'#13+
    'DUPLICATE=Dupliquer'#13+
    'SELECT ALL=Sélectionner tout'#13+
    'MOVE UP=Monter'#13+
    'MOVE DOWN=Descendre'#13+
    'HIDE SERIES LIST=Cacher liste des séries'#13+
    'VIEW 3D=Afficher en 3D'#13+
    'AUTO SIZE=Taille auto.'#13+
    'ADD ANNOTATION=Ajouter annotation'#13+
    'ENABLE ZOOM=Activer Zoom'#13+
    'ENABLE SCROLL=Activer défilement'#13+
    'DRAW LINES=Dibuixar Linees'#13+
    'SHOW HINTS=Afficher conseils'#13+
    'COLOR EACH POINT=Points en couleur'#13+
    'SHOW AT LEGEND=Veure a Legenda'#13+
    'SHOW SERIES MARKS=Voir les marques de séries'#13+
    'PROPERTY=Propriété'#13+
    'MODIFIED=Modifié'#13+
    'WALL=Mur'#13+
    'SERIES MARKS=Marques de Séries'#13+
    'SIDE MARGINS=Marges latérales'#13+
    'RIGHT SIDE=Côté droit'#13+
    'ALIGN TO TOP=Aligner en haut'#13+
    'ALIGN TO BOTTOM=Aligner en bas'#13+
    'FONT COLOR=Couleur police'#13+
    'FONT NAME=Nom police'#13+
    'FONT SIZE=Taille police'#13+
    'BOLD=Gras'#13+
    'ITALIC=Italique'#13+
    'UNDERLINE=Souligné'#13+
    'STRIKE OUT=Taxat'#13+
    'LEFT JUSTIFY=Justifier à gauche'#13+
    'RIGHT JUSTIFY=Justifier à droite'#13+
    'INTER-CHAR SIZE=Espace entre caractères'#13+
    'HIDE INSPECTOR=Cacher l''inspecteur'#13+
    'SELECT=Sélectionner'#13+
    'CUSTOM POSITION=Position personnalisée'#13+
    'AXIS LINE=Ligne d''axe'+#13+
    'MINOR GRID=Grille secondaire'#13+
    'CAPS=MAJ'#13+
    'NUM=NUM'#13+
    'SCR=DES'#13+
    'YES=Oui'#13+
    'NO=Non'#13+
    'CHECK-BOXES=Cases à cocher'#13+
    'ANNOTATION=Annotation'#13+
    'CONNECT TO STEEMA.COM TO UPDATE YOUR TEECHART OFFICE VERSION.=Se connecter à Steema.com pour mettre à jour la version.'#13+
    'CURRENT VERSION=Version actuelle'#13+
    'LATEST VERSION=Dernière version'#13+
    'CONNECT=Connecter'#13+
    'UPDATE=Actualiser'#13+
    'HANDLES=Poignées'#13+
    'AXIS DIVIDER=Diviseur'#13+
    'DRAG POINT=Déplacer les points'#13+
    'PIE SLICES=Secteurs'#13+
    'DRAG STYLE=Estil arrastre'#13+
    'TEECHART OFFICE OPTIONS=Options de TeeChart Office'#13+
    'LANGUAGE=Langue'#13+
    'RED=Rouge'#13+
    'GREEN=Vert'#13+
    'BLUE=Bleu'#13+
    'WHITE=Blanc'#13+
    'YELLOW=Jaune'#13+
    'BLACK=Noir'#13+
    'SILVER=Argent'#13+
    'DKGRAY=Gris foncé'#13+
    'BTNFACE=Gris'#13+
    'GRAY SCALE VISUAL=Echelle de gris'#13+
    'INVERTED GRAY SCALE=Echelle de gris inversée'#13+
    'LEFT WALL=Mur gauche'#13+
    'BOTTOM WALL=Mur bas'#13+
    'RIGHT WALL=Mur droit'#13+
    'BACK WALL=Mur arrière'#13+
    'STAIRS INVERTED=Echelle inv.'#13+
    'FORMATTING=Format'#13+
    'FLOATING POINT=Décimal'#13+
    'DATE-TIME=Date/Heure'#13+
    'CHOOSE AN OPTION=Choisir une option'+#13+
    'IMPORTING FROM WEB: %S=Réception du Web : %s'#13+
    'LOAD CHART FROM WEB ADDRESS=Réception du graphique'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Veure Galerie de graphiques sur www.Steema.com'#13+
    'GO !=Aller !'#13+
    'UPLOAD !=Envoyer !'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Envoyer votre graphique sur la galerie Web'#13+
    'TEECHART OFFICE WEB GALLERY=Galerie de graphiques sue le Web'#13+
    'YOUR NAME=Votre nom'#13+
    'YOUR E-MAIL=Votre e-Mail'#13+
    'PASSWORD=Mot de passe'#13+
    'OBTAIN PASSWORD=Obtenir mot de passe'#13+
    'CHART NAME=Nom Graphique'#13+
    'FIRST=Première'#13+
    'PRIOR=Précédente'#13+
    'NEXT=Suivante'#13+
    'LAST=Dernière'#13+
    'CREATE NEW DATASET=Créer nouveau jeu de données'#13+
    'DATASET STYLE=Type de jeu de données'#13+
    'SQL QUERY=Requète SQL'#13+
    'FROM=De'#13+
    'TO=à'#13+
    'STEP=Chaque'#13+
    'VALUE=Valeur'#13+
    'EXCEL FILE=Fichier Excel'#13+
    'WORKSHEET=Feuille'#13+
    'VALUES RANGE=Gamme de valeurs'#13+
    'LABELS RANGE=Gamme d''étiquettes'#13+
    'FOCUS=Focus'#13+
    'EXPLODE=Déplier';
  end;
  TeeSetFrench;
end;

Procedure SetBrazilConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

Procedure TeeChartOfficeBrazil;
begin
  SetBrazilConstants;

  if TeeBrazilLanguage=nil then
  begin
    TeeCreateBrazil;
    with TeeBrazilLanguage do ;
  end;
  TeeSetBrazil;
end;

Procedure TeeChartOfficeDanish;

Procedure SetDanishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetDanishConstants;

  if TeeDanishLanguage=nil then
  begin
    TeeCreateDanish;
    with TeeDanishLanguage do ;
  end;

  TeeSetDanish;
end;

Procedure TeeChartOfficeDutch;

Procedure SetDutchConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetDutchConstants;

  if TeeDutchLanguage=nil then
  begin
    TeeCreateDutch;
    with TeeDutchLanguage do ;
  end;

  TeeSetDutch;
end;

Procedure TeeChartOfficeSwedish;

Procedure SetSwedishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetSwedishConstants;

  if TeeSwedishLanguage=nil then
  begin
    TeeCreateSwedish;
    with TeeSwedishLanguage do ;
  end;

  TeeSetSwedish;
end;

Procedure TeeChartOfficeChinese;

Procedure SetChineseConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetChineseConstants;

  if TeeChineseLanguage=nil then
  begin
    TeeCreateChinese;
    with TeeChineseLanguage do ;
  end;

  TeeSetChinese;
end;

Procedure TeeChartOfficeChineseSimp;

Procedure SetChineseSimpConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetChineseSimpConstants;

  if TeeChineseSimpLanguage=nil then
  begin
    TeeCreateChineseSimp;
    with TeeChineseSimpLanguage do ;
  end;

  TeeSetChineseSimp;
end;

Procedure TeeChartOfficePortuguese;

Procedure SetPortugueseConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetPortugueseConstants;

  if TeePortugueseLanguage=nil then
  begin
    TeeCreatePortuguese;
    with TeePortugueseLanguage do ;
  end;

  TeeSetPortuguese;
end;

Procedure TeeChartOfficeRussian;

Procedure SetRussianConstants;
begin
  TeeMsg_SureToUploadChart   :='Âû äåéñòâèòåëüíî õîòèòå çàãðóçèòü äèàãðàììó â Web Gallery?';
  TeeMsg_BarWidth            :='Øèðèíà ïîëîñû %';
  TeeMsg_PieRotation         :='Ïîâîðîò';
  TeeMsg_OpenWithTeeChartOffice :='Îòêðûòü â &TeeChart Office';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_LeftWall           :='Ëåâàÿ ãðàíèöà';
  TeeMsg_BottomWall         :='Íèæíÿÿ ãðàíèöà';
  TeeMsg_RightWall          :='Ïðàâàÿ ãðàíèöà';
  TeeMsg_BackWall           :='Çàäíÿÿ ãðàíèöà';
  TeeMsg_AxisDivider        :='Äåëèòåëü îñè';
  TeeMsg_PieTool            :='Ñåêòîðû';
  TeeMsg_XMLFile            :='XML ôàéëû';
  TeeMsg_ExcelFile          :='Excel ôàéëû';
  TeeMsg_ExcelEmptyFile     :='Èìÿ ôàéëà Excel íå çàïîëíåíî.';
  TeeMsg_Expression         :='Âûðàæåíèå';
end;

begin
  TeeOfficeRussian;
  SetRussianConstants;

  if TeeRussianLanguage.IndexOf('SERIES LIST')=-1 then
  with TeeRussianLanguage do
    Text:=Text+#13+
    'SERIES LIST=Ñïèñîê Ïîñëåäîâàòåëüíîñòåé'#13+
    'WEB CHARTS GALLERY=Äèàãðàììû WEB Gallery'#13+
    'TEECHART WEB=Äèàãðàììà èç Èíòåðíåòà'#13+
    'X VALUES=Çíà÷åíèÿ ïî X'#13+
    'SHOW AT LEGEND=Ïîêàçûâàòü â ëåãåíäå'#13+
    'SHOW SERIES MARKS=Ïîêàçûâàòü ìåòêè ïîñëåäîâàòåëüíîñòè'#13+
    'WALL=Ãðàíèöà'#13+
    'SERIES MARKS=Ìåòêè ïîñëåäîâàòåëüíîñòè'#13+
    'AXIS LINE=Ëèíèÿ îñè'+#13+
    'MINOR GRID=Óáûâàþùàÿ ðåøåòêà'#13+
    'AXIS DIVIDER=Äåëèòåëü îñè'#13+
    'PIE SLICES=Ñåêòîðû'#13+
    'TEECHART OFFICE OPTIONS=Íàñòðîéêè TeeChart Office'#13+
    'LEFT WALL=Ëåâàÿ ãðàíèöà'#13+
    'BOTTOM WALL=Ëåâàÿ ãðàíèöà'#13+
    'RIGHT WALL=Ïðàâàÿ ãðàíèöà'#13+
    'BACK WALL=Çàäíÿÿ ãðàíèöà'#13+
    'STAIRS INVERTED=Èíâ. ãðàäèåíò'#13+
    'LOAD CHART FROM WEB ADDRESS=Çàãðóçèòü ñ àäðåñà:'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Ïðîñìîòð WEB GALLERY íà WWW.STEEMA.COM'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Çàãðóçèòü òåêóùèóþ äèàãðàììó â Web Gallery '#13+
    'TEECHART OFFICE WEB GALLERY=Web Gallery TeeChart Office'#13+
    'CHART NAME=Íàçâàíèå äèàãðàììû'#13+
    'AXIS 2=Îñü 2';
end;

Procedure TeeChartOfficeItalian;

Procedure SetItalianConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetItalianConstants;

  if TeeItalianLanguage=nil then
  begin
    TeeCreateItalian;
    with TeeItalianLanguage do ;
  end;

  TeeSetItalian;
end;

Procedure TeeChartOfficeNorwegian;

Procedure SetNorwegianConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetNorwegianConstants;

  if TeeNorwegianLanguage=nil then
  begin
    TeeCreateNorwegian;
    with TeeNorwegianLanguage do ;
  end;

  TeeSetNorwegian;
end;

Procedure TeeChartOfficeJapanese;

Procedure SetJapaneseConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetJapaneseConstants;

  if TeeJapaneseLanguage=nil then
  begin
    TeeCreateJapanese;
    with TeeJapaneseLanguage do ;
  end;

  TeeSetJapanese;
end;

Procedure TeeChartOfficePolish;

Procedure SetPolishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetPolishConstants;

  if TeePolishLanguage=nil then
  begin
    TeeCreatePolish;
    with TeePolishLanguage do ;
  end;

  TeeSetPolish;
end;

Procedure TeeChartOfficeSlovene;

Procedure SetSloveneConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetSloveneConstants;

  if TeeSloveneLanguage=nil then
  begin
    TeeCreateSlovene;
    with TeeSloveneLanguage do ;
  end;

  TeeSetSlovene;
end;

Procedure TeeChartOfficeTurkish;

Procedure SetTurkishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetTurkishConstants;

  if TeeTurkishLanguage=nil then
  begin
    TeeCreateTurkish;
    with TeeTurkishLanguage do ;
  end;

  TeeSetTurkish;
end;

Procedure TeeChartOfficeHungarian;

Procedure SetHungarianConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mouse to right-bottom to zoom. To left-top to unzoom.';
  TeeMsg_ScrollInstructions  :='Drag mouse to scroll Chart contents.';
  TeeMsg_DrawLineInstructions:='Drag mouse to draw, select and move lines.';

  TeeMsg_SureToDeleteDataSet :='Are you sure to delete DataSet?';
  TeeMsg_Select              :='Select';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Open';
  TeeMsg_New                 :='New';
  TeeMsg_ImportingWeb        :='Importing from Web: %s';
  TeeMsg_Annotation          :='Annotation';
  TeeMsg_Modified            :='Modified';

  TeeMsg_Next                :='&Next >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Close';
  TeeMsg_Go                  :='&Go !';
  TeeMsg_Upload              :='&Upload !';

  TeeMsg_CannotGetVersion    :='Cannot connect to obtain current version.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='Cannot download current version.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Wrong version number received.';
  TeeMsg_HasLatestVersion    :='You already have the latest version.';
  TeeMsg_ClickToUpdateVersion:='Click the Update button to receive the latest version.';
  TeeMsg_UpdateButton        :='&Update...';
  TeeMsg_WrongZip            :='Wrong version file received.';
  TeeMsg_VersionReceived     :='Latest version received. Click Ok to Install.';

  TeeMsg_SelectFolder        :='Select Folder';
  TeeMsg_EmailNotValid       :='Email address is not correct.';
  TeeMsg_NameNotValid        :='Your Name is empty. Please type your name.';
  TeeMsg_WrongPassword       :='Password is empty. Please type your password or '+#13+
                              'click the Obtain Password button to receive it by e-mail.';
  TeeMsg_WrongChartID        :='Chart name is empty. Please type a Chart name to '+
                              'identify it at the Web Gallery database.';

  TeeMsg_CannotObtainPassword:='Cannot connect to obtain your Password.';
  TeeMsg_PasswordSent        :='Your Password has been sent to your email address.';
  TeeMsg_Congrats            :='Congratulations.'+#13+'You have been included in TeeChart Office '+
                              'Web Charts Gallery user database.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Uploading %s to Web Gallery...';
  TeeMsg_Uploaded       :='%s has been uploaded to Web Gallery.';
  TeeMsg_SureToUploadChart   :='Are you sure to upload the current Chart to Web Gallery?';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_BarWidth            :='Bar Width %';
  TeeMsg_EnterValue          :='Enter value';
  TeeMsg_PieRotation         :='Rotation';
  TeeMsg_PointWidth          :='Width';
  TeeMsg_PointHeight         :='Height';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Size: %d x %d';

  TeeMsg_BetaWarning         :='Note: '+
                              'This is Pre-Release Software.'+#13+#13+
                              'Some features might be incomplete or'+#13+
                              'removed in the final product version.'+#13+#13+
                              'Submit problems and suggestions at our web site:'+#13+#13+
                              'www.steema.com';

  TeeMsg_OpenWithTeeChartOffice :='Open with &TeeChart Office';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_Chart1             :='Chart1';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_LeftWall           :='Left Wall';
  TeeMsg_BottomWall         :='Bottom Wall';
  TeeMsg_RightWall          :='Right Wall';
  TeeMsg_BackWall           :='Back Wall';
  TeeMsg_ShouldClose        :='Please close and restart TeeChartOffice.';

  { pending }
  TeeMsg_AxisDivider        :='Axis Divider';
  TeeMsg_PieTool            :='Pie Slices';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
  TeeMsg_XMLFile            :='XML files';
  TeeMsg_ExcelFile          :='Excel files';
  TeeMsg_ExcelEmptyFile     :='Excel file name is empty.';
  TeeMsg_Expression         :='Expression';
end;

begin
  SetHungarianConstants;

  if TeeHungarianLanguage=nil then
  begin
    TeeCreateHungarian;
    with TeeHungarianLanguage do ;
  end;

  TeeSetHungarian;
end;

initialization
  SetEnglishConstants;
end.
