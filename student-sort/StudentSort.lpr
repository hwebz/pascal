program StudentSort;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

{type
  TStudent = record
    StudentName: string;
    Mark: byte;
  end;

  procedure BubbleSort(var X: array of TStudent);
  var
    Temp: TStudent;
    i: integer;
    Changed: boolean;
  begin
    repeat
      Changed := False;
      for i := 0 to High(X) - 1 do
        if X[i].Mark < X[i + 1].Mark then
        begin
          Temp := X[i];
          X[i] := X[i + 1];
          X[i + 1] := Temp;
          Changed := True;
        end;
    until not Changed;
  end;

var
  Students: array [0 .. 9] of TStudent;
  i: integer;
begin
  Writeln('Please input 10 student names and marks');
  for i := 0 to High(Students) do
  begin
    Write('Student #', i + 1, ' name : ');
    Readln(Students[i].StudentName);
    Write('Student #', i + 1, ' mark : ');
    Readln(Students[i].Mark);
    Writeln;
  end;
  BubbleSort(Students);
  Writeln;
  Writeln('Marks after Bubble sort: ');
  Writeln('----------------------');
  for i := 0 to High(Students) do
  begin
    Writeln('# ', i + 1, ' ', Students[i].StudentName,
      ' with mark (', Students[i].Mark, ')');
  end;
  Write('Press enter key to close');
  Readln;
end.  }

type
  TStudent = record
    StudentName: string;
    Mark: byte;
  end;

  procedure BubbleSort(var X: array of TStudent);
  var
    Temp: TStudent;
    i: integer;
    Changed: boolean;
  begin
    repeat
      Changed := False;
      for i := 0 to High(X) - 1 do
        if X[i].StudentName > X[i + 1].StudentName then
        begin
          Temp := X[i];
          X[i] := X[i + 1];
          X[i + 1] := Temp;
          Changed := True;
        end;
    until not Changed;
  end;

var
  Students: array [0 .. 9] of TStudent;
  i: integer;
begin
  Writeln('Please input 10 student names and marks');
  for i := 0 to High(Students) do
  begin
    Write('Student #', i + 1, ' name : ');
    Readln(Students[i].StudentName);
    Write('Student #', i + 1, ' mark : ');
    Readln(Students[i].Mark);
    Writeln;
  end;
  BubbleSort(Students);
  Writeln;
  Writeln('Marks after Bubble sort: ');
  Writeln('----------------------');
  for i := 0 to High(Students) do
  begin
    Writeln('# ', i + 1, ' ', Students[i].StudentName,
      ' with mark (', Students[i].Mark, ')');
  end;
  Write('Press enterkey to close');
  Readln;
end.
