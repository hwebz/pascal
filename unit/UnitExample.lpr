program UnitExample;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  SysUtils,
  Test,
  HejriUtils { you can add units after this };

{var
  Payment: integer;
  Consumption: integer;
  Kilos: single;
begin
  Write('How much did you pay for your car''s petrol: ');
  Readln(Payment);
  Write('What is the consumption of your car (Kilos per one Gallon) ');
  Readln(Consumption);
  Kilos := GetKilometers(Payment, Consumption);
  Writeln('This petrol will keep your car running for: ',
    Format('%0.1f', [Kilos]), ' Kilometers');
  Write('Press enter');
  Readln;
end. }

var
  Year, Month, Day: word;
begin
  DateToHejri(Now, Year, Month, Day);
  Writeln('Today in Hejri: ', Day, '-', HejriMonthsEn[Month],
    '-', Year);
  Readln;
end.

