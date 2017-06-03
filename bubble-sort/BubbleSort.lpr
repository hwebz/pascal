program BubbleSort;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

  procedure BubbleSort(var X: array of integer);
  var
    Temp: integer;
    i: integer;
    Changed: boolean;
  begin
    repeat // Outer loop
      Changed := False;
      for i := 0 to High(X) - 1 do // Inner loop
        if X[i] > X[i + 1] then
        begin
          Temp := X[i];
          X[i] := X[i + 1];
          X[i + 1] := Temp;
          Changed := True;
        end;
    until not Changed;
  end;

var
  Numbers: array [0 .. 9] of integer;
  i: integer;
begin
  Writeln('Please input 10 random numbers');
  for i := 0 to High(Numbers) do
  begin
    Write('#', i + 1, ': ');
    Readln(Numbers[i]);
  end;
  BubbleSort(Numbers);
  Writeln;
  Writeln('Numbers after sort: ');
  for i := 0 to High(Numbers) do
  begin
    Writeln(Numbers[i]);
  end;
  Write('Press enter key to close');
  Readln;
end.


