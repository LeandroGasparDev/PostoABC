unit uRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TfrmRelAbastecimento = class(TForm)
    qryAbastecimento: TFDQuery;
    dtsAbastecimento: TDataSource;
    rltAbastecimentos: TRLReport;
    RLBand1: TRLBand;
    rlblTitulo: TRLLabel;
    rlsystmnf2: TRLSystemInfo;
    RLBand2: TRLBand;
    rlblDtAbastecimento: TRLLabel;
    rlblLitros1: TRLLabel;
    rlblBOmba: TRLLabel;
    rlblVlAbastecimento1: TRLLabel;
    RLBand4: TRLBand;
    rlgrp1: TRLGroup;
    TRLBand: TRLBand;
    rldbtxtCodigoDT_ABASTECIMENTO: TRLDBText;
    TRLBand5: TRLBand;
    rlblValorGeral: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBText2: TRLDBText;
    qryAbastecimentoDT_ABASTECIMENTO: TDateField;
    qryAbastecimentoTANQUE_COMBUSTIVEL: TStringField;
    qryAbastecimentoDS_BOMBA: TStringField;
    qryAbastecimentoTOT_LT_ABASTECIDOS: TFloatField;
    qryAbastecimentoTOT_VL_ABASTECIDO: TFloatField;
    qryAbastecimentoMED_VL_MEDIO_POR_LITRO: TFloatField;
    qryAbastecimentoTOT_VL_IMPOSTO: TFloatField;
    qryAbastecimentoTOT_VL_ABASTECIDO_COM_IMPOSTO: TFloatField;
    RLLabel1: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Visualizar;
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation

{$R *.dfm}

uses dmConexao, uPeriodo;

procedure TfrmRelAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmRelAbastecimento);
end;

procedure TfrmRelAbastecimento.Visualizar;
var
  dtInicio, dtFim : Tdate;
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  with SystemTime do
    dtInicio := EncodeDate(wYear, wMonth, 1);
  dtFim := Date;

  if frmPeriodo.SelecionarPeriodo(@dtInicio, @dtFim) then
  begin
    frmRelAbastecimento := TfrmRelAbastecimento.Create(nil);
    with frmRelAbastecimento do
    begin
      qryAbastecimento.Close;
      qryAbastecimento.Params.ParamByName('DT_INICIO').AsDateTime  := dtInicio;
      qryAbastecimento.Params.ParamByName('DT_FIM').AsDateTime     := dtFim;
      qryAbastecimento.Open;
      frmRelAbastecimento.rltAbastecimentos.Preview();
    end;
  end;
end;

end.
