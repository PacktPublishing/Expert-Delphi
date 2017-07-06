unit uFormPhotoTake;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.StdCtrls, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, FMX.Controls.Presentation, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile;

type
  TFormPhotoTake = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ImagePhoto: TImage;
    spdbtnSendPhoto: TSpeedButton;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    actSendPhoto: TAction;
    spdbtnTakePhoto: TSpeedButton;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure actSendPhotoExecute(Sender: TObject);
    procedure TetheringManager1EndManagersDiscovery(const Sender: TObject;
      const ARemoteManagers: TTetheringManagerInfoList);
    procedure TetheringManager1EndProfilesDiscovery(const Sender: TObject;
      const ARemoteProfiles: TTetheringProfileInfoList);
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPhotoTake: TFormPhotoTake;

implementation

{$R *.fmx}

procedure TFormPhotoTake.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  ImagePhoto.Bitmap.Assign(Image);
end;

procedure TFormPhotoTake.actSendPhotoExecute(Sender: TObject);
begin
  if not ImagePhoto.Bitmap.IsEmpty then
    TetheringManager1.DiscoverManagers(1000)
  else
    ShowMessage('Take a photo before sending');
end;

procedure TFormPhotoTake.TetheringManager1EndManagersDiscovery(const Sender: TObject;
  const ARemoteManagers: TTetheringManagerInfoList);
begin
  if aRemoteManagers.Count > 0 then
    TetheringManager1.PairManager(ARemoteManagers[0])
  else
    ShowMessage('Cannot find any photo receiver app.');
end;

procedure TFormPhotoTake.TetheringManager1EndProfilesDiscovery(const Sender: TObject;
  const ARemoteProfiles: TTetheringProfileInfoList);
var
  memstr: TMemoryStream;
begin
  if ARemoteProfiles.Count > 0 then
  begin
    if not TetheringAppProfile1.Connect(ARemoteProfiles[0]) then
      ShowMessage('Failed to connect to remote profile.')
    else
    begin
      memstr := TMemoryStream.Create;
      try
        ImagePhoto.Bitmap.SaveToStream(memstr);
        if TetheringAppProfile1.SendStream(ARemoteProfiles[0], 'Photo', memstr) then
          ShowMessage('Image sent')
        else
          ShowMessage('Failed to send image');
      finally
        memstr.Free;
      end;
    end;
  end
  else
    ShowMessage('Cannot find any remote profiles to connect to.');
end;

procedure TFormPhotoTake.TetheringManager1RequestManagerPassword(const Sender: TObject;
  const ARemoteIdentifier: string; var Password: string);
begin
  Password := TetheringManager1.Password;
end;

end.
