unit uDMToDo;

interface

uses
  System.SysUtils, System.Classes, uToDoTypes;

type
  TDMToDo = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMToDo: TDMToDo;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
