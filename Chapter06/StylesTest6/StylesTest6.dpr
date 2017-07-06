program StylesTest6;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStylesTest6 in 'uFormStylesTest6.pas' {FormStylesTest6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStylesTest6, FormStylesTest6);
  Application.Run;
end.
