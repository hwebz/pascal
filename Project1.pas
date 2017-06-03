program Project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

var
  Height: Double;
  Weight: Double;
  IdealWeight: Double;
begin
  Write('What is your height in meters (e.g. 1.8 meter): ');
  Readln(Height);
  Write('What is your weight in kilos: ');
  Readln(Weight);
  If Height >= 1.4 then
     IdealWeight:= (Height - 1)*100
  else
      IdealWeight:= Height * 20;

  if (Height < 0.4) or (Height > 2.5) or (Weight < 3) or (Weight > 200) then
     begin
       Writeln('Invaild values');
       Writeln('Please enter the proper values');
     end
  else
      if IdealWeight = Weight then
         Writeln('Your weight is suitable')
      else
          if IdealWeight > Weight then
             Writeln('You are under weight, you need more ', Format('%.2f', [IdealWeight - Weight]), ' kilos');
  Write('Press enter key to close');
  Readln;
end.

