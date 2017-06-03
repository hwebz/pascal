program FileExample;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  SysUtils { you can add units after this };

// Reading text file
{var
  FileName: string;
  F: TextFile;
  Line: string;
begin
  Write('Input a text file name: ');
  Readln(FileName);
  if FileExists(FileName) then
  begin
    // Link file variable (F) with physical file (FileName)
    AssignFile(F, FileName);
    Reset(F); // Put file mode for read, file should exist
    // while file has more lines that does not read yet do the loop
    while not EOF(F) do
    begin
      Readln(F, Line); // Read a line from text file
      Writeln(Line); // Display this line in user screen
    end;
    CloseFile(F); // Release F and FileName connection
  end
  else // else if FileExists..
    Writeln('File does not exist');
  Write('Press enter key to close..');
  Readln;
end. }

// Creating and writing text file
{var
  FileName: string;
  F: TextFile;
  Line: string;
  ReadyToCreate: boolean;
  Ans: char;
  i: integer;
begin
  Write('Input a new file name: ');
  Readln(FileName);
  // Check if file exists, warn user if it is already exist
  if FileExists(FileName) then
  begin
    Write('File already exist, did you want to overwrite it? (y/n)');
    Readln(Ans);
    if upcase(Ans) = 'Y' then
      ReadyToCreate := True
    else
      ReadyToCreate := False;
  end
  else // File does not exist
    ReadyToCreate := True;
  if ReadyToCreate then
  begin
    // Link file variable (F) with physical file (FileName)
    AssignFile(F, FileName);
    Rewrite(F); // Create new file for writing
    Writeln('Please input file contents line by line, ', 'when you finish write % then press enter');
    i := 1;
    repeat
      Write('Line # ', i, ':');
      Inc(i);
      Readln(Line);
      if Line <> '%' then
        Writeln(F, Line); // Write line into text file
    until Line = '%';
    CloseFile(F); // Release F and FileName connection, flush buffer
  end
  else // file already exist and user does not want to overwrite it
    Writeln('Doing nothing');
  Write('Press enter key to close..');
  Readln;
end.   }

// Appending to a text file
{var
  FileName: string;
  F: TextFile;
  Line: string;
  i: integer;
begin
  Write('Input an existed file name: ');
  Readln(FileName);
  if FileExists(FileName) then
  begin
    // Link file variable (F) with physical file (FileName)
    AssignFile(F, FileName);
    Append(F); // Open file for appending
    Writeln('Please input file contents line by line',
      'when you finish write % then press enter');
    i := 1;
    repeat
      Write('Line # ', i, ' append :');
      Inc(i);
      Readln(Line);
      if Line <> '%' then
        Writeln(F, Line); // Write line into text file
    until Line = '%';
    CloseFile(F); // Release F and FileName connection, flush buffer
  end
  else
    Writeln('File does not exist');
  Write('Press enter key to close..');
  Readln;
end. }


// Random access files - fixed size record
// 2 types: 'typed' and 'untyped'
// Typed - Marks program - Creating and writing
{var
  F: file of byte;
  Mark: byte;
begin
  AssignFile(F, 'marks.dat');
  Rewrite(F); // Create file
  Writeln('Please input students marks, write 0 to exit');
  repeat
    Write('Input a mark: ');
    Readln(Mark);
    if Mark <> 0 then // Don't write 0 value
      Write(F, Mark);
  until Mark = 0;
  CloseFile(F);
  Write('Press enter key to close..');
  Readln;
end. }

// Reading from typed filevar
{var
  F: file of byte;
  Mark: byte;
begin
  AssignFile(F, 'marks.dat');
  if FileExists('marks.dat') then
  begin
    Reset(F); // Open file
    while not EOF(F) do
    begin
      Read(F, Mark);
      Writeln('Mark: ', Mark);
    end;
    CloseFile(F);
  end
  else
    Writeln('File (marks.dat) not found');
  Write('Press enter key to close..');
  Readln;
end.   }

// Appending to typed file
{var
  F: file of byte;
  Mark: byte;
begin
  AssignFile(F, 'marks.dat');
  if FileExists('marks.dat') then
  begin
    FileMode := 2; // Open file for read/write
    Reset(F); // open file
    Seek(F, FileSize(F)); // Go to beyond last record
    Writeln('Please input students marks, write 0 to exit');
    repeat
      Write('Input a mark: ');
      Readln(Mark);
      if Mark <> 0 then // Don't write 0 value in disk
        Write(F, Mark);
    until Mark = 0;
    CloseFile(F);
  end
  else
    Writeln('File marks.dat not found');
  Write('Press enter key to close..');
  Readln;
end.}

// Create and append student marks program
{var
  F: file of byte;
  Mark: byte;
begin
  AssignFile(F, 'marks.dat');
  if FileExists('marks.dat') then
  begin
    FileMode := 2; // Open file for read/write
    Reset(F); // open file
    Writeln('File already exist, opened for append');
    // Display file records
    while not EOF(F) do
    begin
      Read(F, Mark);
      Writeln('Mark: ', Mark);
    end;
  end
  else // File not found, create it
  begin
    Rewrite(F);
    Writeln('File does not exist,, not it is created');
  end;
  Writeln('Please input students marks, write 0 to exit');
  Writeln('File pointer position at record # ', FilePos(f));
  repeat
    Write('Input a mark: ');
    Readln(Mark);
    if Mark <> 0 then // Don't write 0 value
      Write(F, Mark);
  until Mark = 0;
  CloseFile(F);
  Write('Press enter key to close..');
  Readln;
end.}


// Cars database program
{type
  TCar = record
    ModelName: string[20];
    Engine: single;
    ModelYear: integer;
  end;
var
  F: file of TCar;
  Car: TCar;
begin
  AssignFile(F, 'cars.dat');
  if FileExists('cars.dat') then
  begin
    FileMode := 2; // Open file for read/write
    Reset(F); // open file
    Writeln('File already exist, opened for append');
    // Display file records
    while not EOF(F) do
    begin
      Read(F, Car);
      Writeln;
      Writeln('Car # ', FilePos(F), ' --------------------------');
      Writeln('Model : ', Car.ModelName);
      Writeln('Year : ', Car.ModelYear);
      Writeln('Engine: ', Car.Engine);
    end;
  end
  else // File not found, create it
  begin
    Rewrite(F);
    Writeln('File does not exist, created');
  end;
  Writeln('Please input car informaion, ',
    'write x in model name to exit');
  Writeln('File pointer position at record # ', FilePos(f));
  repeat
    Writeln('--------------------------');
    Write('Input car Model Name : ');
    Readln(car.ModelName);
    if Car.ModelName <> 'x' then
    begin
      Write('Input car Model Year : ');
      Readln(car.ModelYear);
      Write('Input car Engine size: ');
      Readln(car.Engine);
      Write(F, Car);
    end;
  until Car.ModelName = 'x';
  CloseFile(F);
  Write('Press enter key to close..');
  Readln;
end. }






