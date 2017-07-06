object DMLightSensor: TDMLightSensor
  OldCreateOrder = False
  OnCreate = AndroidServiceCreate
  OnDestroy = AndroidServiceDestroy
  OnStartCommand = AndroidServiceStartCommand
  Height = 148
  Width = 268
  object NotificationCenter1: TNotificationCenter
    Left = 64
    Top = 40
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 160
    Top = 56
  end
end
