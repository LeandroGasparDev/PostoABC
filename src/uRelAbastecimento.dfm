object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  ClientHeight = 564
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object rltAbastecimentos: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimentos'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 27
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object rlblTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 713
        Height = 16
        Align = faLeftTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos - Por dia'
        Transparent = False
      end
      object rlsystmnf2: TRLSystemInfo
        Left = 594
        Top = 0
        Width = 124
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'Pag:'
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 65
      Width = 718
      Height = 24
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rlblDtAbastecimento: TRLLabel
        Left = 3
        Top = 0
        Width = 62
        Height = 18
        Align = faTopOnly
        Caption = 'Data'
      end
      object rlblLitros1: TRLLabel
        Left = 440
        Top = 0
        Width = 101
        Height = 16
        Align = faTopOnly
        Caption = 'Qtd Total Litros'
      end
      object rlblBOmba: TRLLabel
        Left = 286
        Top = 0
        Width = 97
        Height = 16
        Align = faTopOnly
        Caption = 'Tanque/Comb.'
      end
      object rlblVlAbastecimento1: TRLLabel
        Left = 559
        Top = 0
        Width = 154
        Height = 16
        Align = faTopOnly
        Caption = 'R$ Total Abastecimento'
      end
      object RLLabel1: TRLLabel
        Left = 111
        Top = 0
        Width = 49
        Height = 16
        Align = faTopOnly
        Caption = 'Bomba'
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 24
      BandType = btFooter
    end
    object rlgrp1: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 56
      object TRLBand: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        object rldbtxtCodigoDT_ABASTECIMENTO: TRLDBText
          Left = 3
          Top = 0
          Width = 94
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'DT_ABASTECIMENTO'
          DataSource = dtsAbastecimento
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 559
          Top = 0
          Width = 156
          Height = 16
          Align = faTopOnly
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'TOT_VL_ABASTECIDO_COM_IMPOSTO'
          DataSource = dtsAbastecimento
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 111
          Top = 0
          Width = 169
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'DS_BOMBA'
          DataSource = dtsAbastecimento
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 286
          Top = 0
          Width = 122
          Height = 18
          Align = faTopOnly
          AutoSize = False
          DataField = 'TANQUE_COMBUSTIVEL'
          DataSource = dtsAbastecimento
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 426
          Top = 0
          Width = 115
          Height = 16
          Align = faTopOnly
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'TOT_LT_ABASTECIDOS'
          DataSource = dtsAbastecimento
          Text = ''
        end
      end
      object TRLBand5: TRLBand
        Left = 0
        Top = 24
        Width = 718
        Height = 25
        BandType = btFooter
        object rlblValorGeral: TRLLabel
          Left = 414
          Top = 0
          Width = 134
          Height = 16
          Align = faTopOnly
          Caption = 'Total Abastecimentos:'
        end
        object RLDBResult1: TRLDBResult
          Left = 559
          Top = -2
          Width = 156
          Height = 16
          Alignment = taRightJustify
          DataField = 'TOT_VL_ABASTECIDO_COM_IMPOSTO'
          DataSource = dtsAbastecimento
          DisplayMask = '###,###,##0.00'
          Info = riSum
          Text = ''
        end
      end
    end
  end
  object qryAbastecimento: TFDQuery
    Connection = dm.conexao
    SQL.Strings = (
      'SELECT'
      '    AB.DT_ABASTECIMENTO ,'
      '    TQ.COMBUSTIVEL AS TANQUE_COMBUSTIVEL,'
      '    BO.DS_BOMBA,'
      '    SUM(AB.LT_ABASTECIDOS) AS TOT_LT_ABASTECIDOS,'
      '    SUM(AB.VL_ABASTECIDO) AS TOT_VL_ABASTECIDO,'
      '    AVG(AB.VL_POR_LITRO) AS MED_VL_MEDIO_POR_LITRO,'
      '    SUM(AB.VL_IMPOSTO) AS TOT_VL_IMPOSTO,'
      
        '    SUM(AB.VL_ABASTECIDO_COM_IMPOSTO) AS TOT_VL_ABASTECIDO_COM_I' +
        'MPOSTO'
      'FROM'
      '    ABASTECIMENTO AB'
      '    JOIN BOMBA BO ON BO.BOMBAID = AB.BOMBAID'
      '    JOIN TANQUE TQ ON TQ.TANQUEID = BO.TANQUEID'
      'WHERE'
      '    AB.DT_ABASTECIMENTO BETWEEN :DT_INICIO AND :DT_FIM'
      'GROUP BY'
      '    AB.DT_ABASTECIMENTO,'
      '    TQ.COMBUSTIVEL,'
      '    BO.DS_BOMBA'
      'ORDER BY'
      '    AB.DT_ABASTECIMENTO, TQ.COMBUSTIVEL, BO.DS_BOMBA;')
    Left = 480
    Top = 216
    ParamData = <
      item
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qryAbastecimentoDT_ABASTECIMENTO: TDateField
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
    end
    object qryAbastecimentoTANQUE_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE_COMBUSTIVEL'
      Origin = 'COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryAbastecimentoDS_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_BOMBA'
      Origin = 'DS_BOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryAbastecimentoTOT_LT_ABASTECIDOS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOT_LT_ABASTECIDOS'
      Origin = 'TOT_LT_ABASTECIDOS'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryAbastecimentoTOT_VL_ABASTECIDO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOT_VL_ABASTECIDO'
      Origin = 'TOT_VL_ABASTECIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryAbastecimentoMED_VL_MEDIO_POR_LITRO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'MED_VL_MEDIO_POR_LITRO'
      Origin = 'MED_VL_MEDIO_POR_LITRO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryAbastecimentoTOT_VL_IMPOSTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOT_VL_IMPOSTO'
      Origin = 'TOT_VL_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object qryAbastecimentoTOT_VL_ABASTECIDO_COM_IMPOSTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'TOT_VL_ABASTECIDO_COM_IMPOSTO'
      Origin = 'TOT_VL_ABASTECIDO_COM_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object dtsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 512
    Top = 216
  end
end
