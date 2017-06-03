program Procedures;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

{  procedure SayHello;
  begin
    Writeln('Hello there');
  end;

  procedure SayGoodbye;
  begin
    Writeln('Good bye');
  end;

  procedure WriteSumm(x, y: integer);
  begin
    Writeln('The summation of ', x, ' + ', y, ' = ', x + y);
  end;

begin // Here main application starts
  Writeln('This is the main application started');
  SayHello;
  Writeln('This is structured application');
  SayGoodbye;
  WriteSumm(2, 7);
  Write('Press enter key to close');
  Write('Press enter key to close');
  Readln;
end.  }

// Restaurant program using procedures
 { procedure Menu;
  begin
    Writeln('Welcome to Pascal Restaurant. Please select your order');
    Writeln('1 - Chicken (10$)');
    Writeln('2 - Fish (7$)');
    Writeln('3 - Meat (8$)');
    Writeln('4 – Salad (2$)');
    Writeln('5 - Orange Juice (1$)');
    Writeln('6 - Milk (1$)');
    Writeln;
  end;

  procedure GetOrder(AName: string; Minutes: integer);
  begin
    Writeln('You have ordered : ', AName, ', this will take ',
      Minutes, ' minutes');
  end;
  // Main application
var
  Meal: byte;
begin
  Menu;
  Write('Please enter your selection: ');
  Readln(Meal);
  case Meal of
    1: GetOrder('Chicken', 15);
    2: GetOrder('Fish', 12);
    3: GetOrder('Meat', 18);
    4: GetOrder('Salad', 5);
    5: GetOrder('Orange juice', 2);
    6: GetOrder('Milk', 1);
    else
      Writeln('Wrong entry');
  end;
  Write('Press enter key to close');
  Readln;
end.  }

{  function GetSumm(x, y: integer): integer;
  begin
    Result := x + y;
  end;

var
  Sum: integer;
begin
  Sum := GetSumm(2, 7);
  Writeln('Summation of 2 + 7 = ', Sum);
  Write('Press enter key to close');
  Readln;
end. }

// Restaurant program using functions
 { procedure Menu;
  begin
    Writeln('Welcome to Pascal Restaurant. Please select your order');
    Writeln('1 - Chicken (10$)');
    Writeln('2 - Fish (7$)');
    Writeln('3 - Meat (8$)');
    Writeln('4 – Salad (2$)');
    Writeln('5 - Orange Juice (1$)');
    Writeln('6 - Milk (1$)');
    Writeln('X - nothing');
    Writeln;
  end;

  function GetOrder(AName: string; Minutes, Price: integer): integer;
  begin
    Writeln('You have ordered: ', AName, ' this will take ',
      Minutes, ' minutes');
    Result := Price;
  end;

var
  Selection: char;
  Price: integer;
  Total: integer;
begin
  Total := 0;
  repeat
    Menu;
    Write('Please enter your selection: ');
    Readln(Selection);
    case Selection of
      '1': Price := GetOrder('Checken', 15, 10);
      '2': Price := GetOrder('Fish', 12, 7);
      '3': Price := GetOrder('Meat', 18, 8);
      '4': Price := GetOrder('Salad', 5, 2);
      '5': Price := GetOrder('Orange juice', 2, 1);
      '6': Price := GetOrder('Milk', 1, 1);
      'x', 'X': Writeln('Thanks');
      else
      begin
        Writeln('Wrong entry');
        Price := 0;
      end;
    end;
    Total := Total + Price;
  until (Selection = 'x') or (Selection = 'X');
  Writeln('Total price = ', Total);
  Write('Press enter key to close');
  Readln;
end.}

// Local variables
  procedure Loop(Counter: integer);
  var
    i: integer;
    Sum: integer;
  begin
    Sum := 0;
    for i := 1 to Counter do
      Sum := Sum + i;
    Writeln('Summation of ', Counter, ' numbers is: ', Sum);
  end;

begin // Main program section
  Loop(3);
  Write('Press enter key to close');
  Readln;
end.
