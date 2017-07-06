unit uFormCalc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, System.Bluetooth,
  System.Bluetooth.Components;

type
  TFormCalc = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.fmx}

uses uCalcEngine;

procedure TFormCalc.Button1Click(Sender: TObject);
var a, b, c: integer; ce: TCalcEngine;
begin
  ce := TCalcEngine.Create;
  try
    a := Edit1.Text.ToInteger;
    b := Edit2.Text.ToInteger;
    c := ce.Add(a, b);
    Label1.Text := '= ' + c.ToString;
  finally
    ce.Free;
  end;
end;

end.
