unit uFormFavTextFiles;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TFormFavTextFiles = class(TForm)
    ToolBar1: TToolBar;
    spdbtnBack: TSpeedButton;
    Label1: TLabel;
    btnWrite: TButton;
    btnRead: TButton;
    MemoLog: TMemo;
    procedure spdbtnBackClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
  private
    function GetFilename: string;
  public
    { Public declarations }
  end;

var
  FormFavTextFiles: TFormFavTextFiles;

implementation

{$R *.fmx}

uses
  uFormFavMain, uFavorite, System.IOUtils;

function TFormFavTextFiles.GetFilename: string;
begin
  Result := TPath.Combine(TPath.GetDocumentsPath, 'favs.txt');
end;

procedure TFormFavTextFiles.btnWriteClick(Sender: TObject);
var sw: TStreamWriter; fav: TFavorite; favs: TFavorites;
begin
  favs := FormFavMain.Favs;
  sw := TStreamWriter.Create(GetFilename, False, TEncoding.UTF8);
  try
    for fav in favs do
    begin
      sw.WriteLine(fav.URL);
      sw.WriteLine(fav.Caption);
    end;
  finally
    sw.Free;
  end;
end;

procedure TFormFavTextFiles.btnReadClick(Sender: TObject);
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

procedure TFormFavTextFiles.spdbtnBackClick(Sender: TObject);
begin
  FormFavMain.Show;
end;

end.
