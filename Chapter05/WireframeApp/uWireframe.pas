unit uWireframe;

interface

uses
  System.Math.Vectors, // TPoin3D
  System.Generics.Collections, // TList<T>
  FMX.Controls3D, // TControl3D
  System.UITypes, // TAlphaColor
  System.Classes, // TComponent
  FMX.Types3D; // TContext3D

type
  TPoints3D = class(TList<TPoint3D>);

  TEdge = record
    A, B: integer;
  end;

  TEdges = class(TList<TEdge>)
    procedure AddEdge(pStart, pEnd: integer);
  end;

  TWireframe = class(TControl3D)
  private
    FDrawColor: TAlphaColor;
    FEdges: TEdges;
    FPoints3D: TPoints3D;
    FDisplayed: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Render; override;
    property DrawColor: TAlphaColor read FDrawColor write FDrawColor;
    property Points3D: TPoints3D read FPoints3D;
    property Edges: TEdges read FEdges;
    property Displayed: boolean read FDisplayed write FDisplayed;
  end;

implementation

constructor TWireframe.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPoints3D := TPoints3D.Create;
  FEdges := TEdges.Create;
  FDrawColor := TAlphaColorRec.Red;
  FDisplayed := True;
end;

destructor TWireframe.Destroy;
begin
  FEdges.Free;
  FPoints3D.Free;
  inherited;
end;

procedure TWireframe.Render;
var edge: TEdge;
begin
  if Displayed then
    for edge in Edges do
      Context.DrawLine(Points3D[edge.A], Points3D[edge.B], 1, DrawColor);
end;

{ TEdges }

procedure TEdges.AddEdge(pStart, pEnd: integer);
var edge: TEdge;
begin
  edge.A := pStart;
  edge.B := pEnd;
  self.Add(edge);

end;

end.
