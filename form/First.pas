unit First;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, DateAndTime;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    MyDT: TMyDateTime;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(MyDT.GetDateTimeAsString);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(MyDT.GetDateAsString);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage(MyDT.GetTimeAsString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  MyDT.AddHours(1);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MyDT.AddDays(1);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyDT := TMyDateTime.Create(Now);
end;

end.

