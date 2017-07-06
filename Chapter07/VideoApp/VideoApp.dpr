program VideoApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormVideo in 'uFormVideo.pas' {FormVideo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormVideo, FormVideo);
  Application.Run;
end.
