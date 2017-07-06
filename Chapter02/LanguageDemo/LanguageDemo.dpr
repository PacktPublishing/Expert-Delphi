program LanguageDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFormDemo in 'uFormDemo.pas' {FormDemo},
  uSchool in 'uSchool.pas',
  uArrays in 'uArrays.pas',
  uChess in 'uChess.pas',
  uPerson in 'uPerson.pas',
  uFillables in 'uFillables.pas',
  uGenerics in 'uGenerics.pas',
  uPersonTList in 'uPersonTList.pas',
  uPersonGenerics in 'uPersonGenerics.pas',
  uAnonymous in 'uAnonymous.pas',
  uPersonList in 'uPersonList.pas',
  uVectors in 'uVectors.pas',
  uDocAttribute in 'uDocAttribute.pas',
  uMySuperClass in 'uMySuperClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDemo, FormDemo);
  Application.Run;
end.
