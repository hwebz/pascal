program WhileLoop;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

var
  Num: integer;
  Fac, i: Integer;
begin
  Write('Input a number: ');
  Readln(Num);
  while Num > 0 do
  begin
    Writeln('From inside loop: Input a number: ');
    Readln(Num);
  end;

  // Factorial using while loop
  Write('Please input a number: ');
  Readln(Num);
  Fac := 1;
  i := Num;
  while i > 1 do
        begin
          Fac := Fac * i;
          i := i - 1;
        end;
  Writeln('Factorial of ', Num, ' is ', Fac);

  Readln;
end.




