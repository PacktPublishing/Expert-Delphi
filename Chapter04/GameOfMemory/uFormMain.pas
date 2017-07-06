unit uFormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ImgList, FMX.ListBox;

type
  TFormMain = class(TForm)
    ToolBar1: TToolBar;
    spdbtnSettings: TSpeedButton;
    grdltTiles: TGridLayout;
    spdbtnPlay: TSpeedButton;
    lblScore: TLabel;
    cmbbxLevel: TComboBox;
    TimerGame: TTimer;
    procedure spdbtnSettingsClick(Sender: TObject);
    procedure TimerGameTimer(Sender: TObject);
    procedure spdbtnPlayClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbbxLevelChange(Sender: TObject);
  private
    FPairsLeft: integer;
    FVisibleGlyph: TGlyph;
    FTimeStart: TTime;
    procedure OnGlyphClick(Sender: TObject);
    procedure GameStart;
    procedure GameEnd;
    procedure DisplayGameTime(t: TTime);
    procedure AdjustTileSize;
    procedure SetCurrPairsCount(const Value: integer);
    function GetCurrPairsCount: integer;
    property CurrPairsCount: integer
      read GetCurrPairsCount write SetCurrPairsCount;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses uFormSettings, uDMGameOfMem, uGameUtils;

const
  TILE_MARGIN = 2;

procedure TFormMain.AdjustTileSize;
const ADJUST_FACTOR = 0.9;
var tileArea, tileSize: double;
begin
  // adjust the size of every tile in the grid
  tileArea := grdltTiles.Width * grdltTiles.Height / CurrPairsCount / 2;
  tileSize := (sqrt(tileArea) - 2 * TILE_MARGIN) * ADJUST_FACTOR;
  grdltTiles.ItemHeight := tileSize;
  grdltTiles.ItemWidth := tileSize;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  CurrPairsCount := DMGameOfMem.ReadCurrLevel;
end;

procedure TFormMain.cmbbxLevelChange(Sender: TObject);
begin
  DMGameOfMem.SaveCurrLevel(CurrPairsCount);
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  AdjustTileSize;
end;

function TFormMain.GetCurrPairsCount: integer;
begin
  Result := 4 + cmbbxLevel.ItemIndex * 2;
end;

procedure TFormMain.SetCurrPairsCount(const Value: integer);
begin
  cmbbxLevel.ItemIndex := (Value - 4) div 2;
end;

procedure TFormMain.GameStart;
const SHUFFLE_TIMES = 10;
var g: TGlyph; i,j,k, pairsCount, tilesCount, temp: integer;
  indices: array of integer;
begin
  // remove all glyphs from the grid,
  // if there are any left
  grdltTiles.DeleteChildren;

  pairsCount := CurrPairsCount;
  tilesCount := pairsCount * 2;

  FVisibleGlyph := nil;
  FPairsLeft := pairsCount;

  // initialize the list of indices
  SetLength(indices, tilesCount);
  for i := 0 to pairsCount-1 do
  begin
    indices[i] := i;
    indices[i + pairsCount] := i;
  end;

  // randomize indices list
  for j := 0 to SHUFFLE_TIMES - 1 do
    for i := 0 to tilesCount - 1 do
    begin
      k := random(tilesCount);
      temp := indices[k];
      indices[k] := indices[i];
      indices[i] := temp;
    end;

  // add "2" to every index
  // because "0" and "1" are special
  for i := 0 to tilesCount-1 do
    indices[i] := indices[i] + 2;

  for i := 0 to tilesCount-1 do
  begin
    g := TGlyph.Create(grdltTiles);
    g.Parent := grdltTiles;
    g.Images := DMGameOfMem.ImageListMain;
    g.ImageIndex := 1; // hidden tile
    g.Tag := indices[i]; // image index
    g.HitTest := True;
    g.OnClick := OnGlyphClick;
    g.Margins.Top := TILE_MARGIN;
    g.Margins.Left := TILE_MARGIN;
    g.Margins.Bottom := TILE_MARGIN;
    g.Margins.Right := TILE_MARGIN;
  end;

  AdjustTileSize;

  FTimeStart := Now;
  TimerGame.Enabled := True;

  spdbtnPlay.StyleLookup := 'stoptoolbutton';
  cmbbxLevel.Enabled := False;
end;

procedure TFormMain.OnGlyphClick(Sender: TObject);
var g: TGlyph;
begin
  if Sender is TGlyph then
  begin
    g := TGlyph(Sender);

    if g.ImageIndex > 0 then // it is not a "removed" tile
    begin
      // if clicked on currently visible tile, do nothing
      if g <> FVisibleGlyph then
      begin
        g.ImageIndex := g.Tag; // show touched tile

        if FVisibleGlyph <> nil then // there is one other visible tile
        begin
          // there is match, remove both tiles
          if g.Tag = FVisibleGlyph.Tag then
          begin
            g.ImageIndex := 0;
            FVisibleGlyph.ImageIndex := 0;
            FVisibleGlyph := nil;

            dec(FPairsLeft);
            if FPairsLeft = 0 then
              GameEnd;
          end
          else // there is no match, hide previously visible tile
          begin
            FVisibleGlyph.ImageIndex := 1;
            FVisibleGlyph := g;
          end;

        end
        else
          FVisibleGlyph := g; // there is no other visible tile, make this current

      end;
    end;
  end;
end;

procedure TFormMain.GameEnd;
const EL = #13;
var gameTime, bestTime: TTime; s: string;
begin
  TimerGame.Enabled := False;
  gameTime := Now - FTimeStart;
  DisplayGameTime(gameTime);
  spdbtnPlay.StyleLookup := 'playtoolbutton';
  cmbbxLevel.Enabled := True;

  if FPairsLeft = 0 then // game was completed
  begin
    bestTime := DMGameOfMem.ReadScore(CurrPairsCount);
    if (bestTime > 0) and (gameTime > bestTime) then
      s := 'GAME FINISHED!' + EL + 'Your time: ' + GameTimeToStr(gameTime)
    else
    begin
      s := 'YOU WON! BEST TIME!' + EL + 'New best time: ' + GameTimeToStr(gameTime);
      DMGameOfMem.SaveScore(gameTime, CurrPairsCount);
    end;
    ShowMessage(s);
  end;
end;

procedure TFormMain.spdbtnPlayClick(Sender: TObject);
begin
  if not TimerGame.Enabled then
    GameStart
  else
    GameEnd;
end;

procedure TFormMain.spdbtnSettingsClick(Sender: TObject);
begin
  if FormSettings = nil then
    FormSettings := TFormSettings.Create(Application);

  FormSettings.ReadTopScores;
  FormSettings.Show;
end;

procedure TFormMain.TimerGameTimer(Sender: TObject);
var delta: TTime;
begin
  delta := Now - FTimeStart;
  DisplayGameTime(delta);
end;

procedure TFormMain.DisplayGameTime(t: TTime);
var s: string;
begin
  s := GameTimeToStr(t);
  lblScore.Text := s;
end;

end.
