unit uDosificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCalendar, cxCheckBox;

type
  TfDosificacion = class(TForm)
    dsDosificacion: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1llaveDosificacion: TcxGridDBColumn;
    cxGrid1DBTableView1fecha: TcxGridDBColumn;
    cxGrid1DBTableView1nroAutorizacion: TcxGridDBColumn;
    cxGrid1DBTableView1nroInicioFactura: TcxGridDBColumn;
    cxGrid1DBTableView1fechaLimiteEmision: TcxGridDBColumn;
    cxGrid1DBTableView1nombresucursal: TcxGridDBColumn;
    cxGrid1DBTableView1estado: TcxGridDBColumn;
    cxGrid1DBTableView1pieFactura: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDosificacion: TfDosificacion;

implementation

uses uModulo;

{$R *.dfm}

procedure TfDosificacion.FormShow(Sender: TObject);
begin
  modulo.qSucursal.Close;
  modulo.qSucursal.Open;

  modulo.qDosificacion.Close;
  modulo.qDosificacion.Open;
end;

end.
