/*
  The procedure below creates an array of Chart Series
  and fills them using the DataSet parameter.

  The Series are created using the "AGroupField" parameter.

  The "ASeries" parameter will be used to duplicate it many times,
  one for each "group", thus using it as a template.

  Example of use:
  ---------------

  Imagine you have a table with "Product sales".

  In this table you have the following fields:

  Product    ( Cars, Bikes, Trucks... )
  Country    ( USA, UK, Germany, Australia... )
  Amount     ( $1234... )

  Now we want to create a crosstab Chart consisting of one Bar
  Series for each "Product", each one showing the sum of
  "Amount" for each "Country".

  So,
  our "GroupField" is "Product",
  our "LabelField" is "Country" and
  our "ValueField" is "Amount".

  Usage is:

  FillDataSet( Table1, BarSeries1, "Product", "Country", "Amount", gfSum );

  After calling this procedure, the Chart will show several Series,
  one for each "Product".
  Each series will show the "Sum of Amount" by "Country".

  You can access and modify these Series as usually, like for example
  changing the Series Color, Title, etc.

*/
//---------------------------------------------------------------------------
#ifndef TeeCrossH
#define TeeCrossH
#include <DB.hpp>
#include <Chart.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>

enum TGroupFormula {gfCount, gfSum};

void FillDataSet(TDataSet *ADataSet, TChartSeries *ASeries,
                  const AnsiString AGroupField, const AnsiString ALabelField,
                  const AnsiString AValueField, TGroupFormula GroupFormula);

//---------------------------------------------------------------------------
#endif
