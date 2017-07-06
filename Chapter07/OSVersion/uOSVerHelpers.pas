unit uOSVerHelpers;

interface

uses
  System.SysUtils;

type
  TOSArchitectureHelper = record helper for TOSVersion.TArchitecture
    function ToString: string;
  end;

  TOSPlatformHelper = record helper for TOSVersion.TPlatform
    function ToString: string;
  end;

function OSArchToStr(const Value: TOSVersion.TArchitecture): string;
function OSPlatToStr(const Value: TOSVersion.TPlatform): string;

implementation

function OSArchToStr(const Value: TOSVersion.TArchitecture): string;
begin
  case Value of
    arIntelX86: Result := 'IntelX86';
    arIntelX64: Result := 'IntelX64';
    arARM32: Result := 'ARM32';
    arARM64: Result := 'ARM64';
    else Result := 'Unknown OS Architecture';
  end;
end;

{ TOSArchitectureHelper }

function TOSArchitectureHelper.ToString: string;
begin
  Result := OSArchToStr(self);
end;

function OSPlatToStr(const Value: TOSVersion.TPlatform): string;
begin
  case Value of
    pfWindows: Result := 'Windows';
    pfMacOS: Result := 'MacOS';
    pfiOS: Result := 'iOS';
    pfAndroid: Result := 'Android';
    pfWinRT: Result := 'WinRT';
    pfLinux: Result := 'Linux';
    else Result := 'Unknown OS Platform'
  end;
end;

{ TOSPlatformHelper }

function TOSPlatformHelper.ToString: string;
begin
  Result := OSPlatToStr(self);
end;

end.
