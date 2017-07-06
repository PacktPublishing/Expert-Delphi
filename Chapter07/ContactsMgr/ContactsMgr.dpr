program ContactsMgr;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormContacts in 'uFormContacts.pas' {FormContacts};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormContacts, FormContacts);
  Application.Run;
end.
