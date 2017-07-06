unit uDMLightSensor;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Sensors.Components,
  System.Android.Service,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os, System.Notification, FMX.Types;

type
  TDMLightSensor = class(TAndroidService)
    NotificationCenter1: TNotificationCenter;
    Timer1: TTimer;
    procedure AndroidServiceCreate(Sender: TObject);
    procedure AndroidServiceDestroy(Sender: TObject);
    function AndroidServiceStartCommand(const Sender: TObject;
      const Intent: JIntent; Flags, StartId: Integer): Integer;
    procedure Timer1Timer(Sender: TObject);
  private
    FLightSensor: TLightSensor;
  public
    { Public declarations }
  end;

var
  DMLightSensor: TDMLightSensor;

implementation

uses
  Androidapi.JNI.App, System.Math;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMLightSensor.AndroidServiceCreate(Sender: TObject);
begin
  FLightSensor := TLightSensor.Create(self);
end;

procedure TDMLightSensor.AndroidServiceDestroy(Sender: TObject);
begin
  FLightSensor.Free;
end;

function TDMLightSensor.AndroidServiceStartCommand(const Sender: TObject;
  const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  FLightSensor.Active := True;
  Timer1.Enabled := True;
  Result := TJService.JavaClass.START_STICKY;
end;

procedure TDMLightSensor.Timer1Timer(Sender: TObject);
var v: double; s: string; n: TNotification;
begin
  v := FLightSensor.Sensor.Lux;

  if not IsNan(v) then
    s := Format('%3.5f',[v])
  else
    s := 'NaN';

  n := NotificationCenter1.CreateNotification;
  try
    n.Name := 'LightSensorNotification';
    n.AlertBody := s;
    NotificationCenter1.PresentNotification(n);
  finally
    n.Free;
  end;
end;

end.
