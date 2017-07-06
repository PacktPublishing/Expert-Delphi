
{**********************************************}
{                                              }
{               XML Data Binding               }
{                                              }
{         Generated on: 1/15/2017 7:39:59 PM   }
{       Generated from: C:\demos\favs.xml      }
{   Settings stored in: C:\demos\favs.xdb      }
{                                              }
{**********************************************}

unit favs;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLFavoritesType = interface;
  IXMLFavoriteType = interface;

{ IXMLFavoritesType }

  IXMLFavoritesType = interface(IXMLNodeCollection)
    ['{C1FB3F06-F891-443D-A5ED-4F06CF646013}']
    { Property Accessors }
    function Get_Favorite(Index: Integer): IXMLFavoriteType;
    { Methods & Properties }
    function Add: IXMLFavoriteType;
    function Insert(const Index: Integer): IXMLFavoriteType;
    property Favorite[Index: Integer]: IXMLFavoriteType read Get_Favorite; default;
  end;

{ IXMLFavoriteType }

  IXMLFavoriteType = interface(IXMLNode)
    ['{9EC2748A-6970-4B9C-89FB-A4B4E984892D}']
    { Property Accessors }
    function Get_URL: UnicodeString;
    function Get_Caption: UnicodeString;
    procedure Set_URL(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
    { Methods & Properties }
    property URL: UnicodeString read Get_URL write Set_URL;
    property Caption: UnicodeString read Get_Caption write Set_Caption;
  end;

{ Forward Decls }

  TXMLFavoritesType = class;
  TXMLFavoriteType = class;

{ TXMLFavoritesType }

  TXMLFavoritesType = class(TXMLNodeCollection, IXMLFavoritesType)
  protected
    { IXMLFavoritesType }
    function Get_Favorite(Index: Integer): IXMLFavoriteType;
    function Add: IXMLFavoriteType;
    function Insert(const Index: Integer): IXMLFavoriteType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFavoriteType }

  TXMLFavoriteType = class(TXMLNode, IXMLFavoriteType)
  protected
    { IXMLFavoriteType }
    function Get_URL: UnicodeString;
    function Get_Caption: UnicodeString;
    procedure Set_URL(Value: UnicodeString);
    procedure Set_Caption(Value: UnicodeString);
  end;

{ Global Functions }

function GetFavorites(Doc: IXMLDocument): IXMLFavoritesType;
function LoadFavorites(const FileName: string): IXMLFavoritesType;
function NewFavorites: IXMLFavoritesType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetFavorites(Doc: IXMLDocument): IXMLFavoritesType;
begin
  Result := Doc.GetDocBinding('Favorites', TXMLFavoritesType, TargetNamespace) as IXMLFavoritesType;
end;

function LoadFavorites(const FileName: string): IXMLFavoritesType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Favorites', TXMLFavoritesType, TargetNamespace) as IXMLFavoritesType;
end;

function NewFavorites: IXMLFavoritesType;
begin
  Result := NewXMLDocument.GetDocBinding('Favorites', TXMLFavoritesType, TargetNamespace) as IXMLFavoritesType;
end;

{ TXMLFavoritesType }

procedure TXMLFavoritesType.AfterConstruction;
begin
  RegisterChildNode('Favorite', TXMLFavoriteType);
  ItemTag := 'Favorite';
  ItemInterface := IXMLFavoriteType;
  inherited;
end;

function TXMLFavoritesType.Get_Favorite(Index: Integer): IXMLFavoriteType;
begin
  Result := List[Index] as IXMLFavoriteType;
end;

function TXMLFavoritesType.Add: IXMLFavoriteType;
begin
  Result := AddItem(-1) as IXMLFavoriteType;
end;

function TXMLFavoritesType.Insert(const Index: Integer): IXMLFavoriteType;
begin
  Result := AddItem(Index) as IXMLFavoriteType;
end;

{ TXMLFavoriteType }

function TXMLFavoriteType.Get_URL: UnicodeString;
begin
  Result := ChildNodes['URL'].Text;
end;

procedure TXMLFavoriteType.Set_URL(Value: UnicodeString);
begin
  ChildNodes['URL'].NodeValue := Value;
end;

function TXMLFavoriteType.Get_Caption: UnicodeString;
begin
  Result := ChildNodes['Caption'].Text;
end;

procedure TXMLFavoriteType.Set_Caption(Value: UnicodeString);
begin
  ChildNodes['Caption'].NodeValue := Value;
end;

end.