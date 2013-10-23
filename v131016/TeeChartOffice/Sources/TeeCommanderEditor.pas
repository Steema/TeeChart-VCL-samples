{**********************************************}
{   TTeeCommander Editor dialog                }
{   Copyright (c) 2010 by David Berneda        }
{**********************************************}
unit TeeCommanderEditor;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  TeeComma, TeeProcs, TeeSelectList;

type
  TCommanderEditor = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    CBTextHint: TCheckBox;
    CBPieExp: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SelectForm : TSelectListForm;
    Procedure ApplyChanges;
    {$IFDEF CLX}
    procedure ListDrawItem(Sender: TObject;
 Index: Integer; Rect: TRect; State: TOwnerDrawState; var Handled: Boolean);
    {$ELSE}
    procedure ListDrawItem(Control: TWinControl;
              Index: Integer; Rect: TRect; State: TOwnerDrawState);
    {$ENDIF}
  public
    { Public declarations }
    Commander : TTeeCommander;
  end;

procedure TeeCommanderEdit(AOwner:TComponent; ACommander:TTeeCommander);

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeProco, 
     {$IFDEF CLX}
     QButtons,
     {$ELSE}
     Buttons, 
     {$ENDIF}
     TeePenDlg;

procedure TeeCommanderEdit(AOwner:TComponent; ACommander:TTeeCommander);
begin
  With TCommanderEditor.Create(AOwner) do
  try
    Commander:=ACommander;
    if ShowModal=mrOk then ApplyChanges;
  finally
    Free;
  end;
end;

procedure TCommanderEditor.FormCreate(Sender: TObject);
begin
  BorderStyle:=TeeBorderStyle;

  SelectForm:=TSelectListform.Create(Self);

  with SelectForm do
  begin
    FromList.Height:=204;
    ToList.Height:=204;

    Align:=alClient;

    FromList.ItemHeight:=22;
    ToList.ItemHeight:=22;

    FromList.Style:=lbOwnerDrawFixed;
    FromList.OnDrawItem:=ListDrawItem;
    ToList.OnDrawItem:=ListDrawItem;
    ToList.Style:=lbOwnerDrawFixed;
  end;

  AddFormTo(SelectForm,Self);
end;

{$IFDEF CLX}
procedure TCommanderEditor.ListDrawItem(Sender: TObject;
 Index: Integer; Rect: TRect; State: TOwnerDrawState; var Handled: Boolean);
{$ELSE}
procedure TCommanderEditor.ListDrawItem(Control: TWinControl;
              Index: Integer; Rect: TRect; State: TOwnerDrawState);
{$ENDIF}
{$IFNDEF CLX}
var tmp  : TComponent;
    tmpB : TBitmap;
    tmpR : TRect;
{$ENDIF}
begin
  {$IFNDEF CLX}
  tmp:=TComponent(TListBox(Control).Items.Objects[Index]);
  With TListBox(Control).Canvas do
  begin
    Brush.Style:=bsSolid;
    if (tmp is TSpeedButton) and (TSpeedButton(tmp).Hint=TeeCommanMsg_Normal) then
       Brush.Color:=clSilver
    else
       Brush.Color:=TListBox(Control).Color;

    tmpR:=Rect;
    tmpR.Right:=tmpR.Left+22;
    FillRect(tmpR);

    if odSelected in State then Brush.Color:=clHighLight
                           else Brush.Color:=TListBox(Control).Color;
    tmpR.Right:=Rect.Right;
    tmpR.Left:=tmpR.Left+22;
    FillRect(tmpR);

    if tmp is TSpeedButton then
    begin
      tmpB:=TBitmap.Create;
      try
        tmpB.Assign(TSpeedButton(tmp).Glyph);
        if TSpeedButton(tmp).NumGlyphs=2 then { 5.02 }
           tmpB.Width:=tmpB.Width div 2;
        tmpB.Transparent:=True;
        Draw(Rect.Left+1,Rect.Top,tmpB);
      finally
        tmpB.Free;
      end;
    end
    else
    if tmp is TBevel then
    begin
      Pen.Style := psSolid;
      Pen.Width := 1;
      Pen.Color := clBtnHighlight;
      MoveTo(Rect.Left+9, Rect.Top+2);
      LineTo(Rect.Left+9, Rect.Bottom-2);
      Pen.Color := clBtnShadow;
      MoveTo(Rect.Left+10, Rect.Top+2);
      LineTo(Rect.Left+10, Rect.Bottom-2);
    end;

    Brush.Style:=bsClear;
    TextOut(Rect.Left+26,Rect.Top+3,TListBox(Control).Items[Index]);
  end;
  {$ENDIF}
end;

procedure TCommanderEditor.FormShow(Sender: TObject);
var t       : Integer;
    tmpList : TListBox;
begin
  if Assigned(Commander) then
  with Commander do
  begin
    for t:=0 to ControlCount-1 do
    if Controls[t].Owner=Commander then
    begin
      if Controls[t].Visible then tmpList:=SelectForm.ToList
                             else tmpList:=SelectForm.FromList;
      if Controls[t] is TSpeedButton then
      begin
        tmpList.Items.AddObject(TSpeedButton(Controls[t]).Hint,Controls[t]);
      end
      else
      if Controls[t] is TBevel then
      begin
        tmpList.Items.AddObject(TeeMsg_Separator,Controls[t]);
      end;
    end;

    CBTextHint.Checked:=LabelValues;
    CBPieExp.Checked:=EnablePieExploding;

    with SelectForm do
    if FromList.Items.Count>0 then FromList.SetFocus
                              else ToList.SetFocus;
  end;
end;

type TCommanderAccess=class(TTeeCommander);

procedure TCommanderEditor.ApplyChanges;

  Procedure DoList(AList:TListBox; AValue:Boolean);
  var t   : Integer;
      tmp : TComponent;
  begin
    with AList.Items do
    for t:=0 to Count-1 do
    begin
      tmp:=Commander.Components[TSpeedButton(Objects[t]).ComponentIndex];
      if Assigned(tmp) then TControl(tmp).Visible:=AValue;
    end;
  end;

begin
  DoList(SelectForm.ToList,True);
  DoList(SelectForm.FromList,False);
  Commander.LabelValues:=CBTextHint.Checked;
  Commander.EnablePieExploding:=CBPieExp.Checked;
  TCommanderAccess(Commander).RepositionControls;
end;

procedure TCommanderEditor.Button1Click(Sender: TObject);
begin

end;

end.
