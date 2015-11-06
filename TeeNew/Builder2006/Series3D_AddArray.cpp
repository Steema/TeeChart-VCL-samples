//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Series3D_AddArray.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TAddArray3D *AddArray3D;
//---------------------------------------------------------------------------
__fastcall TAddArray3D::TAddArray3D(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAddArray3D::FormCreate(TObject *Sender)
{
  TArrayGrid A;
  // initialize dynamic array grid
  A.Length =5;
  for (int t=0; t<A.Length-1;t++) A[t].Length = 7;

  // fill with random values
  for (int x=0;x<4;x++)
    for (int z=0;z<6;z++)
      A[x][z] = sqrt(pow(x,2)+pow(z-3,2)) ;

  // add to 3D series:
  Series1->AddArray(A);
}
//---------------------------------------------------------------------------

