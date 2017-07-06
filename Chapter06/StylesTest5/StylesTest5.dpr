program StylesTest5;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStylesTest5 in 'uFormStylesTest5.pas' {FormStylesTest5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStylesTest5, FormStylesTest5);
  Application.Run;
end.
