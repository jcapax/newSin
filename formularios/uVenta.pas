unit uVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils,
  Dialogs, StdCtrls, DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, JvExStdCtrls, JvEdit, cxTextEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DBClient, ADODB, Buttons,
  ExtCtrls, Literal;

type
  TfVenta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eRazonSocial: TcxTextEdit;
    eNit: TEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsDetalleVenta: TClientDataSet;
    cdsDetalleVentacontador: TIntegerField;
    cdsDetalleVentaidProdcuto: TByteField;
    cdsDetalleVentaprecioUnitario: TCurrencyField;
    cdsDetalleVentacapacidad: TFloatField;
    cdsDetalleVentaiceUnitario: TCurrencyField;
    cdsDetalleVentaprecioTotal: TCurrencyField;
    cdsDetalleVentaiceTotal: TCurrencyField;
    cdsDetalleVentaiceAlicuota: TCurrencyField;
    dsDetalleVenta: TDataSource;
    dsSucursal: TDataSource;
    qSucursal: TADOQuery;
    qSucursalid: TAutoIncField;
    qSucursalnombreSucursal: TStringField;
    qSucursaldireccion: TStringField;
    qSucursaltipoProductos: TMemoField;
    qSucursalestado: TWordField;
    cSucursal: TDBLookupComboBox;
    qProducto: TADOQuery;
    cdsDetalleVentanombreProducto: TStringField;
    cxGrid1DBTableView1contador: TcxGridDBColumn;
    cxGrid1DBTableView1cantidad: TcxGridDBColumn;
    cxGrid1DBTableView1precioUnitario: TcxGridDBColumn;
    cxGrid1DBTableView1capacidad: TcxGridDBColumn;
    cxGrid1DBTableView1iceUnitario: TcxGridDBColumn;
    cxGrid1DBTableView1precioTotal: TcxGridDBColumn;
    cxGrid1DBTableView1iceTotal: TcxGridDBColumn;
    cxGrid1DBTableView1iceAlicuota: TcxGridDBColumn;
    cxGrid1DBTableView1nombreProducto: TcxGridDBColumn;
    bRegistrarVenta: TBitBtn;
    qDosificacionSucursal: TADOQuery;
    qDosificacionSucursalid: TAutoIncField;
    qDosificacionSucursalllaveDosificacion: TStringField;
    qDosificacionSucursalfecha: TDateField;
    qDosificacionSucursalidSucursal: TIntegerField;
    qDosificacionSucursalnroAutorizacion: TStringField;
    qDosificacionSucursalnroInicioFactura: TIntegerField;
    qDosificacionSucursalfechaLimiteEmision: TDateField;
    qDosificacionSucursalestado: TWordField;
    pQR: TPaintBox;
    eCodigoControl: TEdit;
    Label4: TLabel;
    qFactura: TADOQuery;
    qFacturaid: TAutoIncField;
    qFacturaidSucursal: TIntegerField;
    qFacturaespecificacion: TWordField;
    qFacturacorrelativoSucursal: TIntegerField;
    qFacturafechaFactura: TDateField;
    qFacturanroFactura: TLargeintField;
    qFacturanroAutorizacion: TStringField;
    qFacturaestado: TStringField;
    qFacturanit: TLargeintField;
    qFacturarazonSocial: TStringField;
    qFacturaimporteTotal: TBCDField;
    qFacturaimporteIce: TBCDField;
    qFacturaimporteExportaciones: TBCDField;
    qFacturaimporteVentasTasaCero: TBCDField;
    qFacturaimporteSubtotal: TBCDField;
    qFacturaimporteRebajas: TBCDField;
    qFacturaimporteBaseDebitoFiscal: TBCDField;
    qFacturadebitoFiscal: TBCDField;
    qFacturacodigoControl: TStringField;
    qFacturaidVenta: TIntegerField;
    qFacturafechaLimiteEmision: TDateField;
    qFacturacodigoQR: TBlobField;
    qRazonSocial: TADOQuery;
    qRazonSocialnit: TLargeintField;
    qRazonSocialrazonSocial: TStringField;
    Literal1: TLiteral;
    cdsDetalleVentacantidad: TFloatField;
    qProductoid: TAutoIncField;
    qProductoidProducto: TIntegerField;
    qProductonombreProducto: TStringField;
    qProductoidSucursal: TIntegerField;
    qProductoprecioUnitario: TFMTBCDField;
    qProductoice: TFMTBCDField;
    procedure FormShow(Sender: TObject);
    procedure cSucursalClick(Sender: TObject);
    procedure cdsDetalleVentaidProdcutoValidate(Sender: TField);
    procedure cdsDetalleVentaBeforePost(DataSet: TDataSet);
    procedure bRegistrarVentaClick(Sender: TObject);
    procedure detalleVenta(_idVenta: Integer);
    function codControl(_nit: string; _importeTotal: Currency): string;
    function nroFactura(_nroAutorizacion: Int64;
      _nroInicioFactura, _idSucursal: Integer): Integer;
    procedure pQRPaint(Sender: TObject);
    procedure generarQR(_cadena: string);
    procedure FormCreate(Sender: TObject);
    procedure imprimirFactura(_idVenta: Integer);
    procedure guardarQR(_idVenta: Integer);
    procedure eNitKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1Enter(Sender: TObject);
    procedure validarRegistros;
    procedure encontrarCliente;
    procedure eNitExit(Sender: TObject);
    procedure listaProductos(_idSucursal: SmallInt);
  private
    { Private declarations }
    _idProducto: Integer;
    _importeTotal: Currency;
    _importeIce: Currency;
    _iceAlicuotaTotal: Currency;

    _nroAutorizacion: Int64;
    _nroInicioFactura: Integer;

    _importeExportaciones: Currency;
    _importeVentastasaCero: Currency;

    QRCodeBitmap: TBitmap;
  public
    { Public declarations }
  end;

var
  fVenta: TfVenta;

implementation

uses uModulo, uComun, uCodigoControl, DelphiZXIngQRCode;
{$R *.dfm}

procedure tfVenta.listaProductos(_idSucursal: SmallInt);
//var _sql: string;
//  qProducto: TADOQuery;
begin
//  _sql := 'SELECT p.id, p.idProducto, r.nombreProducto, p.idSucursal, p.precioUnitario, r.ice FROM precioProducto p JOIN producto r ON p.idProducto = r.id WHERE p.estado = 1 AND p.idSucursal = :idSucursal';
//
//  qProducto := TADOQuery.Create(self);
//  qProducto.Connection := modulo.CNX;

end;

procedure TfVenta.encontrarCliente;
begin
    qRazonSocial.close;
    qRazonSocial.Parameters.ParamByName('nit').Value := eNit.Text;
    qRazonSocial.Open;

    if qRazonSocial.RecordCount <> 0 then
    begin
      eRazonSocial.Text := qRazonSocialrazonSocial.Value;
    end;

    eRazonSocial.SetFocus;
end;

procedure TfVenta.validarRegistros;
begin
  if eNit.Text = '' then
   begin
     Dialogs.MessageDlg('Registrar NIT o CI del comprador!!!', mtWarning, [mbOk], 0, mbOk);
     eNit.SetFocus;
     Abort;
   end;

  if eRazonSocial.Text = '' then
   begin
     Dialogs.MessageDlg('Registrar Razon Social del comprador!!!', mtWarning, [mbOk], 0, mbOk);
     eNit.SetFocus;
     Abort;
   end;


  if cdsDetalleVenta.RecordCount = 0 then
   begin
     Dialogs.MessageDlg('No esisten registro de productos!!!', mtWarning, [mbOk], 0, mbOk);
     Abort;
   end;
end;

procedure TfVenta.guardarQR(_idVenta: Integer);
Var
  Bitmap: TBitmap;
  Wid, Hei: Integer;
  _stream: TStream;
begin
  Wid := pQR.Width;
  Hei := pQR.Height;
  Bitmap := TBitmap.Create;
  Bitmap.Height := Hei;
  Bitmap.Width := Wid;
  Bitmap.Canvas.CopyRect(Rect(0, 0, Wid, Hei), pQR.Canvas,
    Rect(0, 0, Wid, Hei));
  // Bitmap.SaveToFile('d:\qr.bmp');
  _stream := TMemoryStream.Create;
  Bitmap.SaveToStream(_stream);

  qFactura.close;
  qFactura.Parameters.ParamByName('id').Value := _idVenta;
  qFactura.Open;

  // if qFactura.RecordCount <> 0 then
  // begin
  qFactura.Edit;
  qFacturacodigoQR.LoadFromStream(_stream);
  qFactura.Post;
  // end
  // else
  // begin
  // MessageDlg('error de factura', mtWarning, [mbYes, mbNo], 0);
  // Abort;
  // end;

  Bitmap.Free;
end;

procedure TfVenta.imprimirFactura(_idVenta: Integer);
var _aux:String;
 _decimal, _redondeado: Currency;
begin
   _redondeado := modulo.Redondear(_importeTotal, 2);

   literal1.Numero := trunc(_redondeado);
   _decimal         := frac(_redondeado)*100;
   if _decimal < 10 then
     _aux := 'SON: '+ Literal1.Literal+ ' con 0' + CurrToStr(_decimal)+'/100 Bolivianos'
   else
     _aux := 'SON: '+ Literal1.Literal+ ' con ' + CurrToStr(_decimal)+'/100 Bolivianos';

  guardarQR(_idVenta);

  modulo.qrFactura.close;
  modulo.qrFactura.Parameters.ParamByName('idVenta').Value := _idVenta;
  modulo.qrFactura.Open;

  // modulo.raveFasin.SelectReport('Factura', True);
  modulo.raveFasin.SetParam('totalLiteral', _aux);
  modulo.raveFasin.Execute;
end;

procedure TfVenta.generarQR(_cadena: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := _cadena;
    QRCode.Encoding := TQRCodeEncoding(0);
    QRCode.QuietZone := StrToIntDef('4', 4);
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
        end
        else
        begin
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
  pQR.Repaint;
end;

function TfVenta.nroFactura(_nroAutorizacion: Int64;
  _nroInicioFactura, _idSucursal: Integer): Integer;
var
  qNroFactura: TADOQuery;
  _nroFactura: Integer;
begin
  qNroFactura := TADOQuery.Create(nil);
  qNroFactura.Connection := modulo.CNX;
  qNroFactura.SQL.Add('SELECT nroFactura FROM factura');
  qNroFactura.SQL.Add(
    'WHERE nroAutorizacion = :nroAut AND idSucursal = :idSucursal');
  qNroFactura.SQL.Add('ORDER BY nroFactura DESC LIMIT 1');
  qNroFactura.Parameters.ParamByName('idSucursal').Value := _idSucursal;
  qNroFactura.Parameters.ParamByName('nroAut').Value := _nroAutorizacion;
  qNroFactura.Open;

  if qNroFactura.RecordCount <> 0 then
  begin
    _nroFactura := qNroFactura.FieldByName('nroFactura').Value;
    _nroFactura := _nroFactura + 1;
  end
  else
    _nroFactura := _nroInicioFactura;

  qNroFactura.Free;

  result := _nroFactura;
end;

procedure TfVenta.pQRPaint(Sender: TObject);
var
  Scale: Double;
begin
  pQR.Canvas.Brush.Color := clWhite;
  pQR.Canvas.FillRect(Rect(0, 0, pQR.Width, pQR.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (pQR.Width < pQR.Height) then
    begin
      Scale := pQR.Width / QRCodeBitmap.Width;
    end
    else
    begin
      Scale := pQR.Height / QRCodeBitmap.Height;
    end;
    pQR.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width),
        Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

function TfVenta.codControl(_nit: string; _importeTotal: Currency): string;
var
  _codControl, _llaveDosif, _codPuro, _fechaFactura: string;

  _nroFactura: Integer;
  codCont: TCodigoControl;

  _dia, _mes, _anno: string;
begin

  _nroAutorizacion := StrToInt64(qDosificacionSucursalnroAutorizacion.Value);

  _nroFactura := nroFactura(_nroAutorizacion,
    qDosificacionSucursalnroInicioFactura.Value, cSucursal.KeyValue);

  _dia := inttostr(DayOf(date));
  if Length(_dia) = 1 then
    _dia := '0' + _dia;

  _mes := inttostr(MonthOf(date));
  if Length(_mes) = 1 then
    _mes := '0' + _mes;

  _fechaFactura := inttostr(YearOf(date)) + _mes + _dia;

  _llaveDosif := qDosificacionSucursalllaveDosificacion.Value;

  codCont := TCodigoControl.Create(inttostr(_nroAutorizacion),
    inttostr(_nroFactura), _nit, _fechaFactura,
    inttostr(modulo.aCero(_importeTotal)), _llaveDosif);

  _codPuro := codCont.f_codigoControlPuro();

  result := codCont.f_codigoControlImpresion(_codPuro);
end;

procedure TfVenta.detalleVenta(_idVenta: Integer);
var
  _comun: TAtisbador;
  _idProducto: Byte;
  _cantidad: Real;
  _precioUnit, _iceUnit, _precioTot, _iceTot, _iceAlic: Currency;
begin
  _importeTotal := 0;
  _importeIce := 0;
  _iceAlicuotaTotal := 0;

  cdsDetalleVenta.First;
  while not cdsDetalleVenta.Eof do
  begin
    _idProducto := cdsDetalleVentaidProdcuto.Value;
    _cantidad := cdsDetalleVentacantidad.Value;
    _iceUnit := cdsDetalleVentaiceUnitario.Value;
    _precioTot := cdsDetalleVentaprecioTotal.Value;
    _iceTot := cdsDetalleVentaiceTotal.Value;

    if _iceTot = 0 then
      _iceAlic := 0
    else
      _iceAlic := cdsDetalleVentaiceAlicuota.Value;

    // _precioUnit := cdsDetalleVentaprecioUnitario.Value - _iceAlic;
    _precioUnit := (_precioTot - _iceTot - _iceAlic) / _cantidad;

    _importeTotal := _importeTotal + _precioTot;
    _importeIce := _importeIce + _iceTot;
    _iceAlicuotaTotal := _iceAlicuotaTotal + _iceAlic;

    _comun.registrarDetalleVenta(_idVenta, _idProducto, _cantidad, _precioUnit,
      _iceUnit, _precioTot, _iceTot, _iceAlic);

    cdsDetalleVenta.Next;
  end;

end;

procedure TfVenta.eNitExit(Sender: TObject);
begin
  if Length(eNit.Text) <> 0  then
    begin
      qRazonSocial.close;
      qRazonSocial.Parameters.ParamByName('nit').Value := eNit.Text;
      qRazonSocial.Open;

      if qRazonSocial.RecordCount <> 0 then
      begin
        eRazonSocial.Text := qRazonSocialrazonSocial.Value;
      end;

      eRazonSocial.SetFocus;
    end;
end;

procedure TfVenta.eNitKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    encontrarCliente;
end;



procedure TfVenta.bRegistrarVentaClick(Sender: TObject);
var
  _idVenta: Integer;
  _comun: TAtisbador;
  _razonSocial, _codigoControl: string;
  _nroFactura: Integer;
  _importeNeto, _debitoFiscal: Currency;
  _nit: LongInt;

  _idSucursal: Integer;

  _especificacion: Byte;
  _correlativoSucursal: Integer;
  _fechaFactura: TDate;

  _estado: string;

  _importeRebajas: Currency;
  _importeSubtotal: Currency;
  _importeBaseDebitoFiscal: Currency;

  _cadenaQr, _cadenaQr1, _cadenaQr2, _cadenaQr3: string;

begin
  validarRegistros();

  bRegistrarVenta.Enabled := false;

  _nit := 0;
  _razonSocial := '';

  _idSucursal := cSucursal.KeyValue;

  // Modulo.parametrosFactura();

  _nit         :=  StrToInt64(eNit.Text);
  _razonSocial := eRazonSocial.Text;

  _idVenta := _comun.nroVenta(_idSucursal);
  _comun.registrarVenta(_idVenta, _idSucursal, 1, '');
  detalleVenta(_idVenta);

  _codigoControl := codControl(eNit.Text, _importeTotal);
  // _importeNeto   := _importeTotal - _importeIce - _iceAlicuotaTotal;

  _nroFactura := nroFactura(_nroAutorizacion, _nroInicioFactura,
    cSucursal.KeyValue);

  //
  _especificacion        := 3;
  _correlativoSucursal   := 1;
  _fechaFactura          := date;
  _estado                := 'V';
  _importeRebajas        := 0;
  _importeExportaciones  := 0;
  _importeVentastasaCero := 0;

  _importeSubtotal := _importeTotal - _importeIce - _importeExportaciones -
    _importeVentastasaCero;

  _importeBaseDebitoFiscal := _importeSubtotal - _importeRebajas -
    _iceAlicuotaTotal;

  _debitoFiscal := _importeBaseDebitoFiscal * 0.13;
  //

  _comun.registarFactura(_idSucursal, _especificacion, _correlativoSucursal,
    _fechaFactura, _nroFactura, _nroAutorizacion, _estado, eNit.Text, _razonSocial,
    _importeTotal, _importeIce, _importeExportaciones, _importeVentastasaCero,
    _importeSubtotal, _importeRebajas, _importeBaseDebitoFiscal, _debitoFiscal,
    _codigoControl, _idVenta, qDosificacionSucursalfechaLimiteEmision.Value, cSucursal.KeyValue);

  eCodigoControl.Text := _codigoControl;

  _cadenaQr1 := '1016257022' + '|' + inttostr(_nroFactura) + '|' + inttostr
    (_nroAutorizacion) + '|' + DateToStr(_fechaFactura) + '|';
  _cadenaQr2 := CurrToStr(_importeTotal) + '|' + CurrToStr
    (_importeBaseDebitoFiscal) + '|' + _codigoControl + '|';
  _cadenaQr3 := eNit.Text + '|' + CurrToStr(_importeIce) + '|' + CurrToStr
    (_importeVentastasaCero) + '|' + '0' + '|' + CurrToStr(_importeRebajas);

  _cadenaQr := _cadenaQr1 + _cadenaQr2 + _cadenaQr3;

  generarQR(_cadenaQr);

  imprimirFactura(_idVenta);

  bRegistrarVenta.Enabled := true;

  eNit.Text := '';
  eRazonSocial.Text := '';
  cdsDetalleVenta.EmptyDataSet;
  eNit.SetFocus;
end;

procedure TfVenta.cdsDetalleVentaBeforePost(DataSet: TDataSet);
//var _pUnit: Currency;
begin
//  _pUnit := qProductoprecioUnitario.Value;
  cdsDetalleVentaprecioTotal.Value := qProductoprecioUnitario.AsFloat * cdsDetalleVentacantidad.Value;
  cdsDetalleVentaiceTotal.Value    := cdsDetalleVentacantidad.Value * qProductoice.AsFloat;
  cdsDetalleVentaiceAlicuota.Value := ((cdsDetalleVentaprecioTotal.Value - cdsDetalleVentaiceTotal.Value)* 0.87) * 0.01; ;

end;

procedure TfVenta.cdsDetalleVentaidProdcutoValidate(Sender: TField);
begin

  qProducto.First;
  while not qProducto.Eof do
  begin
    if qProductoidProducto.Value = cdsDetalleVentaidProdcuto.Value then
    begin
      _idProducto                         := qProductoidProducto.Value;
      cdsDetalleVentaprecioUnitario.Value := qProductoprecioUnitario.AsFloat;
      cdsDetalleVentaiceUnitario.Value    := qProductoice.AsFloat;
      Exit;
    end;
    qProducto.Next;
  end;
end;

procedure TfVenta.cSucursalClick(Sender: TObject);
begin
  qProducto.close;
  qProducto.Parameters.ParamByName('idSucursal').Value := cSucursal.KeyValue;
  qProducto.Open;

  qDosificacionSucursal.close;
  qDosificacionSucursal.Parameters.ParamByName('idSucursal').Value :=
    cSucursal.KeyValue;
  qDosificacionSucursal.Open;

  _nroAutorizacion  := StrToInt64(qDosificacionSucursalnroAutorizacion.Value);
  _nroInicioFactura := qDosificacionSucursalnroInicioFactura.Value;
end;

procedure TfVenta.cxGrid1Enter(Sender: TObject);
begin
  if cdsDetalleVenta.RecordCount = 0 then
    cdsDetalleVenta.Insert
  else
      cdsDetalleVenta.First;
end;

procedure TfVenta.FormCreate(Sender: TObject);
begin
  QRCodeBitmap := TBitmap.Create;
end;

procedure TfVenta.FormShow(Sender: TObject);
begin
  qSucursal.close;
  qSucursal.Open;
end;

end.
