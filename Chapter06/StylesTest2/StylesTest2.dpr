program StylesTest2;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormStylesTest2 in 'uFormStylesTest2.pas' {FormStylesTest2},
  uDMStyles in 'uDMStyles.pas' {DMStyles: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TFormStylesTest2, FormStylesTest2);
  Application.Run;
end.
