�
 TDBCHARTRECORDLOCATE 0.  TPF0�TDBChartRecordLocateDBChartRecordLocate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight �	TSplitter	Splitter1Left� ToptHeight�   �TMemoMemo1Lines.StringsCWith simple code, DBChart series can store the record associated toHeach Series point.  You can, for example, use it to locate a record whena series point is clicked. BExample: Click a bar to locate the associated record in the table.   �TPanelPanel1 	TCheckBox	CheckBox1LeftTopWidthaHeightCaption&Open tableTabOrder OnClickCheckBox1Click   �TDBChartDBChart1Left� Width.OnClickSeriesDBChart1ClickSeriesLegend.Visible 
TBarSeriesSeries1CursorcrHandPointMarks.Callout.Brush.ColorclBlackMarks.Visible	
DataSourceTable1XLabelsSourceNAME
OnAfterAddSeries1AfterAddGradient.DirectiongdTopBottomXValues.NameXXValues.OrderloAscendingYValues.NameBarYValues.OrderloNoneYValues.ValueSourceSIZE   TDBGridDBGrid1Left ToptWidth� Height� AlignalLeft
DataSourceDataSource1OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TTableTable1DatabaseNameDBDEMOS	TableNameanimals.dbfLeftTop�  TStringField
Table1NAME	FieldNameNAMESize
  TSmallintField
Table1SIZE	FieldNameSIZE   TDataSourceDataSource1DataSetTable1OnDataChangeDataSource1DataChangeLeft`Top�    