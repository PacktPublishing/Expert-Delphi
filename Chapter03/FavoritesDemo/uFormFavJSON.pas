unit uFormFavJSON;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  System.JSON, System.JSON.Readers, uFavorite;

type
  TFormFavJSON = class(TForm)
    ToolBar1: TToolBar;
    spdbtnBack: TSpeedButton;
    Label1: TLabel;
    btnWriteDOM: TButton;
    btnReadText: TButton;
    btnReadDOM: TButton;
    btnWriteWriter: TButton;
    btnWriteBuilder: TButton;
    MemoLog: TMemo;
    btnReadReader: TButton;
    procedure btnWriteDOMClick(Sender: TObject);
    procedure spdbtnBackClick(Sender: TObject);
    procedure btnReadDOMClick(Sender: TObject);
    procedure btnReadTextClick(Sender: TObject);
    procedure btnWriteWriterClick(Sender: TObject);
    procedure btnWriteBuilderClick(Sender: TObject);
    procedure btnReadReaderClick(Sender: TObject);
  private
    function GetFilename: string;
    function FavListToJsonTextWithDOM: string;
    function FavListToJsonTextWithWriter: string;
    function FavListToJsonTextWithBuilder: string;
    function ReadJsonTextFromFile: string;
    procedure WriteJsonTextToFile(txt: string);
    procedure ProcessFavObj(favs: TFavorites; favObj: TJSONObject);
    procedure DisplayFavsCount(favs: TFavorites);
    procedure ProcessFavRead(favs: TFavorites; jtr: TJsonTextReader);
  public
    { Public declarations }
  end;

var
  FormFavJSON: TFormFavJSON;

implementation

{$R *.fmx}

uses
  System.IOUtils, uFormFavMain,
  System.JSON.Writers,
  System.JSON.Types,
  System.JSON.Builders;

function TFormFavJSON.FavListToJsonTextWithDOM: string;
var
  fav: TFavorite; favs: TFavorites;
  objFavs, objF: TJSONObject; arrFavs: TJSONArray;

begin
  favs := FormFavMain.Favs;

  objFavs := TJSONObject.Create;
  try
    arrFavs := TJSONArray.Create;

    for fav in favs do
    begin
      objF := TJSONObject.Create;
      objF.AddPair('URL', TJSONString.Create(fav.URL));
      objF.AddPair('Caption', TJSONString.Create(fav.Caption));
      arrFavs.Add(objF);
    end;
    objFavs.AddPair('Favorites', arrFavs);

    Result := objFavs.ToString;
  finally
    objFavs.Free;
  end;
end;

function TFormFavJSON.FavListToJsonTextWithWriter: string;
var
  fav: TFavorite; favs: TFavorites;
  StringWriter: TStringWriter;
  Writer: TJsonTextWriter;
begin
  favs := FormFavMain.Favs;

  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  try
    Writer.Formatting := TJsonFormatting.Indented;

    Writer.WriteStartObject;
    Writer.WritePropertyName('Favorites');
    Writer.WriteStartArray;

    for fav in favs do
    begin
      Writer.WriteStartObject;
      Writer.WritePropertyName('URL');
      Writer.WriteValue(fav.URL);
      Writer.WritePropertyName('Caption');
      Writer.WriteValue(fav.Caption);
      Writer.WriteEndObject;
    end;

    Writer.WriteEndArray;
    Writer.WriteEndObject;

    Result := StringWriter.ToString;

  finally
    Writer.Free;
    StringWriter.Free;
  end;
end;

function TFormFavJSON.FavListToJsonTextWithBuilder: string;
var
  StringWriter: TStringWriter;
  Writer: TJsonTextWriter;
  Builder: TJSONObjectBuilder;
begin
  StringWriter := TStringWriter.Create();
  Writer := TJsonTextWriter.Create(StringWriter);
  Builder := TJSONObjectBuilder.Create(Writer);
  try
    Writer.Formatting := TJsonFormatting.Indented;

    Builder
    .BeginObject
      .BeginArray('Favorites')
        .BeginObject
          .Add('URL', 'www.embarcadero.com/products/delphi')
          .Add('Caption', 'Delphi Home Page')
        .EndObject
        .BeginObject
          .Add('URL', 'docwiki.embarcadero.com/RADStudio/en')
          .Add('Caption', 'RAD Studio online documentation')
        .EndObject
      .EndArray
    .EndObject;

    Result := StringWriter.ToString;

  finally
    Builder.Free;
    Writer.Free;
    StringWriter.Free;
  end;
end;

function TFormFavJSON.GetFilename: string;
begin
  Result := TPath.Combine(TPath.GetDocumentsPath, 'favs.json');
end;

procedure TFormFavJSON.WriteJsonTextToFile(txt: string);
var sw: TStreamWriter;
begin
  sw := TStreamWriter.Create(GetFilename, False, TEncoding.UTF8);
  try
    sw.WriteLine(txt);
  finally
    sw.Free;
  end;
end;

procedure TFormFavJSON.btnWriteDOMClick(Sender: TObject);
var s: string;
begin
  s := FavListToJsonTextWithDOM;
  WriteJsonTextToFile(s);
end;

procedure TFormFavJSON.btnWriteWriterClick(Sender: TObject);
var s: string;
begin
  s := FavListToJsonTextWithWriter;
  WriteJsonTextToFile(s);
end;

procedure TFormFavJSON.btnWriteBuilderClick(Sender: TObject);
var s: string;
begin
  s := FavListToJsonTextWithBuilder;
  WriteJsonTextToFile(s);
end;

function TFormFavJSON.ReadJsonTextFromFile: string;
var sr: TStreamReader;
begin
  sr := TStreamReader.Create(GetFilename, TEncoding.UTF8);
  try
    Result := sr.ReadToEnd;
  finally
    sr.Free;
  end;
end;

procedure TFormFavJSON.btnReadTextClick(Sender: TObject);
var sr: TStreamReader;
begin
  sr := TStreamReader.Create(GetFilename, TEncoding.UTF8);
  try
    while not sr.EndOfStream do
      MemoLog.Lines.Add(sr.ReadLine);
  finally
    sr.Free;
  end;
end;

procedure TFormFavJSON.btnReadDOMClick(Sender: TObject);
var
  favs: TFavorites; valRoot: TJSONValue; objRoot: TJSONObject;
  valFavs: TJSONValue; arrFavs: TJSONArray; i: integer;
begin
  favs := TFavorites.Create;
  try
    valRoot := TJSONObject.ParseJSONValue(ReadJsonTextFromFile);
    if valRoot <> nil then
    begin
      if valRoot is TJSONObject then
      begin
        objRoot := TJSONObject(valRoot);
        if objRoot.Count > 0 then
        begin
          valfavs := objRoot.Values['Favorites'];
          if valFavs <> nil then
          begin
            if valFavs is TJSONArray then
            begin
              arrFavs := TJSONArray(valFavs);
              for i := 0 to arrfavs.Count-1 do
              begin
                if arrFavs.Items[i] is TJSONObject then
                  ProcessFavObj(favs, TJSONObject(arrFavs.Items[i]));
              end;
            end;
          end;
        end;
      end;
    end;

    DisplayFavsCount(favs);
  finally
    favs.Free;
  end;
end;

procedure TFormFavJSON.ProcessFavObj(favs: TFavorites; favObj: TJSONObject);
var fav: TFavorite; val: TJSONValue;
begin
  fav := TFavorite.Create;

  val := favObj.Values['URL'];
  if val <> nil then
    if val is TJSONString then
      fav.URL := TJSONString(val).Value;

  val := favObj.Values['Caption'];
  if val <> nil then
    if val is TJSONString then
      fav.Caption := TJSONString(val).Value;

  favs.Add(fav);
end;

procedure TFormFavJSON.btnReadReaderClick(Sender: TObject);
var jtr: TJsonTextReader; sr: TStringReader; favs: TFavorites;
begin
  favs := TFavorites.Create;
  try
    sr := TStringReader.Create(ReadJsonTextFromFile);
    try
      jtr := TJsonTextReader.Create(sr);
      try
        while jtr.Read do
        begin
          if jtr.TokenType = TJsonToken.StartObject then
            ProcessFavRead(favs, jtr);
        end;
      finally
        jtr.Free;
      end;
    finally
      sr.Free;
    end;

    DisplayFavsCount(favs);
  finally
    favs.Free;
  end;
end;

procedure TFormFavJSON.ProcessFavRead(favs: TFavorites; jtr: TJsonTextReader);
var fav: TFavorite;
begin
  fav := TFavorite.Create;

  while jtr.Read do
  begin
    if jtr.TokenType = TJsonToken.PropertyName then
    begin
      if jtr.Value.ToString = 'URL' then
      begin
        jtr.Read;
        fav.URL := jtr.Value.AsString;
      end

      else if jtr.Value.ToString = 'Caption' then
      begin
        jtr.Read;
        fav.Caption := jtr.Value.AsString;
      end
    end

    else if jtr.TokenType = TJsonToken.EndObject then
    begin
      favs.add(fav);
      exit;
    end;
  end;
end;


procedure TFormFavJSON.DisplayFavsCount(favs: TFavorites);
begin
  if favs <> nil then
    ShowMessage('Favorites count: ' + favs.Count.ToString)
  else
    ShowMessage('Favorites reference is nil');
end;

procedure TFormFavJSON.spdbtnBackClick(Sender: TObject);
begin
  FormFavMain.Show;
end;

end.
