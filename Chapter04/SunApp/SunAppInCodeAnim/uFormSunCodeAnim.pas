unit uFormSunCodeAnim;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TFormSunCodeAnim = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSunPosY: double;
  public
    { Public declarations }
  end;

var
  FormSunCodeAnim: TFormSunCodeAnim;

implementation

{$R *.fmx}

uses uFmxCanvasHelper;

const
  END_SUN_POS_Y = 150;

procedure TFormSunCodeAnim.FormCreate(Sender: TObject);
begin
  FSunPosY := self.Height + 150;
end;

procedure TFormSunCodeAnim.Timer1Timer(Sender: TObject);
begin
  if FSunPosY > END_SUN_POS_Y then
    FSunPosY := FSunPosY - 10;

  Invalidate;
end;

procedure TFormSunCodeAnim.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
const
  DEFAULT_OPACITY = 1; POS_X = 150; // POS_Y = 150;
  SUN_RADIUS = 50; RAY_COUNT = 12; RAY_LENGTH = 100;
var
  x, y, angle: double; i: integer; a, b: TPointF;
begin
  Canvas.BeginScene;
  try
    // draw blue sky
    Canvas.SolidRect(PaintBox1.BoundsRect, TAlphaColorRec.Skyblue);

    x := POS_X;
    y := FSunPosY;

    // draw yellow sun solid circle
    Canvas.SolidCircle(PointF(x, y),
      SUN_RADIUS, TAlphaColorRec.Yellow);

    // draw sun rays
    for i := 0 to RAY_COUNT-1 do
    begin
      angle := i * pi * 2 / RAY_COUNT;
      a := PointF(x, y);
      b := PointF(
        x + RAY_LENGTH * cos(angle),
        y + RAY_LENGTH * sin(angle));
      Canvas.Line(a, b, TAlphaColorRec.Yellow, 5);
    end;

  finally
    Canvas.EndScene;
  end;
end;

end.
