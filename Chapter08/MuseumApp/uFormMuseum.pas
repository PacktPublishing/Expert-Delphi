unit uFormMuseum;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon,
  System.Bluetooth, System.Beacon.Components, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.WebBrowser;

type
  TFormMuseum = class(TForm)
    Beacon1: TBeacon;
    ToolBar1: TToolBar;
    chkbxActive: TCheckBox;
    lblInfo: TLabel;
    WebBrowser1: TWebBrowser;
    procedure chkbxActiveChange(Sender: TObject);
    procedure Beacon1BeaconProximity(const Sender: TObject;
      const ABeacon: IBeacon; Proximity: TBeaconProximity);
  private
    FShowingStarted: TTime;
    FCurrentURL: string;
    procedure ShowInfo(aName, aURL: string);
    procedure HideInfo;
  public
    { Public declarations }
  end;

var
  FormMuseum: TFormMuseum;

implementation

{$R *.fmx}

uses
  uBeaconInfo, System.DateUtils;

const
  MIN_SHOWING_TIME = 10; // seconds

procedure TFormMuseum.Beacon1BeaconProximity(const Sender: TObject;
  const ABeacon: IBeacon; Proximity: TBeaconProximity);
var aName, aURL: string;
begin
  if Proximity in [Immediate, Near] then
  begin
    if GetBeaconInfo(aBeacon.GUID, aBeacon.Major, aBeacon.Minor, aName, aURL) then
      ShowInfo(aName, aURL)
    else
      HideInfo;
  end;
end;

procedure TFormMuseum.chkbxActiveChange(Sender: TObject);
begin
  Beacon1.Enabled := chkbxActive.IsChecked;
  if not chkbxActive.IsChecked then
    HideInfo;
end;

procedure TFormMuseum.HideInfo;
begin
  FCurrentURL := '';
  lblInfo.Text := '';
  WebBrowser1.Visible := False;
end;

procedure TFormMuseum.ShowInfo(aName, aURL: string);
begin
  // show current information for at least "MIN_SHOWING_TIME"
  if (FCurrentURL <> '') and
    (SecondSpan(Now, FShowingStarted) < MIN_SHOWING_TIME) then
    exit;

  if (FCurrentURL = '') or (FCurrentURL <> aURL) then
  begin
    lblInfo.Text := aName;
    WebBrowser1.Navigate(aURL);
    FShowingStarted := Now;
    WebBrowser1.Visible := True;
  end
end;

end.
