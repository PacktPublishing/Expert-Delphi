unit uBeaconInfo;

interface

type
  TBeaconInfo = record
    UUID: TGUID;
    Major: integer;
    Minor: integer;
    Name: string;
    URL: string;
  end;

const
  AUUID = '{74278BDA-B644-4520-8F0C-720EAF059935}';

  BEACON_COUNT = 3;

  BEACONS: array[0..BEACON_COUNT-1] of TBeaconInfo = (
  (UUID: AUUID; Major: 1973; Minor: 1001; Name: 'The Potato Eaters';
    URL: 'https://en.wikipedia.org/wiki/The_Potato_Eaters'),
  (UUID: AUUID; Major: 1973; Minor: 1002; Name: 'Bedroom in Arles';
    URL: 'https://en.wikipedia.org/wiki/Bedroom_in_Arles'),
  (UUID: AUUID; Major: 1973; Minor: 1003; Name: 'Almond Blossoms';
    URL: 'https://en.wikipedia.org/wiki/Almond_Blossoms')
  );

function GetBeaconInfo(aUUID: TGUID; aMajor, aMinor: integer;
  out aName: string; out aURL: string): boolean;

implementation

function GetBeaconInfo(aUUID: TGUID; aMajor, aMinor: integer;
  out aName: string; out aURL: string): boolean;
var i, index: integer;
begin
  index := -1;
  for i := 0 to BEACON_COUNT-1 do
  if (BEACONS[i].UUID = aUUID) and (BEACONS[i].Major = aMajor)
    and (BEACONS[i].Minor = aMinor) then
  begin
    index := i;
    break;
  end;

  Result := index > -1;
  if Result then
  begin
    aName := BEACONS[i].Name;
    aURL := BEACONS[i].URL;
  end;
end;

end.
