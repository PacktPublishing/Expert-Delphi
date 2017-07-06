unit uFormSunRotate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects;

type
  TFormSunRotate = class(TForm)
    rectSky: TRectangle;
    circleSun: TCircle;
    LineRay01: TLine;
    LineRay02: TLine;
    LineRay03: TLine;
    LineRay04: TLine;
    LineRay05: TLine;
    LineRay06: TLine;
    LineRay07: TLine;
    LineRay08: TLine;
    LineRay09: TLine;
    LineRay10: TLine;
    LineRay11: TLine;
    LineRay12: TLine;
    FloatAnimation1: TFloatAnimation;
    GlowEffect1: TGlowEffect;
    procedure FormCreate(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
  private
    FReady: boolean;
    FDown: TPointF;
    FMoving: boolean;
    FLastAngle: double;
  public
    { Public declarations }
  end;

var
  FormSunRotate: TFormSunRotate;

implementation

{$R *.fmx}

procedure TFormSunRotate.FormCreate(Sender: TObject);
begin
  FMoving := False;
  FReady := False;
  FloatAnimation1.StartValue := rectSky.Height + 150;
end;

procedure TFormSunRotate.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiRotate then
  begin
    if (TInteractiveGestureFlag.gfBegin in EventInfo.Flags) then
      FLastAngle := circleSun.RotationAngle
    else if EventInfo.Angle <> 0 then
      circleSun.RotationAngle := FLastAngle - (EventInfo.Angle * 180) / Pi;
  end
end;

procedure TFormSunRotate.FloatAnimation1Finish(Sender: TObject);
begin
  FReady := True;
end;

procedure TFormSunRotate.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FReady then
  begin
    FDown := PointF(X, Y);
    FMoving := True;
  end;
end;

procedure TFormSunRotate.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if FMoving then
  begin
    circleSun.Position.X := circleSun.Position.X + (X - FDown.X);
    circleSun.Position.Y := circleSun.Position.Y + (Y - FDown.Y);
    FMoving := False;
  end;
end;

end.
