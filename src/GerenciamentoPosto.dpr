program GerenciamentoPosto;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  dmConexao in 'dmConexao.pas' {dm: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  dbUpdates in 'dbUpdates.pas',
  uAbastecimentoLista in 'uAbastecimentoLista.pas' {frmAbastecimentoLista},
  uAbastecimentoCad in 'uAbastecimentoCad.pas' {frmAbastecimentoCad},
  uRelAbastecimento in 'uRelAbastecimento.pas' {frmRelAbastecimento},
  uPeriodo in 'uPeriodo.pas' {frmPeriodo},
  uTanqueCad in 'uTanqueCad.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelAbastecimento, frmRelAbastecimento);
  Application.CreateForm(TfrmPeriodo, frmPeriodo);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
