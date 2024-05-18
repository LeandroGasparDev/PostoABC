unit uFuncoes;

interface

uses
  System.SysUtils, Vcl.Mask,  ComObj, DB, Grids, DBGrids, Dialogs;

function LineBreak: string;
procedure dirCreate(const Dir: string);
procedure editMaskFormat(Sender: TObject);
procedure ExportarParaExcel(DBGrid: TDBGrid);

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

procedure ExportarParaExcel(DBGrid: TDBGrid);
var
  ExcelApp: Variant;
  Col, Row: Integer;
  SaveDialog: TSaveDialog;
  FloatValue: Double;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Filter := 'Arquivos Excel (*.xls)|*.xls|Todos arquivos (*.*)|*.*';
    if SaveDialog.Execute then
    begin
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := True;
      ExcelApp.Workbooks.Add;

      for Col := 0 to DBGrid.Columns.Count - 1 do
        ExcelApp.Cells[1, Col + 1].Value := DBGrid.Columns[Col].Title.Caption;

      for Row := 0 to DBGrid.DataSource.DataSet.RecordCount - 1 do
      begin
        DBGrid.DataSource.DataSet.RecNo := Row + 1;
        for Col := 0 to DBGrid.Columns.Count - 1 do
        begin
          if TryStrToFloat(DBGrid.Fields[Col].AsString, FloatValue) then
            ExcelApp.Cells[Row + 2, Col + 1].Value := FloatValue
          else
            ExcelApp.Cells[Row + 2, Col + 1].Value := DBGrid.Fields[Col].AsString;
        end;
      end;

      ExcelApp.ActiveWorkbook.SaveAs(SaveDialog.FileName);
    end;
  finally
    ExcelApp.Quit;
    SaveDialog.Free;
  end;
end;

end.
