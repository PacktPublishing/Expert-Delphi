program HeartRateApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormHRM in 'uFormHRM.pas' {FormHRM};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHRM, FormHRM);
  Application.Run;
end.
