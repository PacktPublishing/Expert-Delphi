unit uMySuperClass;

interface

uses uDocAttribute;

type
  [Doc('http://mydocs/MySuperClass')] // skipping "...Attribute"
  TMySuperClass = class
  public
    [DocAttribute('http://mydocs/MySuperClass/DoSomething')]
    procedure DoSomething;
  end;

implementation

{ TMySuperClass }

procedure TMySuperClass.DoSomething;
begin
//
end;

end.
