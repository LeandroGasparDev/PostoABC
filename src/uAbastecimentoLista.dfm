object frmAbastecimentoLista: TfrmAbastecimentoLista
  Left = 0
  Top = 0
  Caption = 'Lista de Abastecimentos'
  ClientHeight = 504
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 138
    Width = 171
    Height = 16
    Caption = 'Lista de Abastecimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gridAbastecimentos: TDBGrid
    Left = 6
    Top = 182
    Width = 966
    Height = 282
    DataSource = dtsAbastecimento
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = '#'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ABASTECIMENTO'
        Title.Caption = 'Data'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_BOMBA'
        Title.Caption = 'Bomba'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TANQUE_COMBUSTIVEL'
        Title.Caption = 'Tanque/Combustivel'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LT_ABASTECIDOS'
        Title.Caption = 'Qtde. Litros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_ABASTECIDO'
        Title.Caption = 'R$ Abastecido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_POR_LITRO'
        Title.Caption = 'R$ Litro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_IMPOSTO'
        Title.Caption = '% Imposto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_IMPOSTO'
        Title.Caption = 'R$ Imposto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_ABASTECIDO_COM_IMPOSTO'
        Title.Caption = 'R$ Abastecido c/ Imposto'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 980
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 6
    object BitBtn1: TBitBtn
      Left = 8
      Top = 16
      Width = 110
      Height = 29
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 118
      Top = 16
      Width = 110
      Height = 29
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object rbFiltro: TRadioGroup
    Left = -4
    Top = 8
    Width = 976
    Height = 124
    Caption = '  Pesquisa de Abastecimentos  '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 6
    Items.Strings = (
      'Abastecimentos de Hoje'
      'Abastecimentos dos ultimos 7 dias'
      'Abastecimentos dos ultimos 30 dias'
      'Abastecimentos dos ultimos 3 meses'
      'Abastecimentos dos ultimos 6 meses'
      'Abastecimentos do ultimo 1 ano'
      'Todos Abastecimentos'
      'Filtrar por Datas')
    ParentFont = False
    TabOrder = 2
  end
  object edtDataIni: TDateTimePicker
    Left = 623
    Top = 99
    Width = 97
    Height = 23
    Date = 45428.000000000000000000
    Time = 0.346155856481345800
    TabOrder = 3
  end
  object edtDataFim: TDateTimePicker
    Left = 726
    Top = 99
    Width = 97
    Height = 23
    Date = 45428.000000000000000000
    Time = 0.346155856481345800
    TabOrder = 4
  end
  object btnBuscar: TBitBtn
    Left = 847
    Top = 96
    Width = 110
    Height = 29
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnBuscarClick
  end
  object edtPesq: TMaskEdit
    Left = 134
    Top = 157
    Width = 838
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 6
    Text = ''
    OnChange = edtPesqChange
  end
  object cboPesq: TComboBox
    Left = 7
    Top = 157
    Width = 124
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 1
    TabOrder = 7
    Text = 'BOMBA'
    Items.Strings = (
      'CODIGO'
      'BOMBA'
      'TANQUE/COMBUSTIVEL')
  end
  object qryAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = dm.conexao
    SQL.Strings = (
      'select'
      '    ab.abastecimentoid as codigo,'
      '    ab.dt_abastecimento,'
      '    ab.lt_abastecidos,'
      '    ab.vl_abastecido,'
      '    ab.vl_por_litro,'
      '    ab.pe_imposto,'
      '    ab.vl_imposto,'
      '    ab.vl_abastecido_com_imposto,'
      '    bo.ds_bomba,'
      '    tq.combustivel as tanque_combustivel'
      'from'
      '    abastecimento ab'
      '    join bomba bo on bo.bombaid = ab.bombaid'
      '    join tanque tq on tq.tanqueid = bo.tanqueid'
      'where'
      '    ab.abastecimentoid is not null'
      'order by ab.abastecimentoid')
    Left = 416
    Top = 296
    object qryAbastecimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'ABASTECIMENTOID'
      Required = True
    end
    object qryAbastecimentoDT_ABASTECIMENTO: TDateField
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
    end
    object qryAbastecimentoLT_ABASTECIDOS: TSingleField
      FieldName = 'LT_ABASTECIDOS'
      Origin = 'LT_ABASTECIDOS'
    end
    object qryAbastecimentoVL_ABASTECIDO: TSingleField
      FieldName = 'VL_ABASTECIDO'
      Origin = 'VL_ABASTECIDO'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryAbastecimentoVL_POR_LITRO: TSingleField
      FieldName = 'VL_POR_LITRO'
      Origin = 'VL_POR_LITRO'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryAbastecimentoPE_IMPOSTO: TSingleField
      FieldName = 'PE_IMPOSTO'
      Origin = 'PE_IMPOSTO'
      DisplayFormat = '0.00'
    end
    object qryAbastecimentoVL_IMPOSTO: TSingleField
      FieldName = 'VL_IMPOSTO'
      Origin = 'VL_IMPOSTO'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryAbastecimentoVL_ABASTECIDO_COM_IMPOSTO: TSingleField
      FieldName = 'VL_ABASTECIDO_COM_IMPOSTO'
      Origin = 'VL_ABASTECIDO_COM_IMPOSTO'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryAbastecimentoDS_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_BOMBA'
      Origin = 'DS_BOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryAbastecimentoTANQUE_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE_COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dtsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 464
    Top = 296
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 256
    object ExportarparaExcel1: TMenuItem
      Caption = 'Exportar para Excel'
      OnClick = ExportarparaExcel1Click
    end
  end
end
