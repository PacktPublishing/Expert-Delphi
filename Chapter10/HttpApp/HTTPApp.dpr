program HTTPApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormHTTP in 'uFormHTTP.pas' {FormHTTP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHTTP, FormHTTP);
  Application.Run;
end.
