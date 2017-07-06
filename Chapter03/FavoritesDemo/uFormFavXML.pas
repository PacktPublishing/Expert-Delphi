unit uFormFavXML;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.omnixmldom,
  uFavorite;

type
  TFormFavXML = class(TForm)
    ToolBar1: TToolBar;
    spdbtnBack: TSpeedButton;
    Label1: TLabel;
    btnWrite: TButton;
    XMLDocument1: TXMLDocument;
    btnRead: TButton;
    procedure spdbtnBackClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
  private
    function GetFilename: string;
    procedure DisplayFavsCount(favs: TFavorites);
  public
    { Public declarations }
  end;

var
  FormFavXML: TFormFavXML;

implementation

{$R *.fmx}

uses uFormFavMain, System.IOUtils, favs;

function TFormFavXML.GetFilename: string;
begin
  Result := TPath.Combine(TPath.GetDocumentsPath, 'favs.xml');
end;

procedure TFormFavXML.btnReadClick(Sender: TObject);
var
  favs: TFavorites; fav: TFavorite;
  favsXML: IXMLFavoritesType;
  i: integer;
begin
  favs := TFavorites.Create;
  try
    favsXML := LoadFavorites(GetFilename);
    for i := 0 to favsXML.Count-1 do
    begin
      fav := TFavorite.Create;
      fav.URL := favsXML[i].URL;
      fav.Caption := favsXML[i].Caption;
      favs.Add(fav);
    end;

    DisplayFavsCount(favs);

  finally
    favs.Free;
  end;
end;

procedure TFormFavXML.btnWriteClick(Sender: TObject);
var
  favs: TFavorites; fav: TFavorite;
  favsXML: IXMLFavoritesType; favXML: IXMLFavoriteType;
begin
  favs := FormFavMain.Favs;

  favsXML := NewFavorites;
  for fav in favs do
  begin
    favXML := favsXML.Add;
    favXML.URL := fav.URL;
    favXML.Caption := fav.Caption;
  end;

  XMLDocument1.LoadFromXML(favsXML.XML);
  XMLDocument1.SaveToFile(GetFilename);
end;

procedure TFormFavXML.DisplayFavsCount(favs: TFavorites);
begin
  if favs <> nil then
    ShowMessage('Favorites count: ' + favs.Count.ToString)
  else
    ShowMessage('Favorites reference is nil');
end;

procedure TFormFavXML.spdbtnBackClick(Sender: TObject);
begin
  FormFavMain.Show;
end;

end.
