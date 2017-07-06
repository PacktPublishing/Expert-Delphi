unit uPersonGenerics;

interface

procedure DoPersonsGenerics;

implementation

uses
  uPerson,
  System.Generics.Collections, // TObjectList<T>
  uFormDemo;

procedure DoPersonsGenerics;
var
  persons: TObjectList<TPerson>; p: TPerson;
begin
  persons := TObjectList<TPerson>.Create;
  try
    // safe, can only add TPerson or descendant
    persons.Add(TPerson.Create('Kirk', 'Hammett'));
    persons.Add(TPerson.Create('James', 'Hetfield'));
    persons.Add(TPerson.Create('Lars', 'Ulrich'));
    persons.Add(TPerson.Create('Robert', 'Trujillo'));

    for p in persons  do
      Log(p.Fullname); // no typecast needed

  finally
    persons.Free;
  end;
end;


end.
