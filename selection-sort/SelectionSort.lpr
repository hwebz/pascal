program SelectionSort;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

  procedure SelectSort(var X: array of integer);
  var
    i: integer;
    j: integer;
    SmallPos: integer;
    Smallest: integer;
  begin
    for i := 0 to High(X) - 1 do // Outer loop
    begin
      SmallPos := i;
      Smallest := X[SmallPos];
      for j := i + 1 to High(X) do // Inner loop
        if X[j] < Smallest then
        begin
          SmallPos := j;
          Smallest := X[SmallPos];
        end;
      X[SmallPos] := X[i];
      X[i] := Smallest;
    end;
  end;
  // Main application
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
  SelectSort(Numbers);
  Writeln;
  Writeln('Numbers after Selection sort: ');
  for i := 0 to High(Numbers) do
  begin
    Writeln(Numbers[i]);
  end;
  Write('Press enter key to close');
  Readln;
end.




