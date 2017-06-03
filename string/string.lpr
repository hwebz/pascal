program StringExample;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes { you can add units after this };

{ var
  Name: string;
begin
  Write('Please enter your name : ');
  Readln(Name);
  Writeln('Hello ', Name);
  Writeln('Press enter key to close');
  Readln;
end. }

{ var
  Name: string;
  Address: string;
  ID: string;
  DOB: string;
begin
  Write('Please enter your name : ');
  Readln(Name);
  Write('Please enter your address : ');
  Readln(Address);
  Write('Please enter your ID number : ');
  Readln(ID);
  Write('Please enter your date of birth : ');
  Readln(DOB);
  Writeln;
  Writeln('Card:');
  Writeln('------------------------------------------');
  Writeln('| Name : ', Name);
  Writeln('| Address : ', Address);
  Writeln('| ID : ', ID);
  Writeln('| DOB : ', DOB);
  Writeln('------------------------------------------');
  Writeln('Press enter key to close');
  Readln;
end.     }
{var
  YourName: string;
  Father: string;
  GrandFather: string;
  FullName: string;
begin
  Write('Please enter your first name : ');
  Readln(YourName);
  Write('Please enter your father name : ');
  Readln(Father);
  Write('Please enter your grand father name : ');
  Readln(GrandFather);
  FullName := UpCase(YourName) + ' ' + LowerCase(Father) + ' ' + GrandFather;
  Writeln('Your full name is: ', FullName);
  Writeln('Press enter key to close');
  Readln;
end.}

{var
  YourName: string;
begin
  Write('Please enter your name : ');
  Readln(YourName);
  if Pos('a', LowerCase(YourName)) > 0 then
    Writeln('Your name contains a')
  else
    Writeln('Your name does not contain a letter');
  Writeln('Press enter key to close');
  Readln;
end.  }

{var
  YourName: string;
begin
  Write('Please enter your name : ');
  Readln(YourName);
  if Pos('a', LowerCase(YourName)) > 0 then
  begin
    Writeln('Your name contains a');
    Writeln('a position in your name is: ',
      Pos('a', LowerCase(YourName)));
  end
  else
    Writeln('Your name does not contain a letter');
  Writeln('Your name length is ', Length(YourName), ' letters');
  Writeln('Your first letter is ', YourName[1]);
  Writeln('Your second letter is ', YourName[2]);
  Writeln('Your last letter is ', YourName[Length(YourName)]);

  Write('Press enter key to close');
  Readln;
end.  }






