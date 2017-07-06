unit uFmxCanvasHelper;

interface

uses
  System.Types,
  System.UITypes,
  FMX.Graphics;

type
  TFmxCanvasHelper = class helper for TCanvas
    procedure Line(A, B: TPointF; aColor: TColor; aThickness: Single = 1);
    procedure SolidRect(aRect: TRectF; aColor: TColor = TAlphaColorRec.White);
    procedure SolidCircle(A: TPointF; R: Double; aColor: TColor);
  end;

implementation

const
  DEFAULT_OPACITY: Double = 1;

{ TFmxCanvasHelper }

procedure TFmxCanvasHelper.SolidRect(aRect: TRectF; aColor: TColor);
begin
  self.Fill.Color := aColor;
  self.FillRect(aRect, 0, 0, [], DEFAULT_OPACITY);
end;

procedure TFmxCanvasHelper.Line(A, B: TPointF; aColor: TColor;
  aThickness: Single);
begin
  self.Stroke.Color := aColor;
  self.Stroke.Kind := TBrushKind.Solid;
  
  self.Stroke.Thickness := aThickness;
  
  self.DrawLine(A, B, DEFAULT_OPACITY);

end;

procedure TFmxCanvasHelper.SolidCircle(A: TPointF; R: Double;
  aColor: TColor);
var aRect: TRectF;
begin
  aRect := RectF(A.X-R, A.Y-R, A.X+R, A.Y+R);
  self.Fill.Color := aColor;
  self.Fill.Kind := TBrushKind.Solid;
  self.FillEllipse(aRect, DEFAULT_OPACITY);
end;

end.
