object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 568
  Width = 918
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'fbclient.dll'
    Left = 169
    Top = 32
  end
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=fb'
      'User_Name=sysdba'
      'Password=masterkey'
      'DataBase=localhost:C:\Posto\src\Win32\Debug\DB\DADOS.FDB')
    LoginPrompt = False
    AfterConnect = conexaoAfterConnect
    Left = 48
    Top = 32
  end
  object qry: TFDQuery
    Connection = conexao
    Left = 312
    Top = 40
  end
end
