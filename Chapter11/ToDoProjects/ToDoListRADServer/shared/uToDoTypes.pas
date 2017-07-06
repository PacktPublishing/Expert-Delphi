unit uToDoTypes;

interface

uses
  System.Generics.Collections;

type
  TToDo = record
    Id: Integer;
    Title: string;
    Category: string;
  end;

  TToDos = TList<TToDo>;

  IToDoData = interface
    function ToDoCreate(aValue: TToDo): integer;
    function ToDoRead(id: integer; out aValue: TToDo): boolean;
    function ToDoUpdate(aValue: TToDo): boolean;
    function ToDoDelete(id: integer): boolean;
    procedure ToDoList(aList: TToDos);
  end;

implementation

end.
