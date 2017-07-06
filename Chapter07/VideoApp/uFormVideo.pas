unit uFormVideo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, FMX.Objects;

type
  TFormVideo = class(TForm)
    ToolBar1: TToolBar;
    chkbxTorch: TCheckBox;
    CameraComponent1: TCameraComponent;
    imgVideo: TImage;
    chkbxCamera: TCheckBox;
    lblTitle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure chkbxTorchChange(Sender: TObject);
    procedure chkbxCameraChange(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVideo: TFormVideo;

implementation

{$R *.fmx}

procedure TFormVideo.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  CameraComponent1.SampleBufferToBitmap(imgVideo.Bitmap, True);
end;

procedure TFormVideo.chkbxCameraChange(Sender: TObject);
begin
  CameraComponent1.Active := chkbxCamera.IsChecked;
end;

procedure TFormVideo.chkbxTorchChange(Sender: TObject);
begin
  if chkbxTorch.IsChecked then
    CameraComponent1.TorchMode := TTorchMode.ModeOn
  else
    CameraComponent1.TorchMode := TTorchMode.ModeOff;
end;

procedure TFormVideo.FormCreate(Sender: TObject);
begin
  chkbxTorch.Enabled := CameraComponent1.HasTorch;
end;

end.
