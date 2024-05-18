unit uPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  PDate  = ^TDate;
  TfrmPeriodo = class(TForm)
    edInicio: TDateTimePicker;
    edFim: TDateTimePicker;
    Label1: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarPeriodo(dtInicio, dtFim: PDate): boolean;
  end;

var
  frmPeriodo: TfrmPeriodo;

implementation

{$R *.dfm}

{ TfrmPeriodo }

function TfrmPeriodo.SelecionarPeriodo(dtInicio, dtFim: PDate): boolean;
begin
  result := False;
  frmPeriodo := TfrmPeriodo.Create(nil);
  with frmPeriodo do
  begin
    edInicio.Date := dtInicio^;
    edFim.Date := dtFim^;
    showmodal;

    if modalresult = mrOk then
    begin
      result := True;
      dtInicio^ := edInicio.Date;
      dtFim^ := edFim.Date;
    end;
  end;
end;

end.
