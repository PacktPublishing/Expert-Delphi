unit uFormTouch;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFormTouch = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure FormCreate(Sender: TObject);
    procedure FormTouch(Sender: TObject; const Touches: TTouches;
      const Action: TTouchAction);
  private
    FBitmap: TBitmap;
  public
    { Public declarations }
  end;

var
  FormTouch: TFormTouch;

implementation

{$R *.fmx}

uses uFmxCanvasHelper;

procedure TFormTouch.FormCreate(Sender: TObject);
begin
  FBitmap := TBitmap.Create;
  FBitmap.SetSize(self.ClientWidth, self.ClientHeight);
  FBitmap.Clear(TAlphaColors.White);
end;

procedure TFormTouch.FormTouch(Sender: TObject; const Touches: TTouches;
  const Action: TTouchAction);
var i, count: integer;
begin
  FBitmap.Canvas.BeginScene;
  try
    FBitmap.Clear(TAlphaColors.White);
    count := Length(Touches);
    if count > 1 then
    for i := 0 to count-2 do
      FBitmap.Canvas.Line(
        Touches[i].Location,
        Touches[i+1].Location,
        TAlphaColorRec.Red);
  finally
    FBitmap.Canvas.EndScene;
  end;
  PaintBox1.Repaint;
end;

procedure TFormTouch.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
var R: TRectF;
begin
  R := TRectF.Create(0, 0, FBitmap.Width, FBitmap.Height);
  PaintBox1.Canvas.DrawBitmap(FBitmap, R, R, 1, True);
end;

end.
