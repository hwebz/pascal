program News;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes, sysutils { you can add units after this };

var
  Title: string;
  F: TextFile;
begin
  AssignFile(F, 'news.txt');
  if FileExists('news.txt') then
  begin // Display old news
    Reset(F);
    while not EOF(F) do
    begin
      Readln(F, Title);
      Writeln(Title);
    end;
    CloseFile(F); // reading is finished from old news
    Append(F); // open file again for appending
  end
  else
    Rewrite(F);
  Write('Input current hour news title: ');
  Readln(Title);
  Writeln(F, DateTimeToStr(Now), ', ', Title);
  CloseFile(F);
  Write('Press enter to close');
  Readln;
end.




