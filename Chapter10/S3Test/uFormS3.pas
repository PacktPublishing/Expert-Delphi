unit uFormS3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TFormS3 = class(TForm)
    Panel1: TPanel;
    MemoLog: TMemo;
    btnGetBuckets: TButton;
    Edit1: TEdit;
    btnWrite: TButton;
    btnRead: TButton;
    procedure btnGetBucketsClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
  private
    procedure Log(s: string);
    function GetData: string;
    procedure SetData(Value: string);
  public
    { Public declarations }
  end;

var
  FormS3: TFormS3;

implementation

{$R *.fmx}

uses uDMS3;

{ TFormS3 }

const TODO_BUCKET = 'todostorage';
const TODO_OBJ = 'testdata';

procedure TFormS3.btnGetBucketsClick(Sender: TObject);
var strs: TStrings; s: string;
begin
  MemoLog.Lines.Clear;

  strs := DMS3.S3.ListBuckets;
  if strs <> nil then
  for s in strs do
    Log(s);

end;

procedure TFormS3.Log(s: string);
begin
  MemoLog.Lines.Add(s);
end;

procedure TFormS3.btnReadClick(Sender: TObject);
var s: string;
begin
  s := GetData;
  Log('Read: ' + s);
end;

procedure TFormS3.btnWriteClick(Sender: TObject);
var s: string;
begin
  s := Edit1.Text;
  SetData(s);
  Log('Written: ' + s);
end;

function TFormS3.GetData: string;
var bstr: TBytesStream;
begin
  bstr := TBytesStream.Create;
  try
    DMS3.S3.GetObject(TODO_BUCKET, TODO_OBJ, bstr);
    Result := TEncoding.UTF8.GetString(bstr.Bytes);
  finally
    bstr.Free;
  end;
end;

procedure TFormS3.SetData(Value: string);
var strstr: TStringStream;
begin
  strstr := TStringStream.Create(Value, TEncoding.UTF8);
  try
    DMS3.S3.UploadObject(TODO_BUCKET, TODO_OBJ, strstr.bytes);
  finally
    strstr.Free;
  end;
end;

end.
