unit uFormMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Maps,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Sensors,
  System.Sensors.Components, FMX.ListBox;

type
  TFormMap = class(TForm)
    ToolBar1: TToolBar;
    MapView1: TMapView;
    LocationSensor1: TLocationSensor;
    cmbbxMapType: TComboBox;
    procedure cmbbxMapTypeChange(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure LocationSensor1HeadingChanged(Sender: TObject;
      const AHeading: THeading);
  private
    FMe: TMapMarker;
  public
    { Public declarations }
  end;

var
  FormMap: TFormMap;

implementation

{$R *.fmx}

procedure TFormMap.cmbbxMapTypeChange(Sender: TObject);
begin
  MapView1.MapType := TMapType(cmbbxMapType.ItemIndex);
end;

procedure TFormMap.LocationSensor1HeadingChanged(Sender: TObject;
  const AHeading: THeading);
begin
  MapView1.Bearing := AHeading.Azimuth;
end;

procedure TFormMap.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var mc: TMapCoordinate; mmd: TMapMarkerDescriptor;
begin
  mc.Latitude := NewLocation.Latitude;
  mc.Longitude := NewLocation.Longitude;
  MapView1.Location := mc;

  if FMe <> nil then
    FMe.Remove;

  mmd := TMapMarkerDescriptor.Create(mc, 'Me');
  FMe := MapView1.AddMarker(mmd)
end;

end.
