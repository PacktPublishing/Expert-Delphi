unit uVectors;

interface

implementation

uses
  System.Math.Vectors;

procedure DoSomeVectorMath;
var
  A, B, C: TVector3D;
begin
  A := TVector3D.Create(1,2,4);
  B := TVector3D.Create(2,3,1);
  C := A + B;
  // ...
end;

end.
