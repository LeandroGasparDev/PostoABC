unit uAbastecimentoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TfrmAbastecimentoCad = class(TForm)
    edtData: TDateTimePicker;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Bevel1: TBevel;
    edtQtdeLitros: TMaskEdit;
    edtVLTotal: TMaskEdit;
    lblImposto: TLabel;
    cbNovoAbastecimento: TCheckBox;
    qryBomba: TFDQuery;
    qryBombaBOMBAID: TIntegerField;
    qryBombaDS_BOMBA: TStringField;
    dtsBomba: TDataSource;
    gridBomba: TDBGrid;
    Bevel2: TBevel;
    qryBombaCOMBUSTIVEL: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeLitrosExit(Sender: TObject);
  private
    { Private declarations }
    procedure InsertAbastecimento(DT_ABASTECIMENTO: TDateTime; LT_ABASTECIDOS, VL_ABASTECIDO, PE_IMPOSTO: Double; BOMBAID: Integer);
    procedure ClearForm;
    function ValidaCampos: Boolean;
    procedure CodigoFormularioShow;
  public
    { Public declarations }
  end;

var
  frmAbastecimentoCad: TfrmAbastecimentoCad;

implementation

{$R *.dfm}

uses dmConexao, uFuncoes;

{ TfrmAbastecimentoCad }

procedure TfrmAbastecimentoCad.InsertAbastecimento(DT_ABASTECIMENTO: TDateTime; LT_ABASTECIDOS, VL_ABASTECIDO, PE_IMPOSTO: Double; BOMBAID: Integer);
begin
  with dm.qry do
  begin
    try
      Close;
      SQL.Text := 'EXECUTE PROCEDURE INSERT_ABASTECIMENTO(:DT_ABASTECIMENTO, :LT_ABASTECIDOS, :VL_ABASTECIDO, :PE_IMPOSTO, :BOMBAID)';

      ParamByName('DT_ABASTECIMENTO').AsDateTime    := DT_ABASTECIMENTO;
      ParamByName('LT_ABASTECIDOS').AsFloat         := LT_ABASTECIDOS;
      ParamByName('VL_ABASTECIDO').AsFloat          := VL_ABASTECIDO;
      ParamByName('PE_IMPOSTO').AsFloat             := PE_IMPOSTO;
      ParamByName('BOMBAID').AsInteger              := qryBombaBOMBAID.AsInteger;
      ExecSql;

      ShowMessage('Abastecimento lanšado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Ocorreu um erro no Lanšamento do Abastecimento: ' + E.Message);
      end;
  end;
end;

function TfrmAbastecimentoCad.ValidaCampos: Boolean;
begin
  Result := True;
  if StrToFloatDef(edtQtdeLitros.Text,0) = 0 then
  begin
    ShowMessage('Informe a Quantidade de Litros do abastecimento');
    Result := False;
    edtQtdeLitros.SetFocus;
  end;

  if StrToFloatDef(edtVLTotal.Text,0) = 0 then
  begin
    ShowMessage('Informe o R$ Total do abastecimento');
    Result := False;
    edtVLTotal.SetFocus;
  end;
end;

procedure TfrmAbastecimentoCad.btnSalvarClick(Sender: TObject);
begin
  if ValidaCampos then
    InsertAbastecimento(edtData.Date,
                        StrToFloatDef(edtQtdeLitros.Text,0),
                        StrToFloatDef(edtVLTotal.Text,0),
                        dm.pABASTECIMENTO_PE_IMPOSTO,
                        qryBombaBOMBAID.AsInteger);

   if not cbNovoAbastecimento.Checked then
     Close
   else
     ClearForm;
end;

procedure TfrmAbastecimentoCad.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimentoCad.ClearForm;
begin
  edtData.Date := Date;
  edtQtdeLitros.Clear;
  edtVLTotal.Clear;

  edtQtdeLitros.SetFocus;
end;

procedure TfrmAbastecimentoCad.CodigoFormularioShow;
begin
  ClearForm;
  lblImposto.Caption := FloatToStr(dm.pABASTECIMENTO_PE_IMPOSTO)+'%';
  qryBomba.Open;
end;

procedure TfrmAbastecimentoCad.edtDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      SelectNext(ActiveControl, True, True);
      Key := 0;
    end;

    VK_ESCAPE:
    begin
      SelectNext(ActiveControl, False, True);
      Key := 0;
    end;
  end;
end;

procedure TfrmAbastecimentoCad.edtQtdeLitrosExit(Sender: TObject);
begin
  editMaskFormat(Sender);
end;

procedure TfrmAbastecimentoCad.FormShow(Sender: TObject);
begin
  CodigoFormularioShow;
end;

end.
