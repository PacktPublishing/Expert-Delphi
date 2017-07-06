program FavoritesDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFavorite in 'uFavorite.pas',
  uFormFavJSON in 'uFormFavJSON.pas' {FormFavJSON},
  uFormFavMain in 'uFormFavMain.pas' {FormFavMain},
  uFormFavTextFiles in 'uFormFavTextFiles.pas' {FormFavTextFiles},
  favs in 'favs.pas',
  uFormFavXML in 'uFormFavXML.pas' {FormFavXML};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFavMain, FormFavMain);
  Application.CreateForm(TFormFavTextFiles, FormFavTextFiles);
  Application.CreateForm(TFormFavJSON, FormFavJSON);
  Application.CreateForm(TFormFavXML, FormFavXML);
  Application.Run;
end.
