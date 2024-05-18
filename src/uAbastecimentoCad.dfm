object frmAbastecimentoCad: TfrmAbastecimentoCad
  Left = 0
  Top = 0
  Caption = 'Abastecimentos'
  ClientHeight = 398
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Bevel2: TBevel
    Left = 8
    Top = 5
    Width = 281
    Height = 133
  end
  object Bevel1: TBevel
    Left = 8
    Top = 307
    Width = 535
    Height = 9
  end
  object lblImposto: TLabel
    Left = 111
    Top = 105
    Width = 24
    Height = 15
    Alignment = taCenter
    Caption = '13%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 142
    Top = 105
    Width = 144
    Height = 13
    Caption = '(Configurado via Parametro)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 19
    Top = 23
    Width = 38
    Height = 16
    Caption = 'Data:'
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
    Left = 19
    Top = 50
    Width = 80
    Height = 16
    Caption = 'Qtde Litros:'
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
  object Label5: TLabel
    Left = 19
    Top = 77
    Width = 64
    Height = 16
    Caption = 'R$ Total:'
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
  object Label6: TLabel
    Left = 19
    Top = 103
    Width = 73
    Height = 16
    Caption = '% Imposto'
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
  object Label1: TLabel
    Left = 8
    Top = 147
    Width = 134
    Height = 16
    Caption = 'Sele'#231#227'o da Bomba'
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
  object edtData: TDateTimePicker
    Left = 111
    Top = 16
    Width = 128
    Height = 23
    Date = 45427.000000000000000000
    Time = 0.703854768515157000
    TabOrder = 0
    OnKeyDown = edtDataKeyDown
  end
  object btnSalvar: TBitBtn
    Left = 8
    Top = 361
    Width = 110
    Height = 29
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnCancelar: TBitBtn
    Left = 124
    Top = 361
    Width = 110
    Height = 29
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object edtQtdeLitros: TMaskEdit
    Left = 111
    Top = 43
    Width = 128
    Height = 23
    Alignment = taRightJustify
    TabOrder = 1
    Text = ''
    OnExit = edtQtdeLitrosExit
    OnKeyDown = edtDataKeyDown
  end
  object edtVLTotal: TMaskEdit
    Left = 111
    Top = 70
    Width = 128
    Height = 23
    Alignment = taRightJustify
    TabOrder = 2
    Text = ''
    OnExit = edtQtdeLitrosExit
    OnKeyDown = edtDataKeyDown
  end
  object cbNovoAbastecimento: TCheckBox
    Left = 8
    Top = 324
    Width = 321
    Height = 17
    Caption = 'Novo Abastecimento em seguida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object gridBomba: TDBGrid
    Left = 8
    Top = 165
    Width = 537
    Height = 132
    DataSource = dtsBomba
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = edtDataKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'BOMBAID'
        Title.Caption = '#'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_BOMBA'
        Title.Caption = 'Bomba'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMBUSTIVEL'
        Title.Caption = 'Tanque de Combustivel'
        Width = 196
        Visible = True
      end>
  end
  object qryBomba: TFDQuery
    Connection = dm.conexao
    SQL.Strings = (
      'SELECT'
      '    B.BOMBAID,'
      '    B.DS_BOMBA,'
      '    T.COMBUSTIVEL'
      'FROM'
      '    BOMBA B'
      '    JOIN TANQUE T ON T.TANQUEID = B.TANQUEID')
    Left = 96
    Top = 208
    object qryBombaBOMBAID: TIntegerField
      FieldName = 'BOMBAID'
      Origin = 'BOMBAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBombaDS_BOMBA: TStringField
      FieldName = 'DS_BOMBA'
      Origin = 'DS_BOMBA'
      Size = 50
    end
    object qryBombaCOMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dtsBomba: TDataSource
    DataSet = qryBomba
    Left = 160
    Top = 208
  end
end
