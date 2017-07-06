unit uDocAttribute;

interface

type
  DocAttribute = class(TCustomAttribute)
  private
    FURL: string;
  public
    constructor Create(URL: string);
    property URL: string read FURL write FURL;
  end;

implementation

{ DocAttribute }

constructor DocAttribute.Create(URL: string);
begin
  FURL := URL;
end;

end.
