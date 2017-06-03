program Loop;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  i: Integer;
  Count: Integer;
  x: Integer;
  Fac, Num: Integer;
begin
  Write('How many times?');
  Readln(Count);
  for i := 1 to Count do
      Writeln('Hello there');
  for i := 0 to Count do
      begin
        Writeln('Cycle number: ', i);
        Writeln('Hello there again');
      end;

  Write('Please input any number: ');
  Readln(x);
  for i := 1 to 12 do
      Writeln(x, ' * ', i, ' = ', x * i);

  // Downto in for loop
  for i:= Count downto 0 do
      Writeln('Hi there in downto loop');

  // Factorial program
  Write('Please input any number: ');
  Readln(Num);
  Fac := 1;
  for i := Num downto 1 do
      Fac := Fac * i;
  Writeln('Factorial of ', Num, ' is ', Fac);


  Write('Press enter key to close');
  Readln;

end.

