{
********************************************************************************
HejriUtils: Hejri Calnder converter, for FreePascal and Delphi
Author: Motaz Abdel Azeem
email: motaz@code.sd
Home page: http://motaz.freevar.com/
License: LGPL
Created on: 26.Sept.2009
Last modifie: 26.Sept.2009
*******************************************************************************
}
unit HejriUtils;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}
interface

uses
  Classes, SysUtils;

const
  HejriMonthsEn: array [1 .. 12] of string = ('Moharram', 'Safar', 'Rabie Awal',
    'Rabie Thani', 'Jumada Awal', 'Jumada Thani', 'Rajab', 'Shaban', 'Ramadan',
    'Shawal', 'Thi-Alqaida', 'Thi-Elhajah');
  HejriMonthsAr: array [1 .. 12] of string = ('1', '2', '3',
    '4', '5', '6', '7', '8', '9',
    '10', '11', '12');
  HejriYearDays = 354.367056;
  HejriMonthDays = 29.530588;

procedure DateToHejri(ADateTime: TDateTime; var Year, Month, Day: word);
function HejriToDate(Year, Month, Day: word): TDateTime;
procedure HejriDifference(Year1, Month1, Day1, Year2, Month2, Day2: word;
  var YearD, MonthD, DayD: word);

implementation

var
  HejriStart: TDateTime;

procedure DateToHejri(ADateTime: TDateTime; var Year, Month, Day: word);
var
  HejriY: double;
  Days: double;
  HejriMonth: double;
  RDay: double;
begin
  HejriY := ((Trunc(ADateTime) - HejriStart - 1) / HejriYearDays);
  Days := Frac(HejriY);
  Year := Trunc(HejriY) + 1;
  HejriMonth := ((Days * HejriYearDays) / HejriMonthDays);
  Month := Trunc(HejriMonth) + 1;
  RDay := (Frac(HejriMonth) * HejriMonthDays) + 1;
  Day := Trunc(RDay);
end;

function HejriToDate(Year, Month, Day: word): TDateTime;
begin
  Result := (Year - 1) * HejriYearDays + (HejriStart - 0) + (Month - 1) *
    HejriMonthDays + Day + 1;
end;

procedure HejriDifference(Year1, Month1, Day1, Year2, Month2, Day2: word;
  var YearD, MonthD, DayD: word);
var
  Days1: double;
  Days2: double;
  DDays: double;
  RYear, RMonth: double;
begin
  Days1 := Year1 * HejriYearDays + (Month1 - 1) * HejriMonthDays + Day1 - 1;
  Days2 := Year2 * HejriYearDays + (Month2 - 1) * HejriMonthDays + Day2 - 1;
  DDays := Abs(Days2 - Days1);
  RYear := DDays / HejriYearDays;
  RMonth := (Frac(RYear) * HejriYearDays) / HejriMonthDays;
  DayD := Round(Frac(RMonth) * HejriMonthDays);
  YearD := Trunc(RYear);
  MonthD := Trunc(RMonth);
end;

initialization
  HejriStart := EncodeDate(622, 7, 16);
end.
