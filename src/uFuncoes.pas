unit uFuncoes;

interface

uses
  System.SysUtils, Vcl.Mask;

function LineBreak: string;
procedure dirCreate(const Dir: string);
procedure editMaskFormat(Sender: TObject);

implementation


function LineBreak: string;
begin
  Result := #13#10;
end;


procedure dirCreate(const Dir: string);
begin
  if not DirectoryExists(Dir) then
    ForceDirectories(Dir)
end;

procedure editMaskFormat(Sender: TObject);
var
  valor: Double;
begin
  if Sender is TMaskEdit then
  begin
    if not Trim(TMaskEdit(Sender).Text).IsEmpty then
    begin
      if TryStrToFloat(TMaskEdit(Sender).Text, valor) then
        TMaskEdit(Sender).Text := FormatFloat('0.00', valor)
      else
        TMaskEdit(Sender).Text := '0,00';
    end;
  end;
end;


end.
