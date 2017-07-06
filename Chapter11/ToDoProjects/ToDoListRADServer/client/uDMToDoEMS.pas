unit uDMToDoEMS;

interface

uses
  System.SysUtils, System.Classes, uToDoTypes, IPPeerClient,
  REST.Backend.ServiceTypes, System.JSON, REST.Backend.EMSServices, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Backend.EndPoint,
  REST.Backend.EMSProvider;

type
  TDMToDoEMS = class(TDataModule, IToDoData)
    EMSProvider1: TEMSProvider;
    beToDoList: TBackendEndpoint;
    rrespToDo: TRESTResponse;
    beToDoRead: TBackendEndpoint;
    beToDoCreate: TBackendEndpoint;
    beToDoUpdate: TBackendEndpoint;
    beToDoDelete: TBackendEndpoint;
  private
    { Private declarations }
  public
    // IToDoData
    function ToDoCreate(aValue: TToDo): integer;
    function ToDoRead(id: integer; out aValue: TToDo): boolean;
    function ToDoUpdate(aValue: TToDo): boolean;
    function ToDoDelete(id: integer): boolean;
    procedure ToDoList(aList: TToDos);
  end;

var
  DMToDoEMS: TDMToDoEMS;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uToDoUtils, REST.Types;

{$R *.dfm}

{ TDMToDoWebBrokREST }

function TDMToDoEMS.ToDoCreate(aValue: TToDo): integer;
var strstr: TStringStream;
begin
  Result := 0; // no response expected from POST request

  strstr := TStringStream.Create(ToDoToStr(aValue), TEncoding.UTF8);
  try
    beToDoCreate.Params.Clear;
    beToDoCreate.AddBody(strstr, TRESTContentType.ctAPPLICATION_JSON);
    beToDoCreate.Execute;
  finally
    strstr.Free;
  end;
end;

function TDMToDoEMS.ToDoRead(id: integer; out aValue: TToDo): boolean;
begin
  beToDoRead.Params[0].Value := id.ToString;
  beToDoRead.Execute;
  Result := rrespToDo.Content <> 'Failed';
  if Result then
    aValue := StrToToDo(rrespToDo.Content);
end;

function TDMToDoEMS.ToDoUpdate(aValue: TToDo): boolean;
var strstr: TStringStream;
begin
  Result := True; // no response expected from PUT request

  strstr := TStringStream.Create(ToDoToStr(aValue), TEncoding.UTF8);
  try
    beToDoUpdate.Params.Clear;
    beToDoUpdate.AddBody(strstr, TRESTContentType.ctAPPLICATION_JSON);
    beToDoUpdate.Execute;
  finally
    strstr.Free;
  end;
end;

function TDMToDoEMS.ToDoDelete(id: integer): boolean;
begin
  beToDoDelete.Params[0].Value := id.ToString;
  beToDoDelete.Execute;
end;

procedure TDMToDoEMS.ToDoList(aList: TToDos);
begin
  aList.Clear;
  beToDoList.Execute;
  StrToToDos(rrespToDo.Content, aList);
end;

end.
