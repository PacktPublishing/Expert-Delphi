unit uFormDSClient;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormDSClient = class(TForm)
    btnReverse: TButton;
    edtTest: TEdit;
    procedure btnReverseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDSClient: TFormDSClient;

implementation

{$R *.fmx}

uses ClientModuleUnit1;

procedure TFormDSClient.btnReverseClick(Sender: TObject);
begin
  edtTest.Text :=
    ClientModule1.ServerMethods3Client.ReverseString(edtTest.Text);
end;

end.
