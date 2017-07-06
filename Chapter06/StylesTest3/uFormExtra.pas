unit uFormExtra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFormExtra = class(TForm)
    ToolBar1: TToolBar;
    spdbtnBack: TSpeedButton;
    Label1: TLabel;
    procedure spdbtnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExtra: TFormExtra;

implementation

{$R *.fmx}

uses uFormStylesTest3;

procedure TFormExtra.spdbtnBackClick(Sender: TObject);
begin
  FormStylesTest3.Show;
end;

end.
