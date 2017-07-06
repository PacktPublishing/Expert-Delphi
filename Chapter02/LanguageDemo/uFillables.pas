unit uFillables;

interface

type
  TFillable<T> = record
    Value: T;
    IsFilled: boolean;
  end;

  TFillableString = TFillable<string>;
  TFillableInteger = TFillable<integer>;

implementation

end.


