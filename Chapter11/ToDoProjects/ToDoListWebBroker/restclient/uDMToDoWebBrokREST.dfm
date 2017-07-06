object DMToDoWebBrokREST: TDMToDoWebBrokREST
  OldCreateOrder = False
  Height = 290
  Width = 418
  object rclientToDo: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://127.0.0.1:8080'
    Params = <>
    HandleRedirects = True
    Left = 64
    Top = 40
  end
  object rrespToDo: TRESTResponse
    ContentType = 'application/json'
    Left = 160
    Top = 40
  end
  object rreqToDoCreate: TRESTRequest
    Client = rclientToDo
    Params = <
      item
        name = 'title'
      end
      item
        name = 'category'
      end>
    Resource = 'ToDo/Create'
    Response = rrespToDo
    SynchronizedEvents = False
    Left = 64
    Top = 112
  end
  object rreqToDoRead: TRESTRequest
    Client = rclientToDo
    Params = <
      item
        name = 'id'
      end>
    Resource = 'ToDo/Read'
    Response = rrespToDo
    SynchronizedEvents = False
    Left = 160
    Top = 112
  end
  object rreqToDoUpdate: TRESTRequest
    Client = rclientToDo
    Params = <
      item
        name = 'id'
      end
      item
        name = 'title'
      end
      item
        name = 'category'
      end>
    Resource = 'ToDo/Update'
    Response = rrespToDo
    SynchronizedEvents = False
    Left = 256
    Top = 112
  end
  object rreqToDoDelete: TRESTRequest
    Client = rclientToDo
    Params = <
      item
        name = 'id'
      end>
    Resource = 'ToDo/Delete'
    Response = rrespToDo
    SynchronizedEvents = False
    Left = 56
    Top = 192
  end
  object rreqToDoList: TRESTRequest
    Client = rclientToDo
    Params = <>
    Resource = 'ToDo/List'
    Response = rrespToDo
    SynchronizedEvents = False
    Left = 160
    Top = 192
  end
end
