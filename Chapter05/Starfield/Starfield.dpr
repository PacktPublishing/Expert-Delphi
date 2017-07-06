program Starfield;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStars in 'uFormStars.pas' {FormStars};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStars, FormStars);
  Application.Run;
end.
