program AppLifecycle;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormLifecycle in 'uFormLifecycle.pas' {FormLifecycle};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLifecycle, FormLifecycle);
  Application.Run;
end.
