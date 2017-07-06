program Contacts;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormContact in 'uFormContact.pas' {FormContact},
  uFrameAddress in 'uFrameAddress.pas' {FrameAddress: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormContact, FormContact);
  Application.Run;
end.
