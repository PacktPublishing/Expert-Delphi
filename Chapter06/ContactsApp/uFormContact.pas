unit uFormContact;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, uFrameAddress, FMX.Edit;

type
  TFormContact = class(TForm)
    FrameAddressHome: TFrameAddress;
    FrameAddressOffice: TFrameAddress;
    ToolBar1: TToolBar;
    lblContact: TLabel;
    edtFirstname: TEdit;
    lblFirstname: TLabel;
    Edit1: TEdit;
    lblLastname: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContact: TFormContact;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.LgXhdpiTb.fmx ANDROID}

end.
