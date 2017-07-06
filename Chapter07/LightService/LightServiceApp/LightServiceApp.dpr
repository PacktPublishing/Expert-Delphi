program LightServiceApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormLightLevel in 'uFormLightLevel.pas' {FormLightLevel},
  uDMLightSensor in '..\LightService\uDMLightSensor.pas' {DMLightSensor: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLightLevel, FormLightLevel);
  Application.Run;
end.
