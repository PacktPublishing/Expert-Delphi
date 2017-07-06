object DMToDo: TDMToDo
  OldCreateOrder = False
  Height = 297
  Width = 421
  object fdconnToDos: TFDConnection
    Params.Strings = (
      'Database=C:\Data\ToDos.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = fdconnToDosAfterConnect
    BeforeConnect = fdconnToDosBeforeConnect
    Left = 32
    Top = 24
  end
  object fdqToDoInsert: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'INSERT INTO ToDos (Id, Title, Category)'
      'VALUES (:Id, :Title, :Category)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 216
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TITLE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CATEGORY'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqToDoSelect: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'SELECT Title, Category '
      'FROM ToDos '
      'WHERE Id = :Id'
      ''
      ''
      ''
      ''
      '')
    Left = 312
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqToDoUpdate: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'UPDATE ToDos SET '
      'Title = :Title, '
      'Category = :Category'
      'WHERE Id = :Id'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 120
    Top = 96
    ParamData = <
      item
        Name = 'TITLE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CATEGORY'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqToDoDelete: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'DELETE FROM ToDos WHERE Id = :Id'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 216
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdqToDoSelectAll: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'SELECT * FROM ToDos'
      'ORDER BY Id DESC'
      ''
      ''
      '')
    Left = 312
    Top = 96
  end
  object fdqToDoMaxId: TFDQuery
    Connection = fdconnToDos
    SQL.Strings = (
      'SELECT MAX(Id) AS MaxId FROM ToDos')
    Left = 120
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 304
    Top = 192
  end
end
