program ParallelDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uForm1 in 'uForm1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
