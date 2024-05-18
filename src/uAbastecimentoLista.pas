unit uAbastecimentoLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmAbastecimentoLista = class(TForm)
    gridAbastecimentos: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    rbFiltro: TRadioGroup;
    edtDataIni: TDateTimePicker;
    edtDataFim: TDateTimePicker;
    Label1: TLabel;
    qryAbastecimento: TFDQuery;
    dtsAbastecimento: TDataSource;
    qryAbastecimentoCODIGO: TIntegerField;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryAbastecimentoLT_ABASTECIDOS: TSingleField;
    qryAbastecimentoVL_ABASTECIDO: TSingleField;
    qryAbastecimentoVL_POR_LITRO: TSingleField;
    qryAbastecimentoPE_IMPOSTO: TSingleField;
    qryAbastecimentoVL_IMPOSTO: TSingleField;
    qryAbastecimentoVL_ABASTECIDO_COM_IMPOSTO: TSingleField;
    qryAbastecimentoDS_BOMBA: TStringField;
    qryAbastecimentoTANQUE_COMBUSTIVEL: TStringField;
    btnBuscar: TBitBtn;
    edtPesq: TMaskEdit;
    cboPesq: TComboBox;
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
  private
    { Private declarations }
    sqlOriginal : String;
    procedure CodigoFormumarioShow;
  public
    { Public declarations }
  end;

var
  frmAbastecimentoLista: TfrmAbastecimentoLista;

implementation

{$R *.dfm}

uses dmConexao, uPrincipal;

procedure TfrmAbastecimentoLista.BitBtn1Click(Sender: TObject);
begin
  frmPrincipal.Abastecimento1Click(Nil);
  btnBuscar.Click;
end;

procedure TfrmAbastecimentoLista.btnBuscarClick(Sender: TObject);
var
  sql: String;
begin
  case rbFiltro.ItemIndex of
    0: sql := 'ab.dt_abastecimento = current_date';
    1: sql := 'ab.dt_abastecimento >= current_date -7';
    2: sql := 'ab.dt_abastecimento >= current_date -30';
    3: sql := 'ab.dt_abastecimento >= current_date -90';
    4: sql := 'ab.dt_abastecimento >= current_date -180';
    5: sql := 'ab.dt_abastecimento >= current_date -360';
    6: sql := '';
    7: sql := Format('ab.dt_abastecimento BETWEEN ''%s'' AND ''%s''',[FormatDateTime('yyyy-mm-dd', edtDataIni.Date),FormatDateTime('yyyy-mm-dd', edtDataFim.Date)]);
  end;

  qryAbastecimento.Close;
  if sql <> '' then
    qryAbastecimento.SQL.Text := StringReplace(sqlOriginal, 'where','where '+sql+' and ',[])
  else
    qryAbastecimento.SQL.Text := sqlOriginal;
  qryAbastecimento.Open;
end;

procedure TfrmAbastecimentoLista.BitBtn3Click(Sender: TObject);
begin
  if UpperCase(InputBox('Digite a senha para a exclusão do Abastecimento','Senha','')) = 'EXCLUIR' then
  begin
    qryAbastecimento.Delete;
    qryAbastecimento.ApplyUpdates(0)
  end;
end;

procedure TfrmAbastecimentoLista.CodigoFormumarioShow;
begin
  sqlOriginal := qryAbastecimento.SQL.Text;
  btnBuscar.click;
end;

procedure TfrmAbastecimentoLista.edtPesqChange(Sender: TObject);
  function getFieldName: String;
  begin
    Result := '';
    case cboPesq.ItemIndex of
      0: Result := 'CODIGO';
      1: Result := 'DS_BOMBA';
      2: Result := 'TANQUE_COMBUSTIVEL';
    end;
  end;
var
  cPesq: String;
begin
  if edtPesq.GetTextLen > 0 then
  begin
    cPesq := getFieldName;
    if cPesq = '' then
      Exit;

    qryAbastecimento.IndexFieldNames := cPesq;
    qryAbastecimento.Locate(cPesq, edtPesq.Text,[LoPartialKey,LoCaseInsensitive]);
  end;
end;

procedure TfrmAbastecimentoLista.FormShow(Sender: TObject);
begin
  CodigoFormumarioShow;
end;

end.
