unit NewsForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, News;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cbType: TComboBox;
    edTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    NewsObj: array of TNews;
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
var
  i: integer;
begin
  SetLength(NewsObj, cbType.Items.Count);
  for i := 0 to High(NewsObj) do
    NewsObj[i] := TNews.Create(cbType.Items[i] + '.news');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  NewsObj[cbType.ItemIndex].Add(edTitle.Text);
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;
  NewsObj[cbType.ItemIndex].ReadAll(List);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(cbType.Text + ' News');
  Memo1.Lines.Add('-----------------------------------------------------------');
  Memo1.Lines.Add(List.Text);
  List.Free;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  SearchStr: string;
  ResultList: TStringList;
begin
  ResultList := TStringList.Create;
  if InputQuery('Search News', 'Please input keyword', SearchStr) then
    if NewsObj[cbType.ItemIndex].Find(SearchStr, ResultList) then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add(cbType.Text + ' News');
      Memo1.Lines.Add('--------------------------------------------------');
      Memo1.Lines.Add(ResultList.Text);
    end
    else
      Memo1.Lines.Text := SearchStr + ' not found in ' + cbType.Text + ' news';
  ResultList.Free;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: integer;
begin
  for i := 0 to High(NewsObj) do
    NewsObj[i].Free;
  NewsObj := nil;
end;

end.


