//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeCustomShape.h"
#include <TeCanvas.hpp>
#include <TeeCustomShapeEditor.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TCustomShape *CustomShape;
//---------------------------------------------------------------------------
__fastcall TCustomShape::TCustomShape(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCustomShape::Chart1AfterDraw(TObject *Sender)
{
  Shape->Draw();
  TCanvas3D *C = Chart1->Canvas;
  C->AssignFont(Shape->Font);
  C->BackMode = cbmTransparent;
  C->TextOut(Shape->ShapeBounds.Left+10,Shape->ShapeBounds.Top+10,"Hello World !");
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::FormCreate(TObject *Sender)
{
  const TColor clOrange = 0x70080FF;
  Shape = new TTeeShape(Chart1);
  Shape->ShapeBounds = Rect(50,50,130,90);
  Shape->Gradient->Visible = true;
  Shape->Gradient->MidColor = clOrange;
  Shape->Gradient->EndColor = clDkGray;
  Shape->Bevel = bvRaised;
  Shape->BevelWidth = 3;
  Shape->Font->Color = clNavy;
  Shape->Font->Shadow->HorizSize = 1;
  Shape->Font->Shadow->VertSize = 1;
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::FormDestroy(TObject *Sender)
{
  delete Shape;
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::Button1Click(TObject *Sender)
{
  TFormTeeShape *ShapeForm = new TFormTeeShape(this);
  try
  {
    ShapeForm->BorderStyle = bsDialog;
    ShapeForm->TheShape = Shape;
    ShapeForm->ShowModal();
  }
  __finally
  {
    delete ShapeForm;
  }

}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::ScrollBar1Change(TObject *Sender)
{
  Shape->ShapeBounds.Left = ScrollBar1->Position;
  Shape->ShapeBounds.Right = Shape->ShapeBounds.Left+80;
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::Chart1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  if (PtInRect(&Shape->ShapeBounds,Point(X,Y)))
  {
    ShowMessage("Touche!");
    Chart1->CancelMouse = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  if (PtInRect(&Shape->ShapeBounds,Point(X,Y))) Chart1->Cursor = crHandPoint;
  else Chart1->Cursor = crDefault;
  Chart1->OriginalCursor = Chart1->Cursor;
}
//---------------------------------------------------------------------------

void __fastcall TCustomShape::ScrollBar2Change(TObject *Sender)
{
  Shape->ShapeBounds.Top = ScrollBar2->Position;
  Shape->ShapeBounds.Bottom = Shape->ShapeBounds.Top+40;
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

