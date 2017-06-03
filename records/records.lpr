program RecordsExample;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

type
  TCar = record
    ModelName: string;
    Engine: single;
    ModelYear: integer;
  end;
var
  Car: TCar;
begin
  Write('Input car Model Name: ');
  Readln(Car.ModelName);
  Write('Input car Engine size: ');
  Readln(Car.Engine);
  Write('Input car Model year: ');
  Readln(Car.ModelYear);
  Writeln;
  Writeln('Car information: ');
  Writeln('Model Name : ', Car.ModelName);
  Writeln('Engine size : ', Car.Engine);
  Writeln('Model Year : ', Car.ModelYear);
  Write('Press enter key to close..');
  Readln;
end.




