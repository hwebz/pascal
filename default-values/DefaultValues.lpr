program DefaultValues;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

  function SumAll(a, b: integer; c: integer = 0; d: integer = 0): integer;
  begin
    Result := a + b + c + d;
  end;

begin
  Writeln(SumAll(1, 2));
  Writeln(SumAll(1, 2, 3));
  Writeln(SumAll(1, 2, 3, 4));
  Write('Press enter key to close');
  Readln;
end.




