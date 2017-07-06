unit uFormWireframe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms3D, FMX.Types3D, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, uWireframe, System.Math.Vectors;

type
  TFormWireframe = class(TForm3D)
    procedure Form3DCreate(Sender: TObject);
    procedure Form3DDestroy(Sender: TObject);
  private
    FWireframe: TWireframe;
    procedure CreatePyramid;
  public
    { Public declarations }
  end;

var
  FormWireframe: TFormWireframe;

implementation

{$R *.fmx}

procedure TFormWireframe.Form3DCreate(Sender: TObject);
begin
  FWireframe := TWireframe.Create(self);
  FWireframe.Parent := self;
  FWireframe.RotationAngle.Point := Point3D(75, 10, 15);

  CreatePyramid;
end;

procedure TFormWireframe.Form3DDestroy(Sender: TObject);
begin
  FWireframe.Free;
end;

procedure TFormWireframe.CreatePyramid;
begin
  with FWireframe do
  begin
    Points3D.Add(Point3D(-2,-2,0)); // 0
    Points3D.Add(Point3D(2,-2,0));  // 1
    Points3D.Add(Point3D(-2,2,0));  // 2
    Points3D.Add(Point3D(2,2,0));   // 3
    Points3D.Add(Point3D(0,0,6));   // 4

    Edges.AddEdge(0,1);
    Edges.AddEdge(1,3);
    Edges.AddEdge(3,2);
    Edges.AddEdge(2,0);
    Edges.AddEdge(0,4);
    Edges.AddEdge(1,4);
    Edges.AddEdge(2,4);
    Edges.AddEdge(3,4);
  end;
end;

end.
