unit uToDoRes;

// EMS Resource Unit

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes,
  uToDoTypes;

type
  [ResourceName('ToDo')]
  {$METHODINFO ON}
  TToDoResource = class
  private
    FToDoData: IToDoData;
    function GetToDoData: IToDoData;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;
  {$METHODINFO OFF}

implementation

uses uDMToDoS3, uToDoUtils;

function TToDoResource.GetToDoData: IToDoData;
begin
  if FToDoData = nil then
    FToDoData := TDMToDoS3.Create(nil);
  Result := FToDoData;
end;

procedure TToDoResource.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var aToDos: TToDos; s: string;
begin
  aToDos := TToDos.Create;
  try
    GetToDoData.ToDoList(aToDos);
    s := ToDosToStr(aToDos);
    AResponse.Body.JSONWriter.WriteRaw(s);
  finally
    aToDos.Free;
  end;
end;

procedure TToDoResource.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var aToDo: TToDo; id: integer; s: string;
begin
  id := ARequest.Params.Values['item'].ToInteger;
  if GetToDoData.ToDoRead(id, aToDo) then
    s := ToDoToStr(aToDo)
  else
    s := 'Failed';
  AResponse.Body.JSONWriter.WriteRaw(s);
end;

procedure TToDoResource.Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var aStream: TStream; bstr: TBytesStream; s: string; aToDo: TToDo;
begin
  if not ARequest.Body.TryGetStream(aStream) then
    AResponse.RaiseBadRequest('no data');
  bstr := aStream as TBytesStream;
  s := TEncoding.UTF8.GetString(bstr.Bytes);
  aToDo := StrToToDo(s);
  GetToDoData.ToDoCreate(aToDo);
end;

procedure TToDoResource.PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var aStream: TStream; bstr: TBytesStream; s: string; aToDo: TToDo;
begin
  if not ARequest.Body.TryGetStream(aStream) then
    AResponse.RaiseBadRequest('no data');
  bstr := aStream as TBytesStream;
  s := TEncoding.UTF8.GetString(bstr.Bytes);
  aToDo := StrToToDo(s);
  GetToDoData.ToDoUpdate(aToDo);
end;

procedure TToDoResource.DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var id: integer;
begin
  id := ARequest.Params.Values['item'].ToInteger;
  GetToDoData.ToDoDelete(id);
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TToDoResource));
end;

initialization
  Register;
end.


