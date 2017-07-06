unit uPersonTList;

interface

procedure DoPersonsTList;

implementation

uses
  uPerson,
  System.Classes, // TList
  uFormDemo;

procedure DoPersonsTList;
var
  persons: TList; p: TPerson; i: integer;
begin
  persons := TList.Create;
  try
    // not safe, can add any pointer
    persons.Add(TPerson.Create('Kirk', 'Hammett'));
    persons.Add(TPerson.Create('James', 'Hetfield'));
    persons.Add(TPerson.Create('Lars', 'Ulrich'));
    persons.Add(TPerson.Create('Robert', 'Trujillo'));

    for i := 0 to persons.Count-1 do
    begin
      p := persons.Items[i];
      Log(p.Fullname);
    end;
  finally
    persons.Free;
  end;
end;

end.
