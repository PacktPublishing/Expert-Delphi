unit uSchool;

interface

implementation

var
  grade: integer;

//{$SCOPEDENUMS ON}
//type
//  TSchoolGrade = (VeryGood, Good, Sufficient, Insufficient);

type
  TSchoolGrade = (sgVeryGood, sgGood, sgSufficient, sgInsufficient);
  TSchoolGrades = set of TSchoolGrade;

const
  QUALIFYING_GRADES: TSchoolGrades = [sgVeryGood, sgGood, sgSufficient];

type
  TSchoolGradeHelper = record helper for TSchoolGrade
  public
    function ToString: string;
    function ToInteger: integer;
    function IsQualifying: boolean;
  end;

{ TSchoolGradeHelper }

function TSchoolGradeHelper.IsQualifying: boolean;
begin
  Result := self in QUALIFYING_GRADES;
end;

function TSchoolGradeHelper.ToInteger: integer;
begin
  case self of
    sgVeryGood: Result := 5;
    sgGood: Result := 4;
    sgSufficient: Result := 3;
    sgInsufficient: Result := 2;
  end;
end;

function TSchoolGradeHelper.ToString: string;
begin
  case self of
    sgVeryGood: Result := 'Very Good';
    sgGood: Result := 'Good';
    sgSufficient: Result := 'Sufficient';
    sgInsufficient: Result := 'Insufficient';
  end;
end;

end.
