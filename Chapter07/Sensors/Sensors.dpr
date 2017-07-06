program Sensors;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormSensors in 'uFormSensors.pas' {FormSensors};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSensors, FormSensors);
  Application.Run;
end.
