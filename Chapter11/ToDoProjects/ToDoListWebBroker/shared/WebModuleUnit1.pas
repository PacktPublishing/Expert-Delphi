unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp,
  uToDoTypes;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActToDoCreateAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActToDoReadAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActToDoUpdateAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActToDoDeleteAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1ActToDoListAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    FToDoData: IToDoData;
    function GetToDoData: IToDoData;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uDMToDoS3, uToDoUtils;

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>To-Do REST API</title></head>' +
    '<body>Delphi "To-Do List" REST API</body>' +
    '</html>';
end;

function TWebModule1.GetToDoData: IToDoData;
begin
  if FToDoData = nil then
    FToDoData := TDMToDoS3.Create(nil);
  Result := FToDoData;
end;

procedure TWebModule1.WebModule1ActToDoCreateAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var aToDo: TToDo; id: integer;
begin
  aTodo.Title := Request.QueryFields.Values['title'];
  aToDo.Category := Request.QueryFields.Values['category'];
  id := GetToDoData.ToDoCreate(aToDo);
  Response.Content := id.ToString;
end;

procedure TWebModule1.WebModule1ActToDoReadAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var aToDo: TToDo; id: integer;
begin
  id := Request.QueryFields.Values['id'].ToInteger;
  if GetToDoData.ToDoRead(id, aToDo) then
    Response.Content := ToDoToStr(aToDo)
  else
    Response.Content := 'Failed';
  Response.ContentType := 'application/json';
end;

procedure TWebModule1.WebModule1ActToDoUpdateAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var aToDo: TToDo;
begin
  aToDo.Id := Request.QueryFields.Values['id'].ToInteger;
  aTodo.Title := Request.QueryFields.Values['title'];
  aToDo.Category := Request.QueryFields.Values['category'];
  if GetToDoData.ToDoUpdate(aToDo) then
    Response.Content := 'OK'
  else
    Response.Content := 'Failed';
end;

procedure TWebModule1.WebModule1ActToDoDeleteAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var aToDo: TToDo; id: integer;
begin
  id := Request.QueryFields.Values['id'].ToInteger;
  if GetToDoData.ToDoDelete(id) then
    Response.Content := 'OK'
  else
    Response.Content := 'Failed';
end;

procedure TWebModule1.WebModule1ActToDoListAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var aList: TToDos; json: string;
begin
  aList := TToDos.Create;
  try
    GetToDoData.ToDoList(aList);
    Response.Content := ToDosToStr(aList);
    Response.ContentType := 'application/json';
  finally
    aList.Free;
  end;
end;

end.
