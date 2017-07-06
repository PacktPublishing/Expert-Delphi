unit uFormCam;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TFormCam = class(TForm)
    ToolBar1: TToolBar;
    ImagePhoto: TImage;
    spdbtnTakePhoto: TSpeedButton;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    spdbtnSharePhoto: TSpeedButton;
    ShowShareSheetAction1: TShowShareSheetAction;
    lblTitle: TLabel;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCam: TFormCam;

implementation

{$R *.fmx}

procedure TFormCam.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.Bitmap.Assign(ImagePhoto.Bitmap);
end;

procedure TFormCam.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  ImagePhoto.Bitmap.Assign(Image);
end;

end.
