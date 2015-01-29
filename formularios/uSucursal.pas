unit uSucursal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinsDefaultPainters, cxCheckBox, cxDBEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfSucursal = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsSucursal: TDataSource;
    cxGrid1DBTableView1nombreSucursal: TcxGridDBColumn;
    cxGrid1DBTableView1direccion: TcxGridDBColumn;
    cxGrid1DBTableView1tipoProductos: TcxGridDBColumn;
    cxGrid1DBTableView1estado: TcxGridDBColumn;
    cxGrid1DBTableView1lugarSucursal: TcxGridDBColumn;
    cxGrid1DBTableView1actividadEconomica: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSucursal: TfSucursal;

implementation

uses uModulo;

{$R *.dfm}

procedure TfSucursal.FormShow(Sender: TObject);
begin
  modulo.qSucursal.Close;
  modulo.qSucursal.Open;
end;

end.
