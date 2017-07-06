unit uToDoUtils;

interface

uses
  uToDoTypes;

function ToDosToStr(aList: TToDos): string;
procedure StrToToDos(s: string; aList: TToDos);

implementation

uses
  System.SysUtils, System.Classes, System.JSON.Types,
  System.JSON.Writers, System.JSON.Readers;

procedure WriteItem(item: TToDo; jw: TJSONWriter);
begin
  jw.WritePropertyName('ID');
  jw.WriteValue(item.Id.ToString);
  jw.WritePropertyName('Title');
  jw.WriteValue(item.Title);
  jw.WritePropertyName('Category');
  jw.WriteValue(item.Category);
end;

function ToDosToStr(aList: TToDos): string;
var
  item: TToDo;
  sw: TStringWriter;
  jtw: TJsonTextWriter;
begin
  sw := TStringWriter.Create();
  jtw := TJsonTextWriter.Create(sw);
  try
    jtw.WriteStartArray;

    for item in aList do
    begin
      jtw.WriteStartObject;
      WriteItem(item, jtw);
      jtw.WriteEndObject;
    end;

    jtw.WriteEndArray;

    Result := sw.ToString;
  finally
    jtw.Free;
    sw.Free;
  end;
end;

function ReadStr(jtr: TJSONReader): string;
begin
  jtr.Read;
  jtr.Read;

  Result := jtr.Value.AsString;
end;

procedure ReadItem(aList: TToDos; jtr: TJSONReader);
var todo: TToDo;
begin
  todo.Id := StrToInt(ReadStr(jtr));
  todo.Title := ReadStr(jtr);
  todo.Category := ReadStr(jtr);
  aList.Add(todo);
end;

procedure StrToToDos(s: string; aList: TToDos);
var jtr: TJsonTextReader; sr: TStringReader;
begin
  sr := TStringReader.Create(s);
  try
    jtr := TJsonTextReader.Create(sr);
    try
      while jtr.Read do
        if jtr.TokenType = TJsonToken.StartObject then
          ReadItem(aList, jtr);
    finally
      jtr.Free;
    end;
  finally
    sr.Free;
  end;
end;

end.
