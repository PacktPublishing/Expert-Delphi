program StylesTest1;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStylesTest1 in 'uFormStylesTest1.pas' {FormStylesTest1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStylesTest1, FormStylesTest1);
  Application.Run;
end.
