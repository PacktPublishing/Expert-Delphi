program ToDoTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormToDoTest in 'uFormToDoTest.pas' {FormToDoTest};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormToDoTest, FormToDoTest);
  Application.Run;
end.
