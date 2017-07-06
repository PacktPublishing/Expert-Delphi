unit uINQStatsUtils;

interface

uses
  System.Generics.Collections;

type
  TPopulation = record
    Year: integer;
    Value: integer;
  end;

  TPopulationList = TList<TPopulation>;

procedure JsonToPopulationList(json: string; aList: TPopulationList);

implementation

uses
  System.SysUtils,
  System.Classes,
  System.JSON.Readers,
  System.JSON.Types;

procedure ReadItem(aList: TPopulationList; jtr: TJSONTextReader);
var item: TPopulation;
begin
  while jtr.Read do
  begin
    if jtr.TokenType = TJsonToken.PropertyName then
    begin
      if jtr.Value.ToString = 'year' then
      begin
        jtr.Read;
        item.year := StrToInt(jtr.Value.AsString);
      end

      else if jtr.Value.ToString = 'data' then
      begin
        jtr.Read;
        item.Value := StrToInt(jtr.Value.AsString);
      end
    end

    else if jtr.TokenType = TJsonToken.EndObject then
    begin
      aList.add(item);
      exit;
    end;
  end;
end;

procedure JsonToPopulationList(json: string; aList: TPopulationList);
var jtr: TJsonTextReader; sr: TStringReader;
begin
  if aList <> nil then
  begin
    aList.Clear;

    sr := TStringReader.Create(json);
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
end;

end.
