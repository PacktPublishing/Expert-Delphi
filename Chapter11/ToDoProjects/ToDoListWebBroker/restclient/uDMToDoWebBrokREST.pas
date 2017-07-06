unit uDMToDoWebBrokREST;

interface

uses
  System.SysUtils, System.Classes, uToDoTypes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TDMToDoWebBrokREST = class(TDataModule, IToDoData)
    rclientToDo: TRESTClient;
    rrespToDo: TRESTResponse;
    rreqToDoCreate: TRESTRequest;
    rreqToDoRead: TRESTRequest;
    rreqToDoUpdate: TRESTRequest;
    rreqToDoDelete: TRESTRequest;
    rreqToDoList: TRESTRequest;
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
  DMToDoWebBrokREST: TDMToDoWebBrokREST;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uToDoUtils, System.JSON;

{$R *.dfm}

{ TDMToDoWebBrokREST }

function TDMToDoWebBrokREST.ToDoCreate(aValue: TToDo): integer;
begin
  rreqToDoCreate.Params[0].Value := aValue.Title;
  rreqToDoCreate.Params[1].Value := aValue.Category;
  rreqToDoCreate.Execute;
  Result := rrespToDo.Content.ToInteger;
end;

function TDMToDoWebBrokREST.ToDoRead(id: integer; out aValue: TToDo): boolean;
begin
  rreqToDoRead.Params[0].Value := id.ToString;
  rreqToDoRead.Execute;
  Result := rrespToDo.Content <> 'Failed';
  if Result then
    aValue := StrToToDo(rrespToDo.Content);
end;

function TDMToDoWebBrokREST.ToDoUpdate(aValue: TToDo): boolean;
begin
  rreqToDoUpdate.Params[0].Value := aValue.Id.ToString;
  rreqToDoUpdate.Params[1].Value := aValue.Title;
  rreqToDoUpdate.Params[2].Value := aValue.Category;
  rreqToDoUpdate.Execute;
  Result := rrespToDo.Content = 'OK';
end;

function TDMToDoWebBrokREST.ToDoDelete(id: integer): boolean;
begin
  rreqToDoDelete.Params[0].Value := id.ToString;
  rreqToDoDelete.Execute;
  Result := rrespToDo.Content = 'OK';
end;

procedure TDMToDoWebBrokREST.ToDoList(aList: TToDos);
begin
  aList.Clear;
  rreqToDoList.Execute;
  StrToToDos(rrespToDo.Content, aList);
end;

end.
