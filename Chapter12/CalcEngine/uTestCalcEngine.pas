unit uTestCalcEngine;

interface

uses
  DUnitX.TestFramework,
  uCalcEngine;

type
  [TestFixture]
  TTestCalcEngine = class(TObject)
  private
    FCalcEngine: TCalcEngine;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestAddSimple;

    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure TestAddParams(const a, b: integer);
  end;

implementation

procedure TTestCalcEngine.Setup;
begin
  FCalcEngine := TCalcEngine.Create;
end;

procedure TTestCalcEngine.TearDown;
begin
  FCalcEngine.Free;
end;

procedure TTestCalcEngine.TestAddSimple;
begin
  Assert.AreEqual(4, FCalcEngine.Add(2, 2));
end;

procedure TTestCalcEngine.TestAddParams(const a, b: integer);
begin
  Assert.AreEqual(a + b, FCalcEngine.Add(a, b));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalcEngine);
end.
