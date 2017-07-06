program DelphiHelloWorld;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormHelloWorld in 'uFormHelloWorld.pas' {FormHelloWorld};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHelloWorld, FormHelloWorld);
  Application.Run;
end.
