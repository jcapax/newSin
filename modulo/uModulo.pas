unit uModulo;

interface

uses
  SysUtils, Classes, DB, DBTables, ADODB, RpBase, RpSystem, RpDefine, RpRave,
  RpCon, RpConDS;

type
  Tmodulo = class(TDataModule)
    CNX: TADOConnection;
    qSucursal: TADOQuery;
    qSucursalid: TAutoIncField;
    qSucursalnombreSucursal: TStringField;
    qSucursaldireccion: TStringField;
    qSucursaltipoProductos: TMemoField;
    qSucursalestado: TWordField;
    qProducto: TADOQuery;
    qProductoid: TAutoIncField;
    qProductonombreProducto: TStringField;
    qProductoidUnidadMedida: TIntegerField;
    qProductocapacidad: TFloatField;
    qProductoICE: TFloatField;
    qUnidadMedida: TADOQuery;
    qUnidadMedidaid: TAutoIncField;
    qUnidadMedidanombreUnidadMedida: TStringField;
    qUnidadMedidasimbolo: TStringField;
    qProductounidad: TStringField;
    qPrecioProducto: TADOQuery;
    qPrecioProductoid: TAutoIncField;
    qPrecioProductoidProducto: TIntegerField;
    qPrecioProductoidSucursal: TIntegerField;
    qPrecioProductoprecioUnitario: TBCDField;
    qPrecioProductoestado: TWordField;
    qPrecioProductonombreSucursal: TStringField;
    qPrecioProductonombreProducto: TStringField;
    qDosificacion: TADOQuery;
    qDosificacionid: TAutoIncField;
    qDosificacionllaveDosificacion: TStringField;
    qDosificacionfecha: TDateField;
    qDosificacionidSucursal: TIntegerField;
    qDosificacionnroAutorizacion: TStringField;
    qDosificacionnroInicioFactura: TIntegerField;
    qDosificacionfechaLimiteEmision: TDateField;
    qDosificacionnombresucursal: TStringField;
    qDosificacionestado: TWordField;
    raveFasin: TRvProject;
    RvSystem1: TRvSystem;
    qrFactura: TADOQuery;
    qrFacturaidVenta_: TIntegerField;
    qrFacturaidCaja: TIntegerField;
    qrFacturausuario: TStringField;
    qrFacturafechaHora: TDateTimeField;
    qrFacturaidFactura: TAutoIncField;
    qrFacturaidSucursal: TIntegerField;
    qrFacturaespecificacion: TWordField;
    qrFacturacorrelativoSucursal: TIntegerField;
    qrFacturafechaFactura: TDateField;
    qrFacturanroFactura: TLargeintField;
    qrFacturanroAutorizacion: TStringField;
    qrFacturaestado: TStringField;
    qrFacturanit: TLargeintField;
    qrFacturarazonSocial: TStringField;
    qrFacturaimporteTotal: TBCDField;
    qrFacturaimporteIce: TBCDField;
    qrFacturaimporteExportaciones: TBCDField;
    qrFacturaimporteVentasTasaCero: TBCDField;
    qrFacturaimporteSubtotal: TBCDField;
    qrFacturaimporteRebajas: TBCDField;
    qrFacturaimporteBaseDebitoFiscal: TBCDField;
    qrFacturadebitoFiscal: TBCDField;
    qrFacturacodigoControl: TStringField;
    qrFacturaidVenta: TIntegerField;
    qrFacturafechaLimiteEmision: TDateField;
    qrFacturaidproducto: TIntegerField;
    qrFacturanombreProducto: TStringField;
    qrFacturasimbolo: TStringField;
    qrFacturacapacidad: TFloatField;
    qrFacturacantidad: TBCDField;
    qrFacturaprecioUnitario: TBCDField;
    qrFacturaiceUnitario: TBCDField;
    qrFacturaprecioTotal: TBCDField;
    qrFacturaiceTotal: TBCDField;
    qrFacturaalicuota: TBCDField;
    rdsFactura: TRvDataSetConnection;
    qrFacturacodigoQR: TBlobField;
    qrFacturaunitarioCalculado: TBCDField;
    function aCero(Numero: Currency): integer;
    function Redondear (Numero : Double; PrecisionDec : byte): double;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  modulo: Tmodulo;

implementation

{$R *.dfm}

function TModulo.Redondear (Numero : Double; PrecisionDec : byte): double;
  function Potencia(Base : Double; Exponente : byte) : Double;
  begin
    Result := Exp(Exponente * ln(Base));
  end;
begin
  result := Round(Numero * Potencia(10, PrecisionDec)) / Potencia (10, PrecisionDec);
end;


function Tmodulo.aCero(Numero: Currency): integer;
var
  _frac: real;
  _res: integer;
begin
  _frac := Frac(Numero);

  if _frac >= 0.5 then
    _res := Trunc(Numero) + 1
  else
    _res := Trunc(Numero);

  Result := _res;
end;

end.
