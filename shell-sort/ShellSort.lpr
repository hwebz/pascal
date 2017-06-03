program ShellSort;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

  procedure ShellS(var X: array of integer);
  var
    Done: boolean;
    Jump, j, i: integer;
    Temp: integer;
  begin
    Jump := High(X);
    while (Jump > 0) do // Outer loop
    begin
      Jump := Jump div 2;
      repeat // Intermediate loop
        Done := True;
        for j := 0 to High(X) - Jump do // Inner loop
        begin
          i := j + Jump;
          if X[j] > X[i] then // Swap
          begin
            Temp := X[i];
            X[i] := X[j];
            X[j] := Temp;
            Done := False;
          end;
        end; // end of inner loop
      until Done; // end of intermediate loop
    end; // end of outer loop
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
  ShellS(Numbers);
  Writeln;
  Writeln('Numbers after Shell sort: ');
  for i := 0 to High(Numbers) do
  begin
    Writeln(Numbers[i]);
  end;
  Write('Press enter key to close');
  Readln;
end.



