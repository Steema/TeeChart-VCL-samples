{**********************************************}
{   TeeChart Office - Constant strings         }
{   Copyright (c) 2001-2019 by Steema Software }
{   All Rights Reserved.                       }
{**********************************************}
unit TeeOfficeConstants;
{$I TeeDefs.inc}

interface

Const
  { DO NOT TRANSLATE ! }
  TeeChartServer             = 'http://www.steema.net/';
  TeeChartWeb                = 'http://www.steema.com/';
  TeeSteemaGetPassword       = TeeChartServer+'scripts/TeeGetPassword.exe';
  TeeSteemaUploadGallery     = TeeChartServer+'scripts/teeupload.exe?login=%s&Password=%s&ID=%s';

var
  TeeMsg_ZoomInstructions,
  TeeMsg_ScrollInstructions,
  TeeMsg_DrawLineInstructions,

  TeeMsg_SureToDeleteDataSet,
  TeeMsg_Select,
  TeeMsg_EMail,
  TeeMsg_Open,
  TeeMsg_New,
  TeeMsg_ImportingWeb,
  TeeMsg_Annotation,
  TeeMsg_Modified,

  TeeMsg_Next,
  TeeMsg_OK,
  TeeMsg_Close,
  TeeMsg_Go,
  TeeMsg_Upload,

  TeeMsg_CannotGetVersion,

  TeeMsg_CannotGetNewVersion,

  TeeMsg_WrongVersion,
  TeeMsg_HasLatestVersion,
  TeeMsg_ClickToUpdateVersion,
  TeeMsg_UpdateButton,
  TeeMsg_WrongZip,
  TeeMsg_VersionReceived,

  TeeMsg_SelectFolder,
  TeeMsg_EmailNotValid,
  TeeMsg_NameNotValid,
  TeeMsg_WrongPassword,

  TeeMsg_WrongChartID,
  TeeMsg_CannotObtainPassword,
  TeeMsg_PasswordSent,
  TeeMsg_Congrats,

  TeeMsg_UploadingWeb,
  TeeMsg_Uploaded,

  TeeMsg_TitleEditor,
  TeeMsg_EnterValue,
  TeeMsg_PointWidth,
  TeeMsg_PointHeight,

  TeeMsg_Position,
  TeeMsg_Size,

  TeeMsg_BetaWarning,

  TeeMsg_Caps,
  TeeMsg_Num,
  TeeMsg_SCR,

  TeeMsg_SaveAs,

  TeeMsg_ShouldClose,
   
  TeeMsg_Table,
  TeeMsg_Query             : String;

Procedure TeeOfficeEnglish;

Procedure TeeOfficeSpanish;
Procedure TeeOfficeCatalan;
Procedure TeeOfficeGalician;
Procedure TeeOfficeGerman;
Procedure TeeOfficeFrench;
Procedure TeeOfficeBrazil;
Procedure TeeOfficeDanish;
Procedure TeeOfficeDutch;
Procedure TeeOfficeSwedish;
Procedure TeeOfficeChinese;
Procedure TeeOfficeChineseSimp;
Procedure TeeOfficePortuguese;
Procedure TeeOfficeRussian;
Procedure TeeOfficeItalian;
Procedure TeeOfficeNorwegian;
Procedure TeeOfficeJapanese;
Procedure TeeOfficePolish;
Procedure TeeOfficeSlovene;
Procedure TeeOfficeTurkish;
Procedure TeeOfficeHungarian;

implementation

Uses TeeSpanish, TeeCatalan, TeeGerman, TeeFrench, TeeDanish, TeeDutch,
     TeeChinese, TeeBrazil, TeeSwedish, TeeChineseSimp, TeePortuguese,
     TeeRussian, TeeItalian, TeeNorwegian, TeeJapanese, TeePolish,
     TeeSlovene, TeeTurkish, TeeHungarian, TeeGalician,
     TeeConst, TeeProCo, SysUtils;

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

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
end;

Procedure TeeOfficeEnglish;
begin
  SetEnglishConstants;
  TeeSetEnglish;
end;

Procedure TeeOfficeSpanish;

Procedure SetSpanishConstants;
begin
  TeeMsg_ZoomInstructions    :='Arrastrar ratón derecha-abajo para zoom. Izquierda-arriba para quitar zoom.';
  TeeMsg_ScrollInstructions  :='Arrastrar ratón para desplazar el contenido del gráfico.';
  TeeMsg_DrawLineInstructions:='Arrastrar ratón para dibujar, seleccionar y mover lineas.';

  TeeMsg_SureToDeleteDataSet :='¿Seguro que desea eliminar la Tabla?';
  TeeMsg_Select              :='Selecciona';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Abrir';
  TeeMsg_New                 :='Nuevo';
  TeeMsg_ImportingWeb        :='Importando del Web: %s';
  TeeMsg_Annotation          :='Anotación';
  TeeMsg_Modified            :='Modific.';

  TeeMsg_Next                :='&Siguiente >';
  TeeMsg_OK                  :='Aceptar';
  TeeMsg_Close               :='Cerrar';
  TeeMsg_Go                  :='&Ir !';
  TeeMsg_Upload              :='&Subir !';

  TeeMsg_CannotGetVersion    :='No se puede obtener la versión más actual.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='No se puede descargar la versión más actual.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Número de versión recibido erróneo.';
  TeeMsg_HasLatestVersion    :='Ya tiene la última versión.';
  TeeMsg_ClickToUpdateVersion:='Pulse Actualizar para recibir la versión actualizada.';
  TeeMsg_UpdateButton        :='&Actualizar...';
  TeeMsg_WrongZip            :='Archivo de versión recibido incorrecto.';
  TeeMsg_VersionReceived     :='Ultima versión recibida. Pulse Aceptar para instalar.';

  TeeMsg_SelectFolder        :='Seleccionar Carpeta';
  TeeMsg_EmailNotValid       :='La dirección de Correo no es correcta.';
  TeeMsg_NameNotValid        :='Por favor escriba su Nombre.';
  TeeMsg_WrongPassword       :='La contraseña está vacia. Por favor escriba su contraseña o '+#13+
                               'pulse el botón Obtener Contraseña para recibirla por correo.';
  TeeMsg_WrongChartID        :='El nombre de gráfico está vacio. Por favor escriba un nombre de gráfico para '+
                               'identificarlo en la Galeria Web.';

  TeeMsg_CannotObtainPassword:='No es posible conectar para obtener su contraseña.';
  TeeMsg_PasswordSent        :='Se ha enviado la Contraseña a su dirección de Correo.';
  TeeMsg_Congrats            :='Felicidades.'+#13+'Ha sido incluido el base de datos de usuarios de '+
                              'la galeria de gráficos Web.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Subiendo %s a la galeria Web...';
  TeeMsg_Uploaded       :='%s ha sido cargado en la galeria Web.';

  TeeMsg_TitleEditor         :='Editor de Título';
  TeeMsg_EnterValue          :='Entrar valor';
  TeeMsg_PointWidth          :='Ancho';
  TeeMsg_PointHeight         :='Alto';

  TeeMsg_Position            :='Posición: %d,%d';
  TeeMsg_Size                :='Tamaño: %d x %d';

  TeeMsg_BetaWarning         :='Nota: '+
                              'Este Software es Pre-Release.'+#13+#13+
                              'Algunas funciones pueden ser incompletas o'+#13+
                              'eliminadas en la versión final del producto.'+#13+#13+
                              'Envienos preguntas y sugerencias en nuestro web:'+#13+#13+
                              'www.steema.com';

  TeeMsg_Caps               :='MAYU';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='DES';
  TeeMsg_SaveAs             :='Guardar como...';
  TeeMsg_ShouldClose        :='Por favor cierre y rearranque la aplicación.';
  TeeMsg_Table              :='Tabla';
  TeeMsg_Query              :='Consulta';
end;

begin
  SetSpanishConstants;
  TeeSetSpanish;

  if TeeSpanishLanguage.IndexOf('NEW USING WIZARD')=-1 then
  with TeeSpanishLanguage do
    Text:=Text+#13+
    'NEW USING WIZARD=Nuevo usando Asistente'#13+
    'OPEN=Abrir'+#13+
    'SAVE AS=Guardar como'#13+
    'SAVE AS...=Guardar como...'#13+
    'REOPEN=Reabrir'#13+
    'ABOUT=Acerca de'+#13+
    'PROPERTIES=Propiedades'+#13+
    'CHART TOOLS=Herramientas'+#13+
    'HELP INDEX=Indice de la Ayuda'+#13+
    'WHAT''S THIS ?=Qué es esto?'+#13+
    'VIEW=Ver'+#13+
    'STATUS BAR=Barra de estado'+#13+
    'GALLERY=Galería'+#13+
    'TOOLBARS=Barras de Herramientas'#13+
    'PAGE=Página'#13+
    'AS TAB=Como tapeta'#13+
    'AS WINDOW=Como ventana'#13+
    'HIDE=Ocultar'#13+
    'UPDATE VERSION=Actualizar versión'#13+
    'TEXT MODE=Modo Texto'#13+
    'ONLINE SUPPORT=Soporte en línea'#13+
    'EXIT=Salir'#13+
    'SEND BY E-MAIL=Enviar por Correo'#13+
    'TEXT LABELS=Etiquetas'#13+
    'DUPLICATE=Duplicar'#13+
    'SELECT ALL=Seleccionar Todas'#13+
    'MOVE UP=Mover Arriba'#13+
    'MOVE DOWN=Mover Abajo'#13+
    'HIDE SERIES LIST=Ocultar Lista'#13+
    'VIEW 3D=Ver en 3D'#13+
    'AUTO SIZE=Tamaño Autom.'#13+
    'ADD ANNOTATION=Añadir Anotación'#13+
    'ENABLE ZOOM=Permitir Zoom'#13+
    'ENABLE SCROLL=Permitir Desplazamiento'#13+
    'DRAW LINES=Dibujar Lineas'#13+
    'SHOW HINTS=Ver Ayudas'#13+
    'COLOR EACH POINT=Colorear puntos'#13+
    'PROPERTY=Propiedad'#13+
    'MODIFIED=Modific.'#13+
    'SIDE MARGINS=Margenes laterales'#13+
    'RIGHT SIDE=Lado derecho'#13+
    'ALIGN TO TOP=Alinear arriba'#13+
    'ALIGN TO BOTTOM=Alinear abajo'#13+
    'FONT COLOR=Color de Fuente'#13+
    'FONT NAME=Nombre de Fuente'#13+
    'FONT SIZE=Tamaño de Fuente'#13+
    'BOLD=Negrita'#13+
    'ITALIC=Cursiva'#13+
    'UNDERLINE=Subrayado'#13+
    'STRIKE OUT=Tachado'#13+
    'LEFT JUSTIFY=Ajustar a la Izquierda'#13+
    'RIGHT JUSTIFY=Ajustar a la Derecha'#13+
    'INTER-CHAR SIZE=Espacio entre caracteres'#13+
    'HIDE INSPECTOR=Ocultar Inspector'#13+
    'SELECT=Selecciona'#13+
    'CUSTOM POSITION=Posición cust.'#13+
    'CAPS=MAYU'#13+
    'NUM=NUM'#13+
    'SCR=DES'#13+
    'YES=Sí'#13+
    'NO=No'#13+
    'CHECK-BOXES=Casillas'#13+
    'ANNOTATION=Anotación'#13+
    'CONNECT TO STEEMA.COM TO UPDATE THIS SOFTWARE.=Conecte a Steema.com para actualizar su versión.'#13+
    'CURRENT VERSION=Versión actual'#13+
    'LATEST VERSION=Ultima versión'#13+
    'CONNECT=Conectar'#13+
    'UPDATE=Actualizar'#13+
    'HANDLES=Lápiz'#13+
    'DRAG POINT=Arrastrar puntos'#13+
    'DRAG STYLE=Estilo arrastre'#13+
    'LANGUAGE=Lenguaje'#13+
    'RED=Rojo'#13+
    'GREEN=Verde'#13+
    'BLUE=Azul'#13+
    'WHITE=Blanco'#13+
    'YELLOW=Amarillo'#13+
    'BLACK=Negro'#13+
    'SILVER=Plata'#13+
    'DKGRAY=Gris oscuro'#13+
    'BTNFACE=Gris'#13+
    'GRAY SCALE VISUAL=Grises visual'#13+
    'INVERTED GRAY SCALE=Grises Invertidos'#13+
    'FORMATTING=Formato'#13+
    'FLOATING POINT=Decimal'#13+
    'DATE-TIME=Fecha / Hora'#13+
    'CHOOSE AN OPTION=Escoja una opción'#13+
    'IMPORTING FROM WEB: %S=Importando del web: %s'#13+
    'GO !=Ir !'#13+
    'UPLOAD !=Subir !'#13+
    'YOUR NAME=Su Nombre'#13+
    'YOUR E-MAIL=Su e-Mail'#13+
    'PASSWORD=Contraseña'#13+
    'OBTAIN PASSWORD=Obtener Contraseña'#13+
    'FIRST=Primera'#13+
    'PRIOR=Anterior'#13+
    'NEXT=Siguiente'#13+
    'LAST=Ultima'#13+
    'CREATE NEW DATASET=Crear nueva Tabla o Consulta'#13+
    'DATASET STYLE=Tipo de Base de Datos'#13+
    'SQL QUERY=Consulta SQL'#13+
    'FROM=Desde'#13+
    'TO=Hasta'#13+
    'STEP=Cada'#13+
    'VALUE=Valor'#13+
    'EXCEL FILE=Archivo Excel'#13+
    'WORKSHEET=Libro'#13+
    'VALUES RANGE=Rango Valores'#13+
    'LABELS RANGE=Rango Textos'#13+
    'FOCUS=Resaltar'#13+
    'EXPLODE=Expandir'#13+
    'AUTOSIZE=Tamaño Auto.'#13
    ;
end;

Procedure TeeOfficeGalician;

Procedure SetGalicianConstants;
begin
  TeeMsg_ZoomInstructions    :='Arrastrar ratón derecha-abajo para zoom. Izquierda-arriba para quitar zoom.';
  TeeMsg_ScrollInstructions  :='Arrastrar ratón para desplazar el contenido del gráfico.';
  TeeMsg_DrawLineInstructions:='Arrastrar ratón para dibujar, seleccionar y mover lineas.';

  TeeMsg_SureToDeleteDataSet :='¿Seguro que desea eliminar la Tabla?';
  TeeMsg_Select              :='Selecciona';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Abrir';
  TeeMsg_New                 :='Nuevo';
  TeeMsg_ImportingWeb        :='Importando del Web: %s';
  TeeMsg_Annotation          :='Anotación';
  TeeMsg_Modified            :='Modific.';

  TeeMsg_Next                :='&Siguiente >';
  TeeMsg_OK                  :='Aceptar';
  TeeMsg_Close               :='Cerrar';
  TeeMsg_Go                  :='&Ir !';
  TeeMsg_Upload              :='&Subir !';

  TeeMsg_CannotGetVersion    :='No se puede obtener la versión más actual.'+#13+
                              'Error: %d %s';

  TeeMsg_CannotGetNewVersion :='No se puede descargar la versión más actual.'+#13+
                              'Error: %d %s';

  TeeMsg_WrongVersion        :='Número de versión recibido erróneo.';
  TeeMsg_HasLatestVersion    :='Ya tiene la última versión.';
  TeeMsg_ClickToUpdateVersion:='Pulse Actualizar para recibir la versión actualizada.';
  TeeMsg_UpdateButton        :='&Actualizar...';
  TeeMsg_WrongZip            :='Archivo de versión recibido incorrecto.';
  TeeMsg_VersionReceived     :='Ultima versión recibida. Pulse Aceptar para instalar.';

  TeeMsg_SelectFolder        :='Seleccionar Carpeta';
  TeeMsg_EmailNotValid       :='La dirección de Correo no es correcta.';
  TeeMsg_NameNotValid        :='Por favor escriba su Nombre.';
  TeeMsg_WrongPassword       :='La contraseña está vacia. Por favor escriba su contraseña o '+#13+
                               'pulse el botón Obtener Contraseña para recibirla por correo.';
  TeeMsg_WrongChartID        :='El nombre de gráfico está vacio. Por favor escriba un nombre de gráfico para '+
                               'identificarlo en la Galeria Web.';

  TeeMsg_CannotObtainPassword:='No es posible conectar para obtener su contraseña.';
  TeeMsg_PasswordSent        :='Se ha enviado la Contraseña a su dirección de Correo.';
  TeeMsg_Congrats            :='Felicidades.'+#13+'Ha sido incluido el base de datos de usuarios de '+
                              'la galeria de gráficos Web.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Subiendo %s a la galeria Web...';
  TeeMsg_Uploaded       :='%s ha sido cargado en la galeria Web.';

  TeeMsg_TitleEditor         :='Editor de Título';
  TeeMsg_EnterValue          :='Entrar valor';
  TeeMsg_PointWidth          :='Ancho';
  TeeMsg_PointHeight         :='Alto';

  TeeMsg_Position            :='Posición: %d,%d';
  TeeMsg_Size                :='Tamaño: %d x %d';

  TeeMsg_BetaWarning         :='Nota: '+
                              'Este Software es Pre-Release.'+#13+#13+
                              'Algunas funciones pueden ser incompletas o'+#13+
                              'eliminadas en la versión final del producto.'+#13+#13+
                              'Envienos preguntas y sugerencias en nuestro web:'+#13+#13+
                              'www.steema.com';

  TeeMsg_Caps               :='MAYU';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='DES';
  TeeMsg_SaveAs             :='Guardar como...';
  TeeMsg_ShouldClose        :='Por favor cierre y rearranque la aplicación.';
  TeeMsg_Table              :='Tabla';
  TeeMsg_Query              :='Consulta';
end;

begin
  SetGalicianConstants;
  TeeSetGalician;

  if TeeGalicianLanguage.IndexOf('NEW USING WIZARD')=-1 then
  with TeeGalicianLanguage do
    Text:=Text+#13+
    'NEW USING WIZARD=Nuevo usando Asistente'#13+
    'OPEN=Abrir'+#13+
    'SAVE AS=Guardar como'#13+
    'SAVE AS...=Guardar como...'#13+
    'REOPEN=Reabrir'#13+
    'ABOUT=Acerca de'+#13+
    'PROPERTIES=Propiedades'+#13+
    'CHART TOOLS=Herramientas'+#13+
    'HELP INDEX=Indice de la Ayuda'+#13+
    'WHAT''S THIS ?=Qué es esto?'+#13+
    'VIEW=Ver'+#13+
    'STATUS BAR=Barra de estado'+#13+
    'SERIES LIST=Lista de Series'#13+
    'GALLERY=Galería'+#13+
    'TOOLBARS=Barras de Herramientas'#13+
    'PAGE=Página'#13+
    'AS TAB=Como tapeta'#13+
    'AS WINDOW=Como ventana'#13+
    'HIDE=Ocultar'#13+
    'WEB CHARTS GALLERY=Galería de Gráficos en Web'#13+
    'UPDATE VERSION=Actualizar versión'#13+
    'TEXT MODE=Modo Texto'#13+
    'TEECHART WEB=Web de TeeChart'#13+
    'ONLINE SUPPORT=Soporte en línea'#13+
    'EXIT=Salir'#13+
    'SEND BY E-MAIL=Enviar por Correo'#13+
    'TEXT LABELS=Etiquetas'#13+
    'X VALUES=Valores X'#13+
    'DUPLICATE=Duplicar'#13+
    'SELECT ALL=Seleccionar Todas'#13+
    'MOVE UP=Mover Arriba'#13+
    'MOVE DOWN=Mover Abajo'#13+
    'HIDE SERIES LIST=Ocultar Lista'#13+
    'VIEW 3D=Ver en 3D'#13+
    'AUTO SIZE=Tamaño Autom.'#13+
    'ADD ANNOTATION=Añadir Anotación'#13+
    'ENABLE ZOOM=Permitir Zoom'#13+
    'ENABLE SCROLL=Permitir Desplazamiento'#13+
    'DRAW LINES=Dibujar Lineas'#13+
    'SHOW HINTS=Ver Ayudas'#13+
    'COLOR EACH POINT=Colorear puntos'#13+
    'SHOW AT LEGEND=Ver en Leyenda'#13+
    'SHOW SERIES MARKS=Ver Marcas en puntos'#13+
    'PROPERTY=Propiedad'#13+
    'MODIFIED=Modific.'#13+
    'WALL=Pared'#13+
    'SERIES MARKS=Marcas de Series'#13+
    'SIDE MARGINS=Margenes laterales'#13+
    'RIGHT SIDE=Lado derecho'#13+
    'ALIGN TO TOP=Alinear arriba'#13+
    'ALIGN TO BOTTOM=Alinear abajo'#13+
    'FONT COLOR=Color de Fuente'#13+
    'FONT NAME=Nombre de Fuente'#13+
    'FONT SIZE=Tamaño de Fuente'#13+
    'BOLD=Negrita'#13+
    'ITALIC=Cursiva'#13+
    'UNDERLINE=Subrayado'#13+
    'STRIKE OUT=Tachado'#13+
    'LEFT JUSTIFY=Ajustar a la Izquierda'#13+
    'RIGHT JUSTIFY=Ajustar a la Derecha'#13+
    'INTER-CHAR SIZE=Espacio entre caracteres'#13+
    'HIDE INSPECTOR=Ocultar Inspector'#13+
    'SELECT=Selecciona'#13+
    'CUSTOM POSITION=Posición cust.'#13+
    'AXIS LINE=Linea de Eje'+#13+
    'MINOR GRID=Rejilla menor'#13+
    'CAPS=MAYU'#13+
    'NUM=NUM'#13+
    'SCR=DES'#13+
    'YES=Sí'#13+
    'NO=No'#13+
    'CHECK-BOXES=Casillas'#13+
    'ANNOTATION=Anotación'#13+
    'CONNECT TO STEEMA.COM TO UPDATE YOUR TEECHART OFFICE VERSION.=Conecte a Steema.com para actualizar su versión.'#13+
    'CURRENT VERSION=Versión actual'#13+
    'LATEST VERSION=Ultima versión'#13+
    'CONNECT=Conectar'#13+
    'UPDATE=Actualizar'#13+
    'HANDLES=Lápiz'#13+
    'AXIS DIVIDER=Divisor de Ejes'#13+
    'DRAG POINT=Arrastrar puntos'#13+
    'PIE SLICES=Porciones de Pastel'#13+
    'DRAG STYLE=Estilo arrastre'#13+
    'TEECHART OFFICE OPTIONS=Opciones de TeeChart Office'#13+
    'LANGUAGE=Lenguaje'#13+
    'RED=Rojo'#13+
    'GREEN=Verde'#13+
    'BLUE=Azul'#13+
    'WHITE=Blanco'#13+
    'YELLOW=Amarillo'#13+
    'BLACK=Negro'#13+
    'SILVER=Plata'#13+
    'DKGRAY=Gris oscuro'#13+
    'BTNFACE=Gris'#13+
    'GRAY SCALE VISUAL=Grises visual'#13+
    'INVERTED GRAY SCALE=Grises Invertidos'#13+
    'LEFT WALL=Pared Izquierda'#13+
    'BOTTOM WALL=Pared Inferior'#13+
    'RIGHT WALL=Pared Derecha'#13+
    'BACK WALL=Pared Trasera'#13+
    'STAIRS INVERTED=Escalera Inv.'#13+
    'FORMATTING=Formato'#13+
    'FLOATING POINT=Decimal'#13+
    'DATE-TIME=Fecha / Hora'#13+
    'CHOOSE AN OPTION=Escoja una opción'#13+
    'IMPORTING FROM WEB: %S=Importando del web: %s'#13+
    'LOAD CHART FROM WEB ADDRESS=Cargar gráfico de Web'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Ver la Galería de Gráficos en www.Steema.com'#13+
    'GO !=Ir !'#13+
    'UPLOAD !=Subir !'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Subir su Gráfico a la Galería en el Web'#13+
    'TEECHART OFFICE WEB GALLERY=Galería de Gráficos en el Web'#13+
    'YOUR NAME=Su Nombre'#13+
    'YOUR E-MAIL=Su e-Mail'#13+
    'PASSWORD=Contraseña'#13+
    'OBTAIN PASSWORD=Obtener Contraseña'#13+
    'CHART NAME=Nombre Gráfico'#13+
    'FIRST=Primera'#13+
    'PRIOR=Anterior'#13+
    'NEXT=Siguiente'#13+
    'LAST=Ultima'#13+
    'CREATE NEW DATASET=Crear nueva Tabla o Consulta'#13+
    'DATASET STYLE=Tipo de Base de Datos'#13+
    'SQL QUERY=Consulta SQL'#13+
    'FROM=Desde'#13+
    'TO=Hasta'#13+
    'STEP=Cada'#13+
    'VALUE=Valor'#13+
    'EXCEL FILE=Archivo Excel'#13+
    'WORKSHEET=Libro'#13+
    'VALUES RANGE=Rango Valores'#13+
    'LABELS RANGE=Rango Textos'#13+
    'FOCUS=Resaltar'#13+
    'EXPLODE=Expandir'#13+
    'AUTOSIZE=Tamaño Auto.'#13+
    'AXIS 2=Eje 2'
    ;
end;

Procedure TeeOfficeCatalan;

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

  TeeMsg_TitleEditor         :='Editor de Títol';
  TeeMsg_EnterValue          :='Entrar valor';
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

  TeeMsg_Caps               :='MAJU';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='DES';
  TeeMsg_SaveAs             :='Guardar com...';

  TeeMsg_ShouldClose        :='Si us plau tanqui i tornir a arrencar el programari.';
  TeeMsg_Table              :='Taula';
  TeeMsg_Query              :='Consulta';
end;

begin
  SetCatalanConstants;
  TeeSetCatalan;

  if TeeLanguage.IndexOfName('NEW USING WIZARD')=-1 then
  with TeeCatalanLanguage do
    Text:=Text+#13+
    'NEW USING WIZARD=Nou amb Asistent'#13+
    'OPEN=Obrir'+#13+
    'SAVE AS=Guardar com'#13+
    'SAVE AS...=Guardar com...'#13+
    'REOPEN=Reobrir'#13+
    'ABOUT=A propósit de'+#13+
    'PROPERTIES=Propietats'+#13+
    'CHART TOOLS=Eines'+#13+
    'HELP INDEX=Index de l''Ajuda'+#13+
    'WHAT''S THIS ?=Qué és això?'+#13+
    'VIEW=Veure'+#13+
    'STATUS BAR=Barra d''estat'+#13+
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
    'CONNECT TO STEEMA.COM TO UPDATE YOUR TEECHART OFFICE VERSION.=Conecti a Steema.com per actualitzar la versió.'#13+
    'CURRENT VERSION=Versió actual'#13+
    'LATEST VERSION=Ultima versió'#13+
    'CONNECT=Conectar'#13+
    'UPDATE=Actualitzar'#13+
    'HANDLES=Llápis'#13+
    'AXIS DIVIDER=Divisor d''Eixos'#13+
    'DRAG POINT=Arrastrar punts'#13+
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

Procedure TeeOfficeGerman;

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

  TeeMsg_TitleEditor         :='Titel Editor'; 
  TeeMsg_EnterValue          :='Wert eingeben';
  TeeMsg_PointWidth          :='Breite';
  TeeMsg_PointHeight         :='Höhe'; 
 
  TeeMsg_Position            :='Position: %d,%d'; 
  TeeMsg_Size                :='Größe: %d x %d'; 

  TeeMsg_BetaWarning         :='Achtung: '+'Das ist eine Pre-Release Software.'+#13+#13+
                               'Einige Features können unvollständig oder'+#13+
                               ' in der späteren Produkt-Version entfernt sein.'+#13+#13+
                               'Geben Sie Probleme und Vorschläge in unsere Website:'+#13+#13+
                               'www.steema.com';
 
  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Speichern unter...';
  TeeMsg_ShouldClose        :='Bitte schließen und starten Sie TeeChart Office neu.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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
    'CONNECT TO STEEMA.COM TO UPDATE YOUR TEECHART OFFICE VERSION.=Verbinden mit Steema.com zur Aktualisierung ihrer TeeChart Office Version.'#13+
    'CURRENT VERSION=Aktuelle Version'#13+
    'LATEST VERSION=Letzte Version'#13+
    'CONNECT=Verbinden'#13+
    'UPDATE=Aktualisieren'#13+
    'HANDLES=Lápiz'#13+
    'AXIS DIVIDER=Achsteiler'#13+
    'DRAG POINT=Punkte ziehen'#13+
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

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
end;

Procedure TeeOfficeFrench;
begin
  SetFrenchConstants;

  if TeeFrenchLanguage=nil then
  begin
    TeeCreateFrench;
    with TeeFrenchLanguage do ;
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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
end;

Procedure TeeOfficeBrazil;
begin
  SetBrazilConstants;

  if TeeBrazilLanguage=nil then
  begin
    TeeCreateBrazil;
    with TeeBrazilLanguage do ;
  end;
  TeeSetBrazil;
end;

Procedure TeeOfficeDanish;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeDutch;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeSwedish;

Procedure SetSwedishConstants;
begin
  TeeMsg_ZoomInstructions    :='Drag mus till höger-botten för att zooma. Till vänster-upp för att zooma ut.';
  TeeMsg_ScrollInstructions  :='Drag mus för att skrolla kartans innehåll.';
  TeeMsg_DrawLineInstructions:='Drag mus för att rita, välja och flytta linjer.';

  TeeMsg_SureToDeleteDataSet :='Är du säker på att du vill radera data set?';
  TeeMsg_Select              :='Välj';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Öppna';
  TeeMsg_New                 :='Nytt';
  TeeMsg_ImportingWeb        :='Importera från Web: %s';
  TeeMsg_Annotation          :='Kommentar';
  TeeMsg_Modified            :='Modifierad';

  TeeMsg_Next                :='&Nästa >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Stäng';
  TeeMsg_Go                  :='&Kör !';
  TeeMsg_Upload              :='&Ladda upp!';

  TeeMsg_CannotGetVersion    :='Kan inte koppla upp för att erhålla aktuell version.'+#13+
                              'Fel: %d %s';

  TeeMsg_CannotGetNewVersion :='Kan inte ladda ner aktuell version.'+#13+
                              'Fel: %d %s';

  TeeMsg_WrongVersion        :='Erhållet version nummer är fel.';
  TeeMsg_HasLatestVersion    :='Du har redan senaste versionen.';
  TeeMsg_ClickToUpdateVersion:='Klicka Uppdatera för att erhålla senaste versionen.';
  TeeMsg_UpdateButton        :='&Uppdatera...';
  TeeMsg_WrongZip            :='Fel version fil erhållen.';
  TeeMsg_VersionReceived     :='Senaste versionen erhållen. Klicka OK för att installera.';

  TeeMsg_SelectFolder        :='Välj mapp';
  TeeMsg_EmailNotValid       :='Email adress är inte korrekt.';
  TeeMsg_NameNotValid        :='Ditt namn är tomt. Skriv in ditt namn.';
  TeeMsg_WrongPassword       :='Lösenord är tomt. Skriv in ditt lösenord eller klicka Erhåll Lösenord för att erhålla det med email';
  TeeMsg_WrongChartID        :='Kart namn är tomt. Skriv in ett namn för att identifiera karta i Web galleriets data bas';

  TeeMsg_CannotObtainPassword:='Kan inte koppla upp för att erhålla ditt lösenord.';
  TeeMsg_PasswordSent        :='Ditt lösenord har skickats till din email adress.';
  TeeMsg_Congrats            :='Gratulerar.'+#13+'Du har blivit inkluderad i TeeChart Office '+
                              'Web Charts Galleri användar data bas.';


  TeeMsg_UploadingWeb        :='Laddar upp till Web galleriet...';
  TeeMsg_Uploaded            :='%s har blivit uppladdat till Web Galleriet.';

  TeeMsg_TitleEditor         :='Titel Editor';
  TeeMsg_EnterValue          :='Skriv in värde';
  TeeMsg_PointWidth          :='Bredd';
  TeeMsg_PointHeight         :='Höjd';

  TeeMsg_Position            :='Position: %d,%d';
  TeeMsg_Size                :='Storlek: %d x %d';

  TeeMsg_BetaWarning         :='Kommentar: '+
                              'Detta är beta mjukvara.'+#13+#13+
                              'Vissa egenskaper kan vara inkompletta eller borttagna i den slutliga produktversionen'+#13+
                              'Skicka problem och förslag till vår Web plats:'+#13+#13+
                              'www.steema.com';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Spara som...';
  TeeMsg_ShouldClose        :='Stäng och starta om TeeTreeOffice.';

  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeChinese;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeChineseSimp;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficePortuguese;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeRussian;

Procedure SetRussianConstants;
begin
  TeeMsg_ZoomInstructions    :='Ïåðåäâèíüòå ìûøü âïðàâî âíèç äëÿ óâåëè÷åíèÿ. Âëåâî ââåðõ äëÿ óìåíüøåíèÿ.';
  TeeMsg_ScrollInstructions  :='Ïåðåäâèíüòå ìûøü äëÿ ïðîêðóòêè ñîäåðæèìîãî äèàãðàììû.';
  TeeMsg_DrawLineInstructions:='Ïåðåäâèíüòå ìûøü äëÿ ðèñîâàíèÿ, âûäåëåíèÿ è ïåðåìåùåíèÿ ëèíèé.';

  TeeMsg_SureToDeleteDataSet :='Âû äåéñòâèòåëüíî õîòèòå óäàëèòü äàííûå?';
  TeeMsg_Select              :='Âûäåëèòü';
  TeeMsg_EMail               :='"Ýëåêòðîííàÿ ïî÷òà';
  TeeMsg_Open                :='Îòêðûòü';
  TeeMsg_New                 :='Íîâûé';
  TeeMsg_ImportingWeb        :='Âñòàâèòü èç Èíòåðíåòà: %s';
  TeeMsg_Annotation          :='Êîììåíòàðèé';
  TeeMsg_Modified            :='Èçìåíåíî';

  TeeMsg_Next                :='&Ñëåäóþùèé >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Çàêðûòü';
  TeeMsg_Go                  :='&Âïåðåä !';
  TeeMsg_Upload              :='&Çàãðóçèòü !';

  TeeMsg_CannotGetVersion    :='Íåâîçìîæíî íàéòè ñóùåñòâóþùóþ âåðñèþ.'+#13+
                              'Îøèáêà: %d %s';

  TeeMsg_CannotGetNewVersion :='Íåâîçìîæíî ïîëó÷èòü ñóùåñòâóþùóþ âåðñèþ.'+#13+
                              'Îøèáêà: %d %s';

  TeeMsg_WrongVersion        :='ïîëó÷åí íåïðàâèëüíûé íîìåð âåðñèè.';
  TeeMsg_HasLatestVersion    :='Âû óæå èìååòå ïîñëåäíþþ âåðñèþ.';
  TeeMsg_ClickToUpdateVersion:='Íàæìèòå êíîïêó Îáíîâèòü äëÿ ïîëó÷åíèÿ ïîñëåäíåé âåðñèè.';
  TeeMsg_UpdateButton        :='&Îáíîâëåíèå...';
  TeeMsg_WrongZip            :='Ïðèíÿò ôàéë íåïðàâèëüíîé âåðñèè.';
  TeeMsg_VersionReceived     :='Ïîñëåäíÿÿ âåðñèÿ ïîëó÷åíà. Íàæìèòå Ok äëÿ óñòàíîâêè.';

  TeeMsg_SelectFolder        :='Âûáîð ïàïêè';
  TeeMsg_EmailNotValid       :='Íåïðàâèëüíûé àäðåñ ýëåêòðîííîé ïî÷òû.';
  TeeMsg_NameNotValid        :='Ïîëå âàøåãî èìåíè ïóñòî. Ïîæàëóéñòà, ââåäèòå Âàøå èìÿ.';
  TeeMsg_WrongPassword       :='Ïîëå ïàðîëÿ ïóñòî. Ïîæàëóéñòà, ââåäèòå ïàðîëü èëè '+#13+
                              'íàæìèòå êíîïêó Ïîëó÷èòü ïàðîëü äëÿ ïîëó÷åíèÿ ïàðîëÿ ïî ýëåêòðîííîé ïî÷òå.';
  TeeMsg_WrongChartID        :='Èìÿ äèàãðàììû ïóñòî. Ïîæàëóéñòà, ââåäèòå èìÿ äèàãðàììû äëÿ '+
                              'èäåíòèôèêàöèè â áàçå äàííûõ Web Gallery.';

  TeeMsg_CannotObtainPassword:='Íåâîçìîæíî ïîäêëþ÷èòüñÿ ê ñåòè äëÿ ïîëó÷åíèÿ âàøåãî ïàðîëÿ.';
  TeeMsg_PasswordSent        :='Âàø ïàðîëá îòîñëàí íà âàø àäðåñ ýëåêòðîííîé ïî÷òû.';
  TeeMsg_Congrats            :='Ïîçäðàâëÿåì.'+#13+'Âû âêëþ÷åíû â ïîëüçîâàòåëüñêóþ áàçó äàííûõ TeeChart Office '+
                              'Web Charts Gallery.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Çàãðóçêà %s â Web Gallery...';
  TeeMsg_Uploaded            :='%s çàãðóæåíî â Web Gallery.';

  TeeMsg_TitleEditor         :='Ðåäàêòîð íàçâàíèÿ';

  TeeMsg_EnterValue          :='Ââåäèòå çíà÷åíèå';
  TeeMsg_PointWidth          :='Øèðèíà';
  TeeMsg_PointHeight         :='Âûñîòà';

  TeeMsg_Position            :='Ïîëîæåíèå: %d,%d';
  TeeMsg_Size                :='Ðàçìåð: %d x %d';

  TeeMsg_BetaWarning         :='Âíèìàíèå: '+
                              'Ýòî íå ïîëíîñòüþ ãîòîâîå ïðîãðàììíîå îáåñïå÷åíèå.'+#13+#13+
                              'Íîêîòîðûå âîçìîæíîñòè ìîãóò áûòü íåïîëíûìè èëè'+#13+
                              'âîâñå èñêëþ÷åíû èç ôèíàëüíîé âåðñèè ïðîãðàììû.'+#13+#13+
                              'Âîïðîñû è ïîæåëàíèÿ íàïðàâëÿéòå íà íàø ñàéò:'+#13+#13+
                              'www.steema.com';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Ñîõðàíèòü êàê...';
  TeeMsg_ShouldClose        :='Ïîæàëóéñòà, ïåðåçàïóñòèòå TeeChartOffice.';
  TeeMsg_Table              :='Òàáëèöà';
  TeeMsg_Query              :='Çàïðîñ';
end;

begin
  SetRussianConstants;
  TeeSetRussian;

  if TeeRussianLanguage.IndexOf('NEW USING WIZARD')=-1 then
  with TeeRussianLanguage do
    Text:=Text+#13+
    'NEW USING WIZARD=Íîâûé Ìàñòåð'#13+
    'OPEN=Îòêðûòü'+#13+
    'SAVE AS=Ñîõðàíèòü'#13+
    'SAVE AS...=Ñîõðàíèòü êàê...'#13+
    'REOPEN=Îòêðûòü âíîâü'#13+
    'ABOUT=Î ïðîãðàììå'+#13+
    'PROPERTIES=Ñâîéñòâà'+#13+
    'CHART TOOLS=Èíñòðóìåíòû'+#13+
    'HELP INDEX=Óêàçàòåëü'+#13+
    'WHAT''S THIS ?=×òî ýòî?'+#13+
    'VIEW=Âèä'+#13+
    'STATUS BAR=Ñòðîêà ñòàòóñà'+#13+
    'SERIES LIST=Ñïèñîê Ïîñëåäîâàòåëüíîñòåé'#13+
    'GALLERY=Ãàëåðåÿ'+#13+
    'TOOLBARS=Ïàíåëü èíñòðóìåíòîâ'#13+
    'PAGE=Ñòàíèöà'#13+
    'AS TAB=Êàê òàáëèöà'#13+
    'AS WINDOW=Êàê îêíî'#13+
    'HIDE=Ñêðûòü'#13+
    'WEB CHARTS GALLERY=Äèàãðàììû WEB Gallery'#13+
    'UPDATE VERSION=Îáíîâèòü'#13+
    'TEXT MODE=Òåêñòîâûé ðåæèì'#13+
    'TEECHART WEB=Äèàãðàììà èç Èíòåðíåòà'#13+
    'ONLINE SUPPORT=Ïîääåðæêà'#13+
    'EXIT=Âûõîä'#13+
    'SEND BY E-MAIL=Îòîñëàòü ïî ýëåêòðîííîé ïî÷òå'#13+
    'TEXT LABELS=Ìåòêè'#13+
    'X VALUES=Çíà÷åíèÿ ïî X'#13+
    'DUPLICATE=Äóáëèðîâàòü'#13+
    'SELECT ALL=Seleccionar Todas'#13+
    'MOVE UP=Ââåðõ'#13+
    'MOVE DOWN=Âíèç'#13+
    'HIDE SERIES LIST=Ñêðûòü ñïèñîê ïîñëåäîâàòåëüíîñòåé'#13+
    'VIEW 3D=Òð¸õìåðíûé âèä'#13+
    'AUTO SIZE=Àâòîìàñøòàá'#13+
    'ADD ANNOTATION=Äîáàòü ïîìåòêó'#13+
    'ENABLE ZOOM=Ðàçðåøèòü óâåëè÷åíèå'#13+
    'ENABLE SCROLL=Ðåçðåøèòü ïðîêðóòêó'#13+
    'DRAW LINES=Ðèñîâàòü ëèíèè'#13+
    'SHOW HINTS=Ïîêàçûâàòü ïîäñêàçêè'#13+
    'COLOR EACH POINT=Öâåòíûå òî÷êè'#13+
    'SHOW AT LEGEND=Ïîêàçûâàòü â ëåãåíäå'#13+
    'SHOW SERIES MARKS=Ïîêàçûâàòü ìåòêè ïîñëåäîâàòåëüíîñòè'#13+
    'PROPERTY=Ñâîéñòâà'#13+
    'MODIFIED=Èçìåíåí'#13+
    'WALL=Ãðàíèöà'#13+
    'SERIES MARKS=Ìåòêè ïîñëåäîâàòåëüíîñòè'#13+
    'SIDE MARGINS=Êðàÿ'#13+
    'RIGHT SIDE=Ïðàâàÿ ñòîðîíà'#13+
    'ALIGN TO TOP=Ðàñïîëîæèòü â öåíòðå'#13+
    'ALIGN TO BOTTOM=Ðàñïîëîæèòü ñíèçó'#13+
    'FONT COLOR=Öâåò øðèôòà'#13+
    'FONT NAME=Øðèôò'#13+
    'FONT SIZE=Ðàçìåð øðèôòà'#13+
    'BOLD=Æèðíûé'#13+
    'ITALIC=Íàêëîííûé'#13+
    'UNDERLINE=Ïîä÷åðêíóòûé'#13+
    'STRIKE OUT=Çà÷åðêíóòûé'#13+
    'LEFT JUSTIFY=Âûðàâíèâàíèå ïî ëåâîìó êðàþ'#13+
    'RIGHT JUSTIFY=Âûðàâíèâàíèå ïî ïðàâîìó êðàþ'#13+
    'INTER-CHAR SIZE=Ìîíîøèðèííûé'#13+
    'HIDE INSPECTOR=Ñêðûòü Èíñïåêòîðà'#13+
    'SELECT=Âûäåëèòü'#13+
    'CUSTOM POSITION=Ïðîèçâîëüíîå ïîëîæåíèå'#13+
    'AXIS LINE=Ëèíèÿ îñè'+#13+
    'MINOR GRID=Óáûâàþùàÿ ðåøåòêà'#13+
    'CAPS=CAPS'#13+
    'NUM=NUM'#13+
    'SCR=SCR'#13+
    'YES=Äà'#13+
    'NO=Íåò'#13+
    'CHECK-BOXES=Ãàëî÷êà'#13+
    'ANNOTATION=Ïîìåòêà'#13+
    'CONNECT TO STEEMA.COM TO UPDATE THIS SOFTWARE.=Ñîåäèíèòüñÿ ñî Steema.com äëÿ îáíîâëåíèÿ ïðîãðàììû.'#13+
    'CURRENT VERSION=Òåêóùàÿ âåðñèÿ'#13+
    'LATEST VERSION=Ïîñëåäíÿÿ âåðñèÿ'#13+
    'CONNECT=Ñîåäèíåíèå'#13+
    'UPDATE=Îáíîâëåíèå'#13+
    'HANDLES=Óêàçàòåëè'#13+
    'AXIS DIVIDER=Äåëèòåëü îñè'#13+
    'PIE SLICES=Ñåêòîðû'#13+
    'DRAG STYLE=Ïåðåòàùèòü ñòèëü'#13+
    'TEECHART OFFICE OPTIONS=Íàñòðîéêè TeeChart Office'#13+
    'LANGUAGE=ßçûê'#13+
    'RED=Êðàñíûé'#13+
    'GREEN=Çåëåíûé'#13+
    'BLUE=Ñèíèé'#13+
    'WHITE=Áåëûé'#13+
    'YELLOW=Æåëòûé'#13+
    'BLACK=×åðíûé'#13+
    'SILVER=Ñåðåáðåíûé'#13+
    'DKGRAY=Òåìíî ñåðûé'#13+
    'BTNFACE=Ïîâåðõíîñòü êíîïêè'#13+
    'GRAY SCALE VISUAL=Ãðàäàöèè ñåðîãî'#13+
    'INVERTED GRAY SCALE=Èíâ. ãðàäàöèè ñåðîãî'#13+
    'LEFT WALL=Ëåâàÿ ãðàíèöà'#13+
    'BOTTOM WALL=Ëåâàÿ ãðàíèöà'#13+
    'RIGHT WALL=Ïðàâàÿ ãðàíèöà'#13+
    'BACK WALL=Çàäíÿÿ ãðàíèöà'#13+
    'STAIRS INVERTED=Èíâ. ãðàäèåíò'#13+
    'FORMATTING=Ôîðìàòèðîâàíèå'#13+
    'FLOATING POINT=Ïëàâ. òî÷êà'#13+
    'DATE-TIME=Äàòà-âðåìÿ'#13+
    'CHOOSE AN OPTION=Âûáåðèòå îïöèè'#13+
    'IMPORTING FROM WEB: %S=Èìïîðòèðîâàòü èç Èíòåðíåòà: %s'#13+
    'LOAD CHART FROM WEB ADDRESS=Çàãðóçèòü ñ àäðåñà:'#13+
    'BROWSE THE TEECHART GALLERY AT WWW.STEEMA.COM=Ïðîñìîòð WEB GALLERY íà WWW.STEEMA.COM'#13+
    'GO !=Âïåðåä !'#13+
    'UPLOAD !=Çàãðóçèòü !'#13+
    'UPLOAD CURRENT CHART TO WEB GALLERY=Çàãðóçèòü òåêóùèóþ äèàãðàììó â Web Gallery '#13+
    'TEECHART OFFICE WEB GALLERY=Web Gallery TeeChart Office'#13+
    'YOUR NAME=Âàøå èìÿ'#13+
    'YOUR E-MAIL=Âàø àäðåñ ýëåêòðîííîé ïî÷òû'#13+
    'PASSWORD=Ïàðîëü'#13+
    'OBTAIN PASSWORD=Ïîëó÷èòü ïàðîëü'#13+
    'CHART NAME=Íàçâàíèå äèàãðàììû'#13+
    'FIRST=Ïåðâûé'#13+
    'PRIOR=Ïðåäûäóùèé'#13+
    'NEXT=Ñëåäóþùèé'#13+
    'LAST=Ïîñëåäíèé'#13+
    'CREATE NEW DATASET=Ñîçäàòü íîâûé íàáîð äàííûõ'#13+
    'DATASET STYLE=Ñòèëü íàáîðà äàííûõ'#13+
    'SQL QUERY=SQL çàïðîñ'#13+
    'FROM=Îò'#13+
    'TO=Äî'#13+
    'STEP=Øàã'#13+
    'VALUE=Çíà÷åíèå'#13+
    'EXCEL FILE=Ôàéë Excel'#13+
    'WORKSHEET=Ëèñò'#13+
    'VALUES RANGE=Äèàïàçîí çíà÷åíèé'#13+
    'LABELS RANGE=Äèàïàçîí ìåòîê'#13+
    'FOCUS=Ôîêóñ'#13+
    'EXPLODE=Ðàñòÿíóòü'#13+
    'AUTOSIZE=Àâòîðàçìåð'#13+
    'AXIS 2=Îñü 2';
end;

Procedure TeeOfficeItalian;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeNorwegian;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeJapanese;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficePolish;

Procedure SetPolishConstants;
begin
  TeeMsg_ZoomInstructions    :='Przesuñ myszkê do góry w lewo aby powiêkszyæ, a do do³u w prawo aby zmniejszyæ.';
  TeeMsg_ScrollInstructions  :='Przesuñ myszkê aby przewin¹æ zawartoœæ wykresu.';
  TeeMsg_DrawLineInstructions:='Przesuñ myszkê aby rysowaæ, wybieraæ i przesuwaæ linie.';

  TeeMsg_SureToDeleteDataSet :='Jesteœ pewien, ¿e chcesz usun¹æ Ÿród³o danych?';
  TeeMsg_Select              :='Wybierz';
  TeeMsg_EMail               :='e-mail';
  TeeMsg_Open                :='Otwórz';
  TeeMsg_New                 :='Nowy';
  TeeMsg_ImportingWeb        :='Import z sieci: %s';
  TeeMsg_Annotation          :='Notatka';
  TeeMsg_Modified            :='Zmodyfikowany';

  TeeMsg_Next                :='&Dalej >';
  TeeMsg_OK                  :='OK';
  TeeMsg_Close               :='Zamknij';
  TeeMsg_Go                  :='&Wykonaj !';
  TeeMsg_Upload              :='W&yœlij !';

  TeeMsg_CannotGetVersion    :='Nie mo¿na pobraæ nowej wersji.'+#13+
                              'B³¹d: %d %s';

  TeeMsg_CannotGetNewVersion :='Nie mo¿na œci¹gn¹æ be¿¹cej wersji.'+#13+
                              'B³¹d: %d %s';

  TeeMsg_WrongVersion        :='Odebrano nieprawid³owy numer wersji.';
  TeeMsg_HasLatestVersion    :='Masz ju¿ najnowsz¹ wersjê.';
  TeeMsg_ClickToUpdateVersion:='Kliknij klawisz Odœwie¿ aby pobraæ najnowsz¹ wersjê.';
  TeeMsg_UpdateButton        :='&Odœwie¿...';
  TeeMsg_WrongZip            :='Odebrano nieprawid³ow¹ wersjê.';
  TeeMsg_VersionReceived     :='Odebrano najnowsz¹ wersjê. Kliknij OK aby zainstalowaæ.';

  TeeMsg_SelectFolder        :='Wybierz folder';
  TeeMsg_EmailNotValid       :='Nieprawid³owy adres internetowy.';
  TeeMsg_NameNotValid        :='Brak identyfikatora. Podaj swój identyfikator.';
  TeeMsg_WrongPassword       :='Brak has³a. Podaj swoje has³o lub '+#13+
                              'kliknij Pobierz Has³o aby je odebraæ przez pocztê.';
  TeeMsg_WrongChartID        :='Brak nazwy wykresu. Podaj nazwê wykresu aby '+
                              'go identyfikowaæ w galerii sieciowej.';

  TeeMsg_CannotObtainPassword:='Nie mo¿na siê po³¹czyæ aby odebraæ has³o.';
  TeeMsg_PasswordSent        :='Has³o zosta³o ci wys³ane na adres email.';
  TeeMsg_Congrats            :='Gratulacje.'+#13+'Zosta³eœ wprowadzony do bazy galerii TeeChart '+
                              'sieciowej bazy wykresów.'+#13+
                              TeeMsg_PasswordSent;

  TeeMsg_UploadingWeb        :='Wysy³anie %s Galerii Wykresów...';
  TeeMsg_Uploaded            :='%s zosta³ wys³¹ny do Galerii Wykresów.';

  TeeMsg_TitleEditor         :='Edytor tytu³u';
  TeeMsg_EnterValue          :='Podaj wartoœæ';
  TeeMsg_PointWidth          :='Szerokoœæ';
  TeeMsg_PointHeight         :='Wysokoœæ';

  TeeMsg_Position            :='Pozycja: %d,%d';
  TeeMsg_Size                :='Rozmiar: %d x %d';

  TeeMsg_BetaWarning         :='Notatka: '+
                              'To jest wczesna wersja programu.'+#13+#13+
                              'Niektóre mo¿liwoœci mag¹ byæ niekompletne lub'+#13+
                              'zostan¹ usuniête w wersji finalnej.'+#13+#13+
                              'Informuj nas o problemach i sugestiach na naszej stronie:'+#13+#13+
                              'www.steema.com';

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Zapisz jako...';
  TeeMsg_ShouldClose        :='Zamknij i uruchom ponownie Biuro TeeTree.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
end;

begin
  SetPolishConstants;
  TeeSetPolish;

  if TeeLanguage.IndexOfName('NEW USING WIZARD')=-1 then
  with TeePolishLanguage do
  Text:=Text+
    'FLOWCHART=Wykresy'#13+
    'INSERT=Wstawianie'#13+
    'NODES=Wêz³y'#13+
    'DESIGN=Projekt'#13+
    'PREVIEW=Podgl¹d'#13+
    'ABOUT TEETREE=O TeeTree'#13+
    'EDITOR TIPS=Porady dla edytora'#13+
    'TEETREE WEB SITE=Strona TeeTree'#13+
    'LINK NODES=Po³¹czone wêz³y'#13+
    'PRUNE NODES=Roz³¹czone wêz³y'#13+
    'CLIP TEXT=Obszar tekstu'#13+
    'SHADOW COLOR=Kolor cienia'#13+
    'NEW CHILD=Nowy potomek'#13+
    'NEW BROTHER=Nowy brat'#13+
    'NEW ROOT=Nowy korzeñ'#13+
    'NEW PARENT=Nowy przodek'#13+
    'CONNECTIONS=Po³¹czenia'#13+
    'IMAGES=Obrazki'#13+
    'CROSS BOXES=Rozszerzone obszary'#13+
    'EDITOR TABS=Edytor odstêpów'#13+
    'SHAPE TABS=Edytor kszta³tów'#13+
    'RULERS=Linijki'#13+
    'TOOLBAR=Pasek narzêdzi'#13+
    'FONT TOOLBAR=Pasek czcionek'#13+
    'BORDER TOOLBAR=Pasek ramek'#13+
    'NODE TREE=Uk³ad wêz³ów'#13+
    'CUT=Wytnij'#13+
    'PASTE=Wklej'#13+
    'SEARCH=Szukaj'#13+
    'ALIGN TO GRID=Wyrównaj do siatki'#13+
    'IMPORT=Import'#13+
    'NEW TREE=Nowe drzewo'#13+
    'PRINT TREE=Drukuj drzewo'#13+
    'ZOOM IN=Powieksz'#13+
    'ZOOM OUT=Pomniejsz'#13+
    'CONNECT NODES=Po³¹cz wêz³y'#13+
    'ADD CHILD=Dodaj potomka'#13+
    'ADD BROTHER=Dodaj brata'#13+
    'PRUNE=Roz³¹cz'#13+
    'BRING TO FRONT=Przesuñ na wierzch'#13+
    'SEND TO BACK=Przesuñ pod spód'#13+
    'ADD NEW ROOT=Dodaj nowy korzeñ'#13+
    'SHOW NAMES=Pokazuj nazwy'#13+
    'ALIGN TO LEFT=Wyrównaj do lewej'#13+
    'AUTO SCROLL=Automat. przewijanie'#13+
    'BORDER STYLE=Styl ramki'#13+
    'BORDER COLOR=Kolor ramki'#13+
    'BORDER WIDTH=Gruboœæ ramki'#13+
    'DESIGN MODE=Tryb projektowania'#13+
    'BUFFERED DISPLAY=Buforowanie wyœwietlania'#13+
    'PRINT PANEL=Drukuj panel'#13+
    'ZOOM FROM CENTER=Powiêksz od œrodka'#13+
    'CROSS BOX=Krzy¿yki'#13+
    'SIGN PEN=Znacznik'#13+
    'MODE=Tryb'#13+
    'STRETCHED=Rozci¹gaj'#13+
    'ALIGN=Wyrównanie'#13+
    'MOUSE=Mysz'#13+
    'ALLOW ZOOM=Pozwól powiêkszaæ'#13+
    'HOTTRACK=Œledzenie'#13+
    'MOUSE WHEEL=Pokrêt³o myszki'#13+
    'SELECT NODES=Wybierz wêz³y'#13+
    'SCROLL VERT.=Przesuw pionowy'#13+
    'SCROLL HORIZ.=Przesuw poziomy'#13+
    'TEXT COLOR=Kolor tekstu'#13+
    'SCROLL TO VIEW=Przesuñ na widok'#13+
    'UNFOCUSED COLOR=Kolor nieaktywny'#13+
    'UNFOCUSED BORDER=Ramka nieaktywna'#13+
    'ALLOW DELETE=Pozwól usuwaæ'#13+
    'SINGLE SELECTION=Pojedynczy wybór'#13+
    'SCROLL BARS=Paski przesuwu'#13+
    'GRID VISIBLE=Siatka widoczna'#13+
    'SNAP TO GRID=Wyrównaj do siatki'#13+
    'SHOW RULERS=Poka¿ linijki'#13+
    'INTERCHAR SPACING=Odstêp liter'#13+
    'VERT. ALIGN=Wyrównanie pionowe'#13+
    'ARROW FROM=Start strza³ki'#13+
    'ARROW TO=Koniec strza³ki'#13+
    'SIDES=Strony'#13+
    'CURVE=Krzywa'#13+
    'CHILDREN CONNECTIONS=Po³¹czenia'#13+
    'CROSS-BOX=Krzy¿yk'#13+
    'HORIZONTAL ALIGNMENT=Wyrównanie poziome'#13+
    'DEFAULT IMAGE=Domyœlny obrazek'#13+
    'HORIZONTAL SIZE=Rozmiar poziomy'#13+
    'VERTICAL SIZE=Rozmiar pionowy'#13+
    'MOVE HORIZ=Przesuw poziomy.'#13+
    'MOVE VERT=Przesuw pionowy'#13+
    'EDIT CONNECTION=Edycja po³aczeñ'#13+
    'DELETE CONNECTION=Usuñ po³¹czenia'#13+
    'ADD NEW POINT=Dodaj punkt'#13+
    'DELETE POINT=Usuñ punkt'#13+
    'FIXED=Sta³y'
    ;
end;

Procedure TeeOfficeSlovene;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeTurkish;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';
  TeeMsg_ShouldClose        :='Please close and restart the application.';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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

Procedure TeeOfficeHungarian;

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
  TeeMsg_Uploaded            :='%s has been uploaded to Web Gallery.';

  TeeMsg_TitleEditor         :='Title Editor';
  TeeMsg_EnterValue          :='Enter value';
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

  TeeMsg_Caps               :='CAPS';
  TeeMsg_Num                :='NUM';
  TeeMsg_SCR                :='SCR';
  TeeMsg_SaveAs             :='Save as...';

  { pending }
  TeeMsg_Table              :='Table';
  TeeMsg_Query              :='Query';
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
