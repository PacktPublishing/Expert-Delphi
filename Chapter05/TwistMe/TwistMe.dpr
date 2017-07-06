program TwistMe;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormTwistMe in 'uFormTwistMe.pas' {FormTwistMe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTwistMe, FormTwistMe);
  Application.Run;
end.
