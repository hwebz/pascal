program switchCase;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  Meal: Byte;
  Mark: Integer;
  Key: Char;
begin
  Writeln('Welcome to Pacal Restaurant. Please select your order');
  Writeln('1 - Chicken              ($10)');
  Writeln('2 - Fish                 ($3)');
  Writeln('3 - Meat                 ($6)');
  Writeln('4 - Salad                ($4)');
  Writeln('5 - Orange Juice         ($12)');
  Writeln('6 - Milk                 ($7)');
  Write('Plase enter your selection: ');
  Readln(Meal);

  case Meal of
       1: Writeln('You have ordered Chicken, ', ' this will take 15 minutes');
       2: Writeln('You have ordered Fish, this will take 12 minutes');
       3: Writeln('You have ordered Meat, this will take 18 minutes');
       4: Writeln('You have ordered Salad, this will take 5 minutes');
       5: Writeln('You have ordered Orange juice, ', ' this will take 2 minutes');
       6: Writeln('You have ordered Milk, this will take 1 minute');
  else
    Writeln('Wrong entry');
  end;

  Writeln('Welcome to Student Grade Prediction program');
  Write('Please enter student mark: ');
  Readln(Mark);
  Writeln;

  case Mark of
       0 .. 39 : Writeln('Student grade is: F');
       40 .. 49: Writeln('Student grade is: E');
       50 .. 59: Writeln('Student grade is: D');
       60 .. 69: Writeln('Student grade is: C');
       70 .. 84: Writeln('Student grade is: B');
       85 .. 100: Writeln('Student grade is: A');
  else
    Writeln('Wrong mark');
  end;

  Writeln('Welcome to Keyboard Monitoring program');
  Write('Please enter any English letter: ');
  Readln(Key);
  Writeln;

  case Key of
       'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p': Writeln('This is in the second row in keyboard');
       'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l': Writeln('This is in the third row in keyboard');
       'z', 'x', 'c', 'v', 'b', 'n', 'm': Writeln('This is in the fourth row in keyboard');
       '0' .. '9': Writeln('This is the numerical letter');
  else
    Writeln('Unknown letter');
  end;

  Write('Press enter key to close');
  Readln;

end.

