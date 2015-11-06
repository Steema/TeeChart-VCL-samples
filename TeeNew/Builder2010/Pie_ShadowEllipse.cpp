//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Pie_ShadowEllipse.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"

int max(int value1, int value2)
{
  return ( (value1 > value2) ? value1 : value2);
}

TPieShadowEllipse *PieShadowEllipse;
//---------------------------------------------------------------------------
void __fastcall DrawEllipseShadow(TTeeCanvas *Canvas, TColor Color, TRect R)
{
  Canvas->Pen->Style = psClear;
  Canvas->Brush->Style = bsSolid;
  Canvas->Brush->Color = Color;

  int x = (R.Left+R.Right)/2;
  int y = (R.Top+R.Bottom)/2;

  int Steps = max((R.Right-R.Left), (R.Bottom-R.Top));
  double tmpW =0.5*(R.Right-R.Left)/(double)Steps;
  double tmpH = 0.5*(R.Bottom-R.Top)/(double)Steps;

  for (int t=Steps; t>0; t--)
  {
    Canvas->Brush->Color = ApplyDark(Color,255-floor(t*255.0/(double)Steps));
    R = TeeRect(x-floor(t*tmpW),y-floor(t*tmpH),x+floor(t*tmpW),y+floor(t*tmpH));
    Canvas->Ellipse(R);
  }
}
//---------------------------------------------------------------------------
__fastcall TPieShadowEllipse::TPieShadowEllipse(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
// Use the OnBeforeDrawSeries event to display the shadow, otherwise
// the shadow will be displayed on top of the Pie series...
void __fastcall TPieShadowEllipse::Chart1BeforeDrawSeries(TObject *Sender)
{
  if (CheckBox1->Checked) // if we want to display the shadow...
  {
	// Calculate shadow rectangle based on Chart "ChartRect" space.
	TRect cr;
	cr = Chart1->ChartRect;
	TRect R = Rect(cr.Left+40,cr.Bottom-40,cr.Right-40,cr.Bottom);
	
	// Draw shadow
	DrawEllipseShadow( Chart1->Canvas, Chart1->Color, R);
  }
}
//---------------------------------------------------------------------------

void __fastcall TPieShadowEllipse::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
  ButtonColor1->LinkProperty(Chart1,"Color");
}
//---------------------------------------------------------------------------

void __fastcall TPieShadowEllipse::CheckBox1Click(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

