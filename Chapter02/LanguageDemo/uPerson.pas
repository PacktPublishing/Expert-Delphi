unit uPerson;

interface

type
  TPerson = class
    FirstName, LastName: string;
    constructor Create(AFirstName, ALastName: string);
    function Fullname: string;
  end;

implementation

{ TPerson }

constructor TPerson.Create(AFirstName, ALastName: string);
begin
  FirstName := AFirstName;
  LastName := ALastName;
end;

function TPerson.Fullname: string;
begin
  Result := FirstName + ' ' + LastName;
end;

end.
