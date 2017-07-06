unit uFavorite;

interface

uses
  System.Generics.Collections;

type
  TFavorite = class
    URL: string;
    Caption: string;
    constructor Create; overload;
    constructor Create(AURL, ACaption: string); overload;
  end;

  TFavorites = class(TObjectList<TFavorite>);

implementation

uses
  System.Classes, System.SysUtils;

{ TFavorite }

constructor TFavorite.Create;
begin
end;

constructor TFavorite.Create(AURL, ACaption: string);
begin
  URL := AURL;
  Caption := ACaption;
end;

end.
