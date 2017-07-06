program NotifyMe;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormNotify in 'uFormNotify.pas' {FormNotify};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormNotify, FormNotify);
  Application.Run;
end.
