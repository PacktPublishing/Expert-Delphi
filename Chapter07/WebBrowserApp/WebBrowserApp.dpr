program WebBrowserApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormWebBrowser in 'uFormWebBrowser.pas' {FormWebBrowser};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormWebBrowser, FormWebBrowser);
  Application.Run;
end.
