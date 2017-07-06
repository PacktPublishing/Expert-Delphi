unit uFormCubeWithComp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics, 
  FMX.Dialogs, System.Math.Vectors, FMX.Controls3D, FMX.Objects3D;

type
  TFormCubeWithComp = class(TForm3D)
    StrokeCube1: TStrokeCube;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCubeWithComp: TFormCubeWithComp;

implementation

{$R *.fmx}

end.
