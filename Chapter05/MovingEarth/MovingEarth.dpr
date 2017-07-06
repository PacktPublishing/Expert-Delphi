program MovingEarth;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormEarth in 'uFormEarth.pas' {FormEarth};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormEarth, FormEarth);
  Application.Run;
end.
