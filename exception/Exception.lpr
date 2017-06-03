program ExceptionHandling;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  SysUtils { you can add units after this };

{var
  x, y: integer;
  Res: double;
begin
  try
    Write('Input x: ');
    Readln(x);
    Write('Input y: ');
    Readln(y);
    Res := x / y;
    Writeln('x / y = ', Res);
  except
    on e: Exception do
    begin
      Writeln('An error occurred: ', e.message);
    end;
  end;
  Write('Press enter key to close');
  Readln;
end.}

{var
  x, y: integer;
  Res: double;
begin
  try
    Write('Input x: ');
    Readln(x);
    Write('Input y: ');
    Readln(y);
    Res := x / y;
    Writeln('x / y = ', Res);
  finally
    Write('Press enter key to close');
    Readln;
  end;
end. }

var
  x: integer;
begin
  Write('Please input a number from 1 to 10: ');
  Readln(X);
  try
    if (x < 1) or (x > 10) then // rais exception
      raise Exception.Create('X is out of range');
    Writeln(' X * 10 = ', x * 10);
  except
    on e: Exception do // Catch my exception
    begin
      Writeln('Error: ' + e.Message);
    end;
  end;
  Write('Press enter to close');
  Readln;
end.



