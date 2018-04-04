unit TeeMenuActions;
{$I TeeDefs.inc}

// Adapted code from Steve Trefethen (Borland)
// http://homepages.borland.com/strefethen/index.html

interface

uses {$IFNDEF LINUX}
     Windows,
     {$ENDIF}
     Classes, SysUtils,
     {$IFDEF CLX}
     QMenus, QForms, QExtCtrls, QActnList, QActnMan, QActnMenus,
     {$ELSE}
     Menus, Forms, ExtCtrls, ActnList, ActnMan, ActnMenus,
     {$ENDIF}
     XPStyleActnCtrls, StdStyleActnCtrls, CustomizeDlg, ActnColorMaps;

type
{ TABMenuAction -
    This class is a special ActionBand menu action that stores the TMenuItem
    that it is associated with so that if it is executed it can actually call
    the TMenuItem.Click method simulating an actual click on the TMenuItem
    itself.  }

  TABMenuAction = class(TCustomAction)
  private
    FMenuItem: TMenuItem;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    destructor Destroy; override;
    procedure ExecuteTarget(Target: TObject); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  end;

  TMenuActions=class(TList)
  private
    ActionManager1 : TActionManager;
    ActionMainMenuBar1 : TActionMainMenuBar;
    FCust:TCustomizeDlg;

    FForm : TCustomForm;
    procedure LoadMenu(ActionList: TCustomActionList;
      Clients: TActionClients; AMenu: TMenuItem; SetActionList: Boolean = True);
    procedure ActionMainMenuBar1Popup(Sender: TObject;
      Item: TCustomActionControl);
    procedure ActionMainMenuBar1ExitMenuLoop(Sender: TCustomActionMenuBar;
      Cancelled: Boolean);
    procedure CustomizeDialog(Sender:TObject);
    procedure MenuColorsClick(Sender:TObject);
  public
    Constructor Create(AForm:TCustomForm; MenuItem:TMenuItem=nil; Bar:TControlBar=nil);
    Destructor Destroy; override;

    procedure UpdateMainMenu(Menu: TMenu);
  end;

implementation

destructor TABMenuAction.Destroy;
begin
  if Assigned(FMenuItem) then
    FMenuItem.RemoveFreeNotification(Self);
  inherited;
end;

procedure TABMenuAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FMenuItem) then
    FMenuItem := nil;
end;

procedure TABMenuAction.ExecuteTarget(Target: TObject);
begin
  if Assigned(FMenuItem) then
    FMenuItem.Click;
end;

function TABMenuAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

Constructor TMenuActions.Create(AForm:TCustomForm; MenuItem:TMenuItem=nil; Bar:TControlBar=nil);
const MenuColors:Array[0..2] of String=('&Windows XP','Standard','Twilight');
var tmp : TMenu;
    tmpItem : TActionBarItem;
    tmp2,
    tmpCust : TMenuItem;
    t:Integer;
begin
  inherited Create;
  FForm:=AForm;
  tmp:=FForm.Menu;
  FForm.Menu:=nil;
  ActionMainMenuBar1:=TActionMainMenuBar.Create(FForm);

  if Assigned(Bar) then
     ActionMainMenuBar1.Parent:=Bar
  else
     ActionMainMenuBar1.Parent:=FForm;

  ActionManager1:=TActionManager.Create(FForm);
  ActionMainMenuBar1.Caption:='Main Menu';
  ActionManager1.Images:=tmp.Images;
  tmpItem:=ActionManager1.ActionBars.Add;
  tmpItem.ActionBar:=ActionMainMenuBar1;
  ActionMainMenuBar1.OnPopup:=ActionMainMenuBar1Popup;
  ActionMainMenuBar1.OnExitMenuLoop:=ActionMainMenuBar1ExitMenuLoop;
  ActionMainMenuBar1.ActionManager:=ActionManager1;
  ActionManager1.Style:=XPStyle;

  if Assigned(MenuItem) then
  begin
    tmpCust:=TMenuItem.Create(FForm);
    tmpCust.Caption:='-';
    MenuItem.Add(tmpCust);

    tmpCust:=TMenuItem.Create(FForm);
    tmpCust.Caption:='&Menu colors';
    MenuItem.Add(tmpCust);

    for t:=0 to High(MenuColors) do
    begin
      tmp2:=TMenuItem.Create(FForm);
      tmp2.Caption:=MenuColors[t];
      tmp2.RadioItem:=True;
      tmp2.Checked:=t=0;
      tmp2.OnClick:=MenuColorsClick;
      tmpCust.Add(tmp2);
    end;

    tmpCust:=TMenuItem.Create(FForm);
    tmpCust.Caption:='&Customize...';
    tmpCust.OnClick:=CustomizeDialog;

    MenuItem.Add(tmpCust);
  end;

  UpdateMainMenu(tmp);
end;

procedure TMenuActions.MenuColorsClick(Sender:TObject);
begin
  with TMenuItem(Sender) do
  begin
    Checked:=True;

    ActionMainMenuBar1.ColorMap:=nil;

    case MenuIndex of
      0: ActionManager1.Style:=XPStyle;
      1: ActionManager1.Style:=StandardStyle;
      2: ActionMainMenuBar1.ColorMap:=TTwilightColorMap.Create(FForm);
    end;
  end;
end;

procedure TMenuActions.CustomizeDialog(Sender:TObject);
begin
  FCust:=TCustomizeDlg.Create(FForm);
  FCust.ActionManager:=ActionManager1;
  FCust.Show;
end;

Destructor TMenuActions.Destroy;
begin
  inherited;
end;

{ This method adds placeholders to the TActionMainMenuBar that represent the
  top level menu item.  Each placeholder item has a single "dummy" item that
  is replaced by the actual menu should the user select that top level item.
  This allows the TMainMenu to be changed dynamically at runtime and still have
  the TActionMainMenuBar reflect the latest changes.
}
procedure TMenuActions.UpdateMainMenu(Menu: TMenu);

  { This routine should probably also check for Enabled state although it would
    be very wierd to have a top level menu disabled. }
  function RefreshItems: Boolean;
  var
    I: Integer;
  begin
    Result := Menu.Items.Count <> ActionManager1.ActionBars[0].Items.Count;
    if not Result then
      for I := 0 to Menu.Items.Count - 1 do
        if AnsiCompareText(Menu.Items[I].Caption, ActionManager1.ActionBars[0].Items[I].Caption) <> 0 then
        begin
          Result := True;
          break;
        end;
  end;

begin
  if not (csLoading in ActionManager1.ComponentState) and RefreshItems then
  begin
    // Clear any existing items and repopulate the TActionMainMenuBar
    ActionManager1.ActionBars[0].Items.Clear;
    ActionManager1.ActionBars[0].ActionBar := nil;
    LoadMenu(ActionManager1, ActionManager1.ActionBars[0].Items, Menu.Items);
    ActionManager1.ActionBars[0].ActionBar := ActionMainMenuBar1;
    // Update the size of the main menu
    with ActionMainMenuBar1 do
      SetBounds(0, 0, Controls[ControlCount - 1].BoundsRect.Right + 2 + ActionMainMenuBar1.HorzMargin, Height);
  end;
end;

{ This method dynamically builds the ActionBand menu from an existing
  TMenuItem. }
procedure TMenuActions.LoadMenu(ActionList: TCustomActionList;
  Clients: TActionClients; AMenu: TMenuItem; SetActionList: Boolean = True);
var
  I: Integer;
  AC: TActionClientItem;
begin
  AMenu.RethinkHotkeys;
  AMenu.RethinkLines;

  // Use the existing hotkeys from the TMenuItem
  Clients.AutoHotKeys := False;

  for I := 0 to AMenu.Count - 1 do
  begin
    AC := Clients.Add;
    AC.Caption := AMenu.Items[I].Caption;

    // Assign the Tag property to the TMenuItem for reference
    AC.Tag := Integer(AMenu.Items[I]);
    AC.Action := TContainedAction(AMenu.Items[I].Action);
    AC.Visible := AMenu.Items[I].Visible;

    // If the TMenuItem has subitems add an ActionClient placeholder.
    // Submenus are only populated when the user selects the parent item of the
    // submenu.
    if AMenu.Items[I].Count > 0 then
      AC.Items.Add  // Add a dummy indicating this item can/should be dynamically built
    else
      if ((AMenu.Items[I].Caption <> '') and (AMenu.Items[I].Action = nil) and
          (AMenu.Items[I].Caption <> '-')) then
      begin
        // The TMenuItem is not connected to an action so dynamically create
        // an action.
        AC.Action := TABMenuAction.Create(FForm);
        AC.Action.Category:='Menu';
//        AC.Action.Name:='Action_'+AMenu.Items[I].Name;

        AMenu.Items[I].FreeNotification(AC.Action);
        TABMenuAction(AC.Action).FMenuItem := AMenu.Items[I];
        Add(AC.Action);

        AC.Action.ActionList := ActionManager1;
        AC.Action.Tag := AMenu.Items[I].Tag;

        TCustomAction(AC.Action).ImageIndex := AMenu.Items[I].ImageIndex;
        TCustomAction(AC.Action).HelpContext := AMenu.Items[I].HelpContext;
        TCustomAction(AC.Action).Visible := AMenu.Items[I].Visible;
        TCustomAction(AC.Action).Checked := AMenu.Items[I].Checked;
        TCustomAction(AC.Action).Caption := AMenu.Items[I].Caption;
        TCustomAction(AC.Action).ShortCut := AMenu.Items[I].ShortCut;
        TCustomAction(AC.Action).Enabled := AMenu.Items[I].Enabled;
        TCustomAction(AC.Action).AutoCheck := AMenu.Items[I].AutoCheck;
        TCustomAction(AC.Action).Checked := AMenu.Items[I].Checked;
        TCustomAction(AC.Action).GroupIndex := AMenu.Items[I].GroupIndex;
        AC.ImageIndex := AMenu.Items[I].ImageIndex;
        AC.ShortCut := AMenu.Items[I].ShortCut;
      end;

    AC.Caption := AMenu.Items[I].Caption;
    AC.ImageIndex := AMenu.Items[I].ImageIndex;
    AC.HelpContext := AMenu.Items[I].HelpContext;
    AC.ShortCut := AMenu.Items[I].ShortCut;
    AC.Visible := AMenu.Items[I].Visible;
  end;
end;

procedure TMenuActions.ActionMainMenuBar1Popup(Sender: TObject;
  Item: TCustomActionControl);
begin
  // If the tag is not zero then we've already populated this submenu...
  if Item.ActionClient.Items[0].Tag <> 0 then Exit;

  // ...otherwise this is the first visit to this submenu and we need to
  // populate the actual ActionClients collection.
  if Assigned(TMenuItem(Item.ActionClient.Tag).OnClick) then
    TMenuItem(Item.ActionClient.Tag).OnClick(TMenuItem(Item.ActionClient.Tag));

  Item.ActionClient.Items.Clear;
  TMenuItem(Item.ActionClient.Tag).RethinkHotkeys;
  LoadMenu(ActionManager1, Item.ActionClient.Items, TMenuItem(Item.ActionClient.Tag), False);
end;

procedure TMenuActions.ActionMainMenuBar1ExitMenuLoop(
  Sender: TCustomActionMenuBar; Cancelled: Boolean);
var
  I: Integer;
  AnAction: TObject;
begin
  // Clear the top level menu sub item and add a single dummy item which
  // will cause them to be regenerated on the next menu loop.  This is done
  // because the IDE's menus can be very dynamic and this ensures that the
  // menus will always be up-to-date.
  for I := 0 to ActionManager1.ActionBars[0].Items.Count - 1 do
  begin
    ActionManager1.ActionBars[0].Items[I].Items.Clear;
    ActionManager1.ActionBars[0].Items[I].Items.Add;
  end;

  // Any menuitems not linked to an action had one dynamically created for them
  // during the menu loop so now we need to destroy them
  while Count > 0 do
  begin
    AnAction := TObject(Items[0]);
    AnAction.Free;
    Delete(0);
  end;
end;

end.
