object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'ActToDoCreate'
      PathInfo = '/ToDo/Create'
      OnAction = WebModule1ActToDoCreateAction
    end
    item
      Name = 'ActToDoRead'
      PathInfo = '/ToDo/Read'
      OnAction = WebModule1ActToDoReadAction
    end
    item
      Name = 'ActToDoUpdate'
      PathInfo = '/ToDo/Update'
      OnAction = WebModule1ActToDoUpdateAction
    end
    item
      Name = 'ActToDoDelete'
      PathInfo = '/ToDo/Delete'
      OnAction = WebModule1actToDoDeleteAction
    end
    item
      Name = 'ActToDoList'
      PathInfo = '/ToDo/List'
      OnAction = WebModule1ActToDoListAction
    end>
  Height = 151
  Width = 245
end
