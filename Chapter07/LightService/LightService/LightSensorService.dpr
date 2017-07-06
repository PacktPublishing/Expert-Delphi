program LightSensorService;

uses
  System.Android.ServiceApplication,
  uDMLightSensor in 'uDMLightSensor.pas' {DMLightSensor: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMLightSensor, DMLightSensor);
  Application.Run;
end.
