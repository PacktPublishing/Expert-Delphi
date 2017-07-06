unit uFormToDo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uToDoTypes;

type
  TFormToDo = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormToDo: TFormToDo;

implementation

{$R *.fmx}

uses uDMToDo;

end.
