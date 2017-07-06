unit uDMToDo;

interface

uses
  System.SysUtils, System.Classes, uToDoTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.FMXUI.Wait;

type
  TDMToDo = class(TDataModule, IToDoData)
    fdconnToDos: TFDConnection;
    fdqToDoInsert: TFDQuery;
    fdqToDoSelect: TFDQuery;
    fdqToDoUpdate: TFDQuery;
    fdqToDoDelete: TFDQuery;
    fdqToDoSelectAll: TFDQuery;
    fdqToDoMaxId: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure fdconnToDosBeforeConnect(Sender: TObject);
    procedure fdconnToDosAfterConnect(Sender: TObject);
  private
    function IsMobilePlatform: boolean;
    function GetNewId: integer;
  public
    // IToDoData
    function ToDoCreate(aValue: TToDo): integer;
    function ToDoRead(id: integer; out aValue: TToDo): boolean;
    function ToDoUpdate(aValue: TToDo): boolean;
    function ToDoDelete(id: integer): boolean;
    procedure ToDoList(aList: TToDos);
  end;

var
  DMToDo: TDMToDo;

implementation

uses
  System.IOUtils;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TDMToDo.IsMobilePlatform: boolean;
begin
  Result := (TOSVersion.Platform = pfiOS) or (TOSVersion.Platform = pfAndroid);
end;

procedure TDMToDo.fdconnToDosBeforeConnect(Sender: TObject);
begin
  if IsMobilePlatform then
    fdconnToDos.Params.Values['Database'] :=
      TPath.Combine(TPath.GetDocumentsPath, 'ToDos.db')
end;

procedure TDMToDo.fdconnToDosAfterConnect(Sender: TObject);
const
  sCreateTableSQL = 'CREATE TABLE IF NOT EXISTS ToDos ('
   + 'Id INTEGER NOT NULL PRIMARY KEY,'
   + 'Title TEXT, Category TEXT)';
begin
  if IsMobilePlatform then
    fdconnToDos.ExecSQL(sCreateTableSQL);
end;

function TDMToDo.GetNewId: integer;
var fld: TField;
begin
  fdqToDoMaxId.Open;
  try
    fld := fdqToDoMaxId.FieldByName('MaxId');
    if fld.IsNull then
      Result := 1
    else
      Result := fld.AsInteger + 1;
  finally
    fdqToDoMaxId.Close;
  end;
end;

function TDMToDo.ToDoCreate(aValue: TToDo): integer;
var id: integer;
begin
  id := GetNewId;
  fdqToDoInsert.ParamByName('Id').AsInteger := id;
  fdqToDoInsert.ParamByName('Title').AsString := aValue.Title;;
  fdqToDoInsert.ParamByName('Category').AsString := aValue.Category;
  try
    fdqToDoInsert.ExecSQL;
    Result := id;
  except
    Result := -1;
  end;
end;

function TDMToDo.ToDoRead(id: integer; out aValue: TToDo): boolean;
begin
  fdqToDoSelect.ParamByName('Id').AsInteger := id;
  fdqToDoSelect.Open;
  try
    if fdqToDoSelect.RecordCount > 0 then
    begin
      Result := True;
      aValue.Id := id;
      aValue.Title := fdqToDoSelect.FieldByName('Title').AsString;
      aValue.Category := fdqToDoSelect.FieldByName('Category').AsString;
    end
    else
      Result := False;
  finally
    fdqToDoSelect.Close;
  end;
end;

function TDMToDo.ToDoUpdate(aValue: TToDo): boolean;
begin
  fdqToDoUpdate.ParamByName('Id').AsInteger := aValue.Id;
  fdqToDoUpdate.ParamByName('Title').AsString := aValue.Title;;
  fdqToDoUpdate.ParamByName('Category').AsString := aValue.Category;
  try
    fdqToDoUpdate.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TDMToDo.ToDoDelete(id: integer): boolean;
begin
  fdqToDoDelete.ParamByName('Id').AsInteger := id;
  try
    fdqToDoDelete.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TDMToDo.ToDoList(aList: TToDos);
var item: TToDo;
begin
  if aList <> nil then
  begin
    aList.Clear;
    fdqToDoSelectAll.Open;
    try
      while not fdqToDoSelectAll.Eof do
      begin
        item.Id := fdqToDoSelectAll.FieldByName('Id').AsInteger;
        item.Title := fdqToDoSelectAll.FieldByName('Title').AsString;
        item.Category := fdqToDoSelectAll.FieldByName('Category').AsString;
        aList.Add(item);
        fdqToDoSelectAll.Next;
      end;
    finally
      fdqToDoSelectAll.Close;
    end;
  end;
end;


end.
