program StylesTest3;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Styles,
  FMX.Forms,
  uFormStylesTest3 in 'uFormStylesTest3.pas' {FormStylesTest3},
  uFormExtra in 'uFormExtra.pas' {FormExtra};

{$R *.res}

begin
  TStyleManager.TrySetStyleFromResource('TransparentStyle');
  Application.Initialize;
  Application.CreateForm(TFormStylesTest3, FormStylesTest3);
  Application.CreateForm(TFormExtra, FormExtra);
  Application.Run;
end.
