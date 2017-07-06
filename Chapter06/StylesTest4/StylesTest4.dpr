program StylesTest4;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStylesTest4 in 'uFormStylesTest4.pas' {FormStylesTest4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormStylesTest4, FormStylesTest4);
  Application.Run;
end.
