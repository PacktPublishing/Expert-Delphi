object DMToDoEMS: TDMToDoEMS
  OldCreateOrder = False
  Height = 290
  Width = 418
  object EMSProvider1: TEMSProvider
    ApiVersion = '1'
    URLHost = '127.0.0.1'
    URLPort = 8080
    Left = 32
    Top = 24
  end
  object beToDoList: TBackendEndpoint
    Provider = EMSProvider1
    Params = <>
    Resource = 'ToDo'
    Response = rrespToDo
    Left = 40
    Top = 88
  end
  object rrespToDo: TRESTResponse
    Left = 280
    Top = 64
  end
  object beToDoRead: TBackendEndpoint
    Provider = EMSProvider1
    Params = <
      item
        name = 'item'
        Value = '5'
      end>
    Resource = 'ToDo'
    ResourceSuffix = 'item'
    Response = rrespToDo
    Left = 128
    Top = 88
  end
  object beToDoCreate: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <
      item
        name = 'title'
        Value = 't'
      end
      item
        name = 'category'
        Value = 'c'
      end>
    Resource = 'ToDo'
    Response = rrespToDo
    Left = 64
    Top = 184
  end
  object beToDoUpdate: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPUT
    Params = <>
    Resource = 'ToDo'
    Response = rrespToDo
    Left = 152
    Top = 160
  end
  object beToDoDelete: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmDELETE
    Params = <
      item
        name = 'item'
      end>
    Resource = 'ToDo'
    ResourceSuffix = 'item'
    Response = rrespToDo
    Left = 248
    Top = 152
  end
end
