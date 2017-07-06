program ToDoListRESTClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  uToDoTypes in 'uToDoTypes.pas',
  uToDoUtils in 'uToDoUtils.pas',
  uFormToDoRESTClient in 'uFormToDoRESTClient.pas' {FormToDoRESTClient},
  uDMToDoWebBrokREST in 'uDMToDoWebBrokREST.pas' {DMToDoWebBrokREST: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormToDoRESTClient, FormToDoRESTClient);
  Application.CreateForm(TDMToDoWebBrokREST, DMToDoWebBrokREST);
  Application.Run;
end.
