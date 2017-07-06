program HRMGetIt;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormHRMGetIt in 'uFormHRMGetIt.pas' {FormHTMGetIt};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHTMGetIt, FormHTMGetIt);
  Application.Run;
end.
