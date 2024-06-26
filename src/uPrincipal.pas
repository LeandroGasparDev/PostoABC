unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Lanamentos1: TMenuItem;
    Sair1: TMenuItem;
    Abastecimento1: TMenuItem;
    Relatrios1: TMenuItem;
    Lista1: TMenuItem;
    Abastecimento2: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure Lista1Click(Sender: TObject);
    procedure Abastecimento2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uAbastecimentoCad, uAbastecimentoLista, uRelAbastecimento;

procedure TfrmPrincipal.Abastecimento1Click(Sender: TObject);
begin
  frmAbastecimentoCad := TfrmAbastecimentoCad.Create(nil);
  frmAbastecimentoCad.ShowModal;
  FreeAndNil(frmAbastecimentoCad);
end;

procedure TfrmPrincipal.Abastecimento2Click(Sender: TObject);
begin
  frmRelAbastecimento.Visualizar;
end;

procedure TfrmPrincipal.Lista1Click(Sender: TObject);
begin
  frmAbastecimentoLista := TfrmAbastecimentoLista.Create(nil);
  frmAbastecimentoLista.ShowModal;
  FreeAndNil(frmAbastecimentoLista);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
