object frmPeriodo: TfrmPeriodo
  Left = 0
  Top = 0
  Caption = 'Per'#237'odo'
  ClientHeight = 118
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 275
    Height = 73
  end
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 38
    Height = 16
    Caption = 'Inicio'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 146
    Top = 22
    Width = 26
    Height = 16
    Caption = 'Fim'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object edInicio: TDateTimePicker
    Left = 16
    Top = 44
    Width = 121
    Height = 21
    Date = 39043.000000000000000000
    Time = 0.698722141212783800
    TabOrder = 0
  end
  object edFim: TDateTimePicker
    Left = 146
    Top = 44
    Width = 121
    Height = 21
    Date = 39043.000000000000000000
    Time = 0.698722141212783800
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 62
    Top = 87
    Width = 110
    Height = 29
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 173
    Top = 87
    Width = 110
    Height = 29
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
