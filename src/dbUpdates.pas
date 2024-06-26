unit dbUpdates;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Vcl.Dialogs, System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ShellAPI;

  // Verifica��o de Banco de Dados
  function TableExists(const TableName: string): Boolean;
  function KeyExists(const Table, Fields, KeyType: String): Boolean;
  function SeqExists(seq: string): boolean;
  function TriggerExists(trigger: string): boolean;

  // Controle de Vers�o
  function getVersao: Integer;
  procedure setVersao(NewVersion: Integer);

  // Cria um BD novo
  procedure dbCreate;
  procedure insertRegistrosPadrao;

  // Atualiza��es de Banco de Dados
  procedure Updates;

implementation

uses dmConexao, uFuncoes;

function TableExists(const TableName: string): Boolean;
begin
  dm.qry.Close;
  dm.qry.SQL.Clear;
  dm.qry.SQL.Add('SELECT 1 FROM RDB$RELATIONS WHERE RDB$RELATION_NAME ='+QuotedStr(TableName));
  dm.qry.Open;
  Result := dm.qry.RecordCount > 0;
end;

function KeyExists(const Table, Fields, KeyType: String): Boolean;
var
  s: string;
begin
  result := False;
  if not TableExists(Table) then
    exit;

  if KeyType = 'PK' then
    s := ' C.RDB$CONSTRAINT_TYPE = '+QuotedStr('PRIMARY KEY')+' AND '
  else
    s := ' C.RDB$CONSTRAINT_TYPE = '+QuotedStr('FOREIGN KEY')+' AND ';

  dm.qry.Close;
  dm.qry.SQL.Text := ' SELECT 1 FROM RDB$RELATION_CONSTRAINTS C, RDB$INDEX_SEGMENTS S'+
                     ' WHERE C.RDB$RELATION_NAME = '+QuotedStr(Table)+' AND'+s+' S.RDB$INDEX_NAME = C.RDB$INDEX_NAME AND S.RDB$FIELD_NAME = '+QuotedStr(Fields);
  dm.qry.Open;
  Result := dm.qry.RecordCount > 0;
  dm.qry.Close;
end;

function SeqExists(seq: string): Boolean;
begin
  dm.qry.Close;
  dm.qry.SQL.Text := 'SELECT 1 FROM RDB$GENERATORS WHERE RDB$GENERATOR_NAME = '+QuotedStr(seq);

  dm.qry.Open;
  Result := dm.qry.RecordCount > 0;
  dm.qry.Close;
end;

function TriggerExists(trigger: string): boolean;
begin
  dm.qry.Close;
  dm.qry.SQL.Text := 'SELECT 1 FROM RDB$TRIGGERS WHERE (UPPER(RDB$TRIGGER_NAME) = '+UpperCase(QuotedStr(trigger))+')';
  dm.qry.Open;
  Result := dm.qry.RecordCount > 0;
  dm.qry.Close;
end;

function getVersao: Integer;
begin
  Result := 0;
  if not TableExists('SCRIPT_UPDATE') then
    Exit;
  Result := StrToIntDef(dm.ExecBusca('SELECT MAX(VERSAO) FROM SCRIPT_UPDATE'),0);
end;

procedure setVersao(NewVersion: Integer);
var
  sql: string;
begin
  sql := Format('INSERT INTO SCRIPT_UPDATE (ID, VERSAO) VALUES (%d, %d)', [NewVersion, NewVersion]);
  try
    dm.conexao.ExecSQL(sql);
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar a vers�o do banco de dados: ' + E.Message);
  end;
end;

procedure dbCreate;
begin
  // Cria a Tabela script_updates - para controle de vers�o dos scrips
  if not TableExists('SCRIPT_UPDATE') then
    dm.conexao.ExecSQL('CREATE TABLE SCRIPT_UPDATE ( '
            +LineBreak+'ID INTEGER NOT NULL PRIMARY KEY, '
            +LineBreak+'DATA_ATUALIZACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP, '
            +LineBreak+'VERSAO INTEGER NOT NULL)');

  if not TableExists('TANQUE') then
    dm.conexao.ExecSQL('CREATE TABLE TANQUE ('
            +LineBreak+'TANQUEID INTEGER NOT NULL, '
            +LineBreak+'COMBUSTIVEL VARCHAR(50) NOT NULL)');

  if not KeyExists('TANQUE','TANQUEID','PK') then
    dm.conexao.ExecSQL('ALTER TABLE TANQUE ADD CONSTRAINT PK_TANQUE PRIMARY KEY (TANQUEID);');

  if not SeqExists('GEN_TANQUE_ID') then
    dm.conexao.ExecSQL('CREATE SEQUENCE GEN_TANQUE_ID;');

  if not TriggerExists('TANQUE_BI') then
    dm.conexao.ExecSQL('create trigger tanque_bi for tanque '
            +LineBreak+'active before insert position 0 '
            +LineBreak+'as '
            +LineBreak+'begin '
            +LineBreak+'  if (new.tanqueid is null) then '
            +LineBreak+'    new.tanqueid = gen_id(gen_tanque_id,1); '
            +LineBreak+'end; ');

  if not TableExists('BOMBA') then
    dm.conexao.ExecSQL('CREATE TABLE BOMBA ('
            +LineBreak+'BOMBAID INTEGER NOT NULL, '
            +LineBreak+'DS_BOMBA VARCHAR(50), '
            +LineBreak+'TANQUEID INTEGER NOT NULL)');

  if not KeyExists('BOMBA','BOMBAID','PK') then
    dm.conexao.ExecSQL('ALTER TABLE BOMBA ADD CONSTRAINT PK_BOMBA PRIMARY KEY (BOMBAID);');

  if not SeqExists('GEN_BOMBA_ID') then
    dm.conexao.ExecSQL('CREATE SEQUENCE GEN_BOMBA_ID;');

  if not TriggerExists('BOMBA_BI') then
    dm.conexao.ExecSQL('create trigger bomba_bi for bomba '
            +LineBreak+'active before insert position 0 '
            +LineBreak+'as '
            +LineBreak+'begin '
            +LineBreak+'  if (new.bombaid is null) then '
            +LineBreak+'    new.bombaid = gen_id(gen_bomba_id,1); '
            +LineBreak+'end; ');

  if not KeyExists('BOMBA','TANQUEID','FK') then
    dm.conexao.ExecSQL('ALTER TABLE BOMBA ADD CONSTRAINT FK_BOMBAS_TANQUES FOREIGN KEY (TANQUEID) REFERENCES TANQUE (TANQUEID) ON DELETE CASCADE ON UPDATE CASCADE;');

  if not TableExists('ABASTECIMENTO') then
    dm.conexao.ExecSQL('CREATE TABLE ABASTECIMENTO ('
            +LineBreak+'ABASTECIMENTOID INTEGER NOT NULL, '
            +LineBreak+'DT_ABASTECIMENTO DATE DEFAULT CURRENT_DATE, '
            +LineBreak+'LT_ABASTECIDOS FLOAT, '
            +LineBreak+'VL_ABASTECIDO FLOAT, '
            +LineBreak+'VL_POR_LITRO FLOAT, '
            +LineBreak+'PE_IMPOSTO FLOAT, '
            +LineBreak+'VL_IMPOSTO FLOAT, '
            +LineBreak+'VL_ABASTECIDO_COM_IMPOSTO FLOAT, '
            +LineBreak+'BOMBAID INTEGER NOT NULL)');

  if not KeyExists('ABASTECIMENTO','ABASTECIMENTOID','PK') then
    dm.conexao.ExecSQL('ALTER TABLE ABASTECIMENTO ADD CONSTRAINT PK_ABASTECIMENTOS PRIMARY KEY (ABASTECIMENTOID);');

  if not SeqExists('GEN_ABASTECIMENTO_ID') then
    dm.conexao.ExecSQL('CREATE SEQUENCE GEN_abastecimento_ID;');

  if not TriggerExists('ABASTECIMENTO_BI') then
    dm.conexao.ExecSQL('create trigger abastecimento_bi for abastecimento '
            +LineBreak+'active before insert position 0 '
            +LineBreak+'as '
            +LineBreak+'begin '
            +LineBreak+'  if (new.abastecimentoid is null) then '
            +LineBreak+'    new.abastecimentoid = gen_id(gen_abastecimento_id,1); '
            +LineBreak+'end; ');

  if not KeyExists('ABASTECIMENTO','BOMBAID','FK') then
    dm.conexao.ExecSQL('ALTER TABLE ABASTECIMENTO ADD CONSTRAINT FK_ABASTECIMENTOS_BOMBAS FOREIGN KEY (BOMBAID) REFERENCES BOMBA (BOMBAID) ON DELETE NO ACTION ON UPDATE CASCADE;');

  dm.conexao.ExecSQL('CREATE OR ALTER PROCEDURE INSERT_ABASTECIMENTO (' +
         LineBreak + '  DT_ABASTECIMENTO date, ' +
         LineBreak + '  LT_ABASTECIDOS FLOAT, ' +
         LineBreak + '  VL_ABASTECIDO FLOAT, ' +
         LineBreak + '  PE_IMPOSTO FLOAT, ' +
         LineBreak + '  BOMBAID INTEGER) ' +
         LineBreak + 'AS ' +
         LineBreak + '  DECLARE VARIABLE VL_IMPOSTO FLOAT; ' +
         LineBreak + '  DECLARE VARIABLE VL_ABASTECIDO_COM_IMPOSTO FLOAT; ' +
         LineBreak + '  DECLARE VARIABLE VL_POR_LITRO FLOAT; ' +
         LineBreak + 'BEGIN ' +
         LineBreak + '  VL_IMPOSTO                = VL_ABASTECIDO * (PE_IMPOSTO / 100); ' +
         LineBreak + '  VL_ABASTECIDO_COM_IMPOSTO = VL_ABASTECIDO + VL_IMPOSTO; ' +
         LineBreak + '  VL_POR_LITRO              = VL_ABASTECIDO_COM_IMPOSTO / LT_ABASTECIDOS; ' +
         LineBreak + '  INSERT INTO ABASTECIMENTO ' +
         LineBreak + '    (ABASTECIMENTOID, DT_ABASTECIMENTO, LT_ABASTECIDOS, VL_ABASTECIDO, PE_IMPOSTO, VL_IMPOSTO, VL_ABASTECIDO_COM_IMPOSTO, VL_POR_LITRO, BOMBAID) ' +
         LineBreak + '  VALUES ' +
         LineBreak + '    (GEN_ID(GEN_ABASTECIMENTO_ID, 1), :DT_ABASTECIMENTO, :LT_ABASTECIDOS, :VL_ABASTECIDO, :PE_IMPOSTO, :VL_IMPOSTO, :VL_ABASTECIDO_COM_IMPOSTO, :VL_POR_LITRO, :BOMBAID); ' +
         LineBreak + 'END;');

  insertRegistrosPadrao;
end;

procedure insertRegistrosPadrao;
begin
  dm.conexao.ExecSQL('INSERT INTO TANQUE (COMBUSTIVEL) VALUES (''DIESEL'');');
  dm.conexao.ExecSQL('INSERT INTO TANQUE (COMBUSTIVEL) VALUES (''GASOLINA'');');
  dm.conexao.ExecSQL('INSERT INTO BOMBA (DS_BOMBA, TANQUEID) VALUES (''BOMBA A - DIESEL'', 1);');
  dm.conexao.ExecSQL('INSERT INTO BOMBA (DS_BOMBA, TANQUEID) VALUES (''BOMBA B - DIESEL'', 1);');
  dm.conexao.ExecSQL('INSERT INTO BOMBA (DS_BOMBA, TANQUEID) VALUES (''BOMBA C - GASOLINA'', 2);');
  dm.conexao.ExecSQL('INSERT INTO BOMBA (DS_BOMBA, TANQUEID) VALUES (''BOMBA D - GASOLINA'', 2);');
end;

procedure Updates;
var
  Versao: Integer;
begin
  Versao := getVersao;

  if Versao < 1 then
  begin
    dbCreate;
    setVersao(1);
  end;

  if versao < 2 then
  begin
    if not TableExists('PARAMETROS_SISTEMA') then
    begin
      dm.conexao.ExecSQL('CREATE TABLE PARAMETROS_SISTEMA ( '
              +LineBreak+'CODIGO VARCHAR(30), '
              +LineBreak+'DESCRICAO VARCHAR(100), '
              +LineBreak+'CONTEUDO VARCHAR(500))');
      dm.conexao.ExecSQL('CREATE UNIQUE INDEX PARAMETROS_SISTEMA_CODIGO ON PARAMETROS_SISTEMA (CODIGO);');
    end;

    dm.conexao.ExecSQL('INSERT INTO PARAMETROS_SISTEMA (CODIGO, DESCRICAO, CONTEUDO) '
            +LineBreak+'VALUES (''ABASTECIMENTO_PE_IMPOSTO'', ''Percentual de Imposto que incide sobre o Abastecimento'', ''13''); ');

    setVersao(2);
  end;
end;

end.


