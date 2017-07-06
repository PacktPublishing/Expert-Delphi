program WhoIsApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormWhoIs in 'uFormWhoIs.pas' {FormWhoIs},
  whois in 'whois.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormWhoIs, FormWhoIs);
  Application.Run;
end.
