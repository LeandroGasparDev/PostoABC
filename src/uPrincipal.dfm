object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Gerenciamento - Posto ABC'
  ClientHeight = 596
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 88
    Top = 40
    object Lanamentos1: TMenuItem
      Caption = 'Abastecimentos'
      object Abastecimento1: TMenuItem
        Caption = 'Cadastrar/Lan'#231'ar'
        OnClick = Abastecimento1Click
      end
      object Lista1: TMenuItem
        Caption = 'Lista de Abastecimentos'
        OnClick = Lista1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Abastecimento2: TMenuItem
        Caption = 'Abastecimento'
        OnClick = Abastecimento2Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
