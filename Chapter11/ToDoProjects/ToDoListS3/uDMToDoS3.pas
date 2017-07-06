unit uDMToDoS3;

interface

uses
  System.SysUtils, System.Classes, Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI,
  uToDoTypes;

type
  TDMToDoS3 = class(TDataModule, IToDoData)
    AmazonConnectionInfo1: TAmazonConnectionInfo;
  private
    FS3: TAmazonStorageService;
    function GetS3: TAmazonStorageService;
  public
    destructor Destroy; override;
    function S3WriteStr(bucket, obj, s: string): boolean;
    function S3ReadStr(bucket, obj: string; var s: string): boolean;
    property S3: TAmazonStorageService read GetS3;
  public
    // IToDoData
    function ToDoCreate(aValue: TToDo): integer;
    function ToDoRead(id: integer; out aValue: TToDo): boolean;
    function ToDoUpdate(aValue: TToDo): boolean;
    function ToDoDelete(id: integer): boolean;
    procedure ToDoList(aList: TToDos);

  end;

var
  DMToDoS3: TDMToDoS3;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uToDoUtils;

{$R *.dfm}

const
  TODO_BUCKET = 'todostorage';
  TODO_DATA = 'tododata';

{ TDMS3 }

destructor TDMToDoS3.Destroy;
begin
  FS3.Free;
  inherited;
end;

function TDMToDoS3.GetS3: TAmazonStorageService;
begin
  if FS3 = nil then
    FS3 := TAmazonStorageService.Create(AmazonConnectionInfo1);
  Result := FS3;
end;

function TDMToDoS3.S3ReadStr(bucket, obj: string; var s: string): boolean;
var bstr: TBytesStream;
begin
  bstr := TBytesStream.Create;
  try
    Result := S3.GetObject(bucket, obj, bstr);
    if Result then
      s := TEncoding.UTF8.GetString(bstr.Bytes)
    else
      s := '';  
  finally
    bstr.Free;
  end;
end;

function TDMToDoS3.S3WriteStr(bucket, obj, s: string): boolean;
var strstr: TStringStream;
begin
  strstr := TStringStream.Create(s, TEncoding.UTF8);
  try
    Result := S3.UploadObject(bucket, obj, strstr.bytes);
  finally
    strstr.Free;
  end;
end;

procedure TDMToDoS3.ToDoList(aList: TToDos);
var s: string;
begin
  if aList <> nil then
  begin
    aList.Clear;
    if S3ReadStr(TODO_BUCKET, TODO_DATA, s) then
      StrToToDos(s, aList);
  end;
end;

function TDMToDoS3.ToDoRead(id: integer; out aValue: TToDo): boolean;
var aList: TToDos; i, index: integer; s: string;
begin
  aList := TToDos.Create;
  try
    Result := S3ReadStr(TODO_BUCKET, TODO_DATA, s);
    if Result then
    begin
      StrToToDos(s, aList);

      index := -1;
      for i := 0 to aList.Count-1 do
      if id = aList[i].Id then
      begin
        index := i;
        break;
      end;

      Result := index > -1;
      if Result then
        aValue := aList[i];
    end;
  finally
    aList.Free;
  end;
end;

function TDMToDoS3.ToDoCreate(aValue: TToDo): integer;
var aList: TToDos; newId: integer; s: string;
begin
  Result := -1;
  aList := TToDos.Create;
  try
    S3ReadStr(TODO_BUCKET, TODO_DATA, s);
    StrToToDos(s, aList);

    if aList.Count > 0 then
      newId := aList[0].Id + 1
    else  
      newId := 1;
    aValue.Id := newId;
    aList.Insert(0, aValue);

    s := ToDosToStr(aList);
    if S3WriteStr(TODO_BUCKET, TODO_DATA, s) then
      Result := newId;
  finally
    aList.Free;
  end;
end;

function TDMToDoS3.ToDoDelete(id: integer): boolean;
var aList: TToDos; i, index: integer; s: string;
begin
  Result := False;
  aList := TToDos.Create;
  try
    if S3ReadStr(TODO_BUCKET, TODO_DATA, s) then
    begin
      StrToToDos(s, aList);

      index := -1;
      for i := 0 to aList.Count-1 do
      if id = aList[i].Id then
      begin
        index := i;
        break;
      end;

      if index > -1 then
      begin
        aList.Delete(index);
        s := ToDosToStr(aList);
        Result := S3WriteStr(TODO_BUCKET, TODO_DATA, s);
      end;
    end;
  finally
    aList.Free;
  end;
end;

function TDMToDoS3.ToDoUpdate(aValue: TToDo): boolean;
var aList: TToDos; i, index: integer; s: string;
begin
  Result := False;
  aList := TToDos.Create;
  try
    if S3ReadStr(TODO_BUCKET, TODO_DATA, s) then
    begin
      StrToToDos(s, aList);

      index := -1;
      for i := 0 to aList.Count-1 do
      if aValue.id = aList[i].Id then
      begin
        index := i;
        break;
      end;

      if index > -1 then
      begin
        aList[index] := aValue;
        s := ToDosToStr(aList);
        Result := S3WriteStr(TODO_BUCKET, TODO_DATA, s);
      end;
    end;
  finally
    aList.Free;
  end;
end;

end.
