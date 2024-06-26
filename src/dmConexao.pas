unit dmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls;

type
  Tdm = class(TDataModule)
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    conexao: TFDConnection;
    qry: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure conexaoAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    pABASTECIMENTO_PE_IMPOSTO: Double;

    { Public declarations }
    procedure CriaConectaDB;

    function ExecQuery(oQuery: TFDQuery; cSQL: String; Log: TMemo = Nil): Boolean;
    function ExecBusca(cSQL: String; Log: TMemo = Nil): String;
    function ExecSQL(cSQL: String; Log: TMemo = nil): Boolean;

    procedure ExecutaUpdates;

    procedure getParametrosSistema;
  end;

var
  dm: Tdm;

implementation

uses
  Vcl.Dialogs, dbUpdates, uFuncoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


{ Tdm }

function Tdm.ExecBusca(cSQL: String; Log: TMemo = Nil): String;
begin
  if ExecQuery(qry, cSQL, Log) then
    Result := qry.Fields[0].AsString
  else
    Result := '';
  qry.Close;
end;

function Tdm.ExecQuery(oQuery: TFDQuery; cSQL: String; Log: TMemo = Nil): Boolean;
begin
  oQuery.Close;
  oQuery.SQL.Text := cSQL;
  try
    oQuery.Open;
    Result := not oQuery.IsEmpty;
  except
    on e: Exception do
    begin
      Result := False;
      if Log <> nil then
      begin
        Log.Lines.Add('--');
        Log.Lines.Add(cSQL);
        Log.Lines.Add('Erro: (' + e.Message + ') Erro na execu��o da query...');
      end
      else
        ShowMessage('Erro: (' + e.Message + ') Erro na execu��o da query:' + #13 + cSQL);
    end;
  end;
end;

function Tdm.ExecSQL(cSQL: String; Log: TMemo = nil): Boolean;
begin
  qry.Close;
  qry.SQL.Text := cSQL;
  try
    qry.ExecSQL;
    qry.Close;
    Result := True;
  except
    on e: Exception do
    begin
      if Log <> nil then
      begin
        Log.Lines.Add('Erro: (' + e.Message + ')');
        Log.Lines.Add('');
        Log.Lines.Add(cSQL);
        Log.Lines.Add('==========================================================');
        Log.Lines.Add('');
      end
      else
        ShowMessage('ErroSQL: (' + e.Message + ')' + LineBreak + cSQL);
      Result := False;
    end;
  end;
end;

procedure Tdm.conexaoAfterConnect(Sender: TObject);
begin
  ExecutaUpdates;
  getParametrosSistema;
end;

procedure Tdm.CriaConectaDB;
begin
  try
    dirCreate(ExtractFilePath(ParamStr(0))+'\DB');
    conexao.DriverName                        := 'FB';
    conexao.Params.Values['Database']         := 'localhost:'+ExtractFilePath(ParamStr(0))+'\DB\DADOS.FDB';
    conexao.Params.Values['User_Name']        := 'sysdba';
    conexao.Params.Values['Password']         := 'masterkey';
    conexao.LoginPrompt                       := False;

    if not FileExists(ExtractFilePath(ParamStr(0))+'\DB\DADOS.FDB') then
      conexao.Params.Values['CreateDatabase'] := 'True';
    conexao.Connected                         := True;
  except
    on E: Exception do
      ShowMessage('Erro ao criar/conectar ao banco de dados: ' + E.Message);
  end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  CriaConectaDB;
end;

procedure Tdm.ExecutaUpdates;
begin
  try
    try
      Conexao.AfterConnect  := Nil;
      Updates;
    Except
      on e:exception do
        showmessage('Erro DBUpdates: ' + e.Message);
    end;
  finally
    Conexao.AfterConnect  := ConexaoAfterConnect;
  end;
end;

procedure Tdm.getParametrosSistema;
begin
  pABASTECIMENTO_PE_IMPOSTO := StrToFloatDef(ExecBusca('SELECT CONTEUDO FROM PARAMETROS_SISTEMA WHERE CODIGO = ''ABASTECIMENTO_PE_IMPOSTO'''),0);
end;

end.
