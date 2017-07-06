unit uFormSensors;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Sensors.Components;

type
  TFormSensors = class(TForm)
    LocationSensor1: TLocationSensor;
    chkbxLocSensor: TCheckBox;
    lblLocation: TLabel;
    lblHeading: TLabel;
    MotionSensor1: TMotionSensor;
    OrientationSensor1: TOrientationSensor;
    chkbxMotion: TCheckBox;
    lblLinearAccel: TLabel;
    lblAngleAccel: TLabel;
    lblTilt: TLabel;
    lblHeadingXYZ: TLabel;
    chkbxOrientation: TCheckBox;
    Timer1: TTimer;
    procedure chkbxLocSensorChange(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure LocationSensor1HeadingChanged(Sender: TObject;
      const AHeading: THeading);
    procedure chkbxMotionChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    function DblToStr(Value: Double): string;
  public
    { Public declarations }
  end;

var
  FormSensors: TFormSensors;

implementation

uses
  System.Math;

{$R *.fmx}

procedure TFormSensors.chkbxLocSensorChange(Sender: TObject);
begin
  LocationSensor1.Active := chkbxLocSensor.IsChecked;
end;

procedure TFormSensors.chkbxMotionChange(Sender: TObject);
begin
  MotionSensor1.Active := chkbxMotion.IsChecked;
end;

function TFormSensors.DblToStr(Value: Double): string;
begin
  if not IsNan(Value) then
    Result := Format('%3.5f',[Value])
  else
    Result := 'NaN';
end;

procedure TFormSensors.LocationSensor1HeadingChanged(Sender: TObject;
  const AHeading: THeading);
begin
  lblHeading.Text := DblToStr(AHeading.Azimuth);
end;

procedure TFormSensors.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  lblLocation.Text := DblToStr(NewLocation.Latitude)
    + ' : ' + DblToStr(NewLocation.Longitude);
end;

procedure TFormSensors.Timer1Timer(Sender: TObject);
begin
  lblLinearAccel.Text := DblToStr(MotionSensor1.Sensor.AccelerationX) + ', '
    + DblToStr(MotionSensor1.Sensor.AccelerationY) + ', '
    + DblToStr(MotionSensor1.Sensor.AccelerationZ);

  lblAngleAccel.Text := DblToStr(MotionSensor1.Sensor.AngleAccelX) + ', '
    + DblToStr(MotionSensor1.Sensor.AngleAccelY) + ', '
    + DblToStr(MotionSensor1.Sensor.AngleAccelZ);

  lblTilt.Text := DblToStr(OrientationSensor1.Sensor.TiltX) + ', '
    + DblToStr(OrientationSensor1.Sensor.TiltY) + ', '
    + DblToStr(OrientationSensor1.Sensor.TiltZ);

  lblHeadingXYZ.Text := DblToStr(OrientationSensor1.Sensor.HeadingX) + ', '
    + DblToStr(OrientationSensor1.Sensor.HeadingY) + ', '
    + DblToStr(OrientationSensor1.Sensor.HeadingZ);
end;

end.
