program RepeatUntil;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  Num: Integer;
  Selection: Char;
  Price: Integer;
  Total: Integer;
begin
  repeat
    Write('Please input a number: ');
    Readln(Num);
  until Num <= 0;
  Writeln('Finished, please press enter key to close');

  {Restaurant program using Repeat Loop}
  Total := 0;
  Writeln('Welcome to Pascal Restaurant. Please select your order');
  Writeln('1 - Chicken                (10 Geneh)');
  Writeln('2 - Fish                   (8 Geneh)');
  Writeln('3 - Meat                   (7 Geneh)');
  Writeln('4 - Salad                  (2 Geneh)');
  Writeln('5 - Orange Juice           (1 Geneh)');
  Writeln('6 - Milk                   (1 Geneh)');
  Writeln('X - Nothing');
  Writeln;
  repeat
    Write('Please enter your selection: ');
    Readln(Selection);

    case Selection of
         '1' : begin
                    Writeln('You have ordered Chicken, this will take 15 minutes');
                    Price := 10;
               end;
         '2' : begin
                    Writeln('You have ordered Fish, this will take 12 minutes');
                    Price := 7;
               end;
         '3' : begin
                    Writeln('You have ordered Meat, this will take 18 minutes');
                    Price := 8;
               end;
         '4' : begin
                    Writeln('You have ordered Salad, this will take 5 minutes');
                    Price := 2;
               end;
         '5' : begin
                    Writeln('You have ordered Orange Juice, this will take 2 minutes');
                    Price := 1;
               end;
         '6' : begin
                    Writeln('You have ordered Milk, this will take 1 minute');
                    Price := 1;
               end;
         else
           begin
                      Writeln('Wrong entry');
                      Price := 0;
           end;
    end;

    Total := Total + Price;
  //until (Selection = 'x') or (Selection = 'X');
  until UpCase(Selection) = 'X';
  Writeln('Total price = ', Total);

  Readln;
end.

