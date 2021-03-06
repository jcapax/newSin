unit uPrecioVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCheckBox;

type
  TfPrecioProducto = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dsPrecioVenta: TDataSource;
    cxGrid1DBTableView1precioUnitario: TcxGridDBColumn;
    cxGrid1DBTableView1estado: TcxGridDBColumn;
    cxGrid1DBTableView1nombreSucursal: TcxGridDBColumn;
    cxGrid1DBTableView1nombreProducto: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrecioProducto: TfPrecioProducto;

implementation

uses uModulo;

{$R *.dfm}

procedure TfPrecioProducto.FormShow(Sender: TObject);
begin
  modulo.qProducto.Close;
  modulo.qProducto.Open;

  modulo.qSucursal.Close;
  modulo.qSucursal.Open;

  modulo.qPrecioProducto.Close;
  modulo.qPrecioProducto.Open;
end;

end.
