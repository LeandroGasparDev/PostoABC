object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro de Tanques de Combustivel'
  ClientHeight = 353
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 245
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 709
    object Label12: TLabel
      Left = 4
      Top = 8
      Width = 121
      Height = 16
      Caption = 'Pesquisa de Tanques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPesqPedidos: TMaskEdit
      Left = 0
      Top = 25
      Width = 479
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      Text = ''
    end
    object gridAbastecimentos: TDBGrid
      Left = 0
      Top = 54
      Width = 479
      Height = 182
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 245
    Width = 487
    Height = 108
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 709
    ExplicitHeight = 238
    object TabSheet1: TTabSheet
      Caption = 'Cadastro do Tanque'
    end
  end
end
