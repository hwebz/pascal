program Sets;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

type
  TApplicationEnv = (aeLinux, aeMac, aeWindows);
var
  FireFox: set of TApplicationEnv;
  SuperTux: set of TApplicationEnv;
  Delphi: set of TApplicationEnv;
  Lazarus: set of TApplicationEnv;
  Month: integer;
  Character: Char;
begin
  FireFox := [aeLinux, aeWindows];
  SuperTux := [aeLinux];
  Delphi := [aeWindows];
  Lazarus := [aeLinux, aeMac, aeWindows];
  Month := 3;
  Character := 'A';
  if aeLinux in Lazarus then
    Writeln('There is a version for Lazarus under Linux')
  else
    Writeln('There is no version of Lazarus under linux');
  if aeLinux in SuperTux then
    Writeln('There is a version for SuperTux under Linux')
  else
    Writeln('There is no version of SuperTux under linux');
  if aeMac in SuperTux then
    Writeln('There is a version for SuperTux under Mac')
  else
    Writeln('There is no version of SuperTux under Mac');

  if Month in [1, 3, 5, 7, 8, 10, 12] then
    Writeln('This month contains 31 days');

  if Character in ['a', 'A'] then
    Writeln('This letter is A');

  Readln;
end.




