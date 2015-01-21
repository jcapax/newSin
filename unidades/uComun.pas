unit uComun;

interface

uses idHashMessageDigest, ADODB, DB, Windows, SysUtils;

type
  TAtisbador = class
    private
    public
      function hashear(_sinCodificar: string): string;
      procedure registrarUsuario(_login, _contrasena, _nombreCompleto: string; _nivel: Byte);
      procedure registroDosificacion(_llaveDosificacion: string; _fecha, _fechaLimite: TDate; _nroAutorizacion, _nroInicioFactura: Int64);
      function validarUsuario(_login, _contrasena: string): Boolean;
      function nroVenta(_idSucursal: Integer): Integer;
      procedure registrarVenta(_idVenta, _idSucursal, _idCaja: Integer; _usuario: string);
      procedure registrarDetalleVenta(_idVenta, _idProducto, _cantidad: integer; _precioUnitario, _iceUnitario, _precioTotal, _iceTotal, _iceAlicuota: Currency);
      procedure registarFactura(_idSucursal: Integer; _especificacion: Byte; _correlativoSucursal: Integer;
                                _fechaFactura: TDate; _nroFactura, _nroAutorizacion: Int64; _estado: string;
                                _nit: Int64; _razonSocial: string;
                                _importeTotal, _importeIce, _importeExportaciones,
                                _importeVentastasaCero, _importeSubtotal, _importeRebajas,
                                _importeBaseDebitoFiscal, _debitoFiscal: Currency;
                                _codigoControl: string;
                                _idVenta: Integer;
                                _fechaLimiteEmision: TDate);
  end;

implementation

uses uModulo;

procedure TAtisbador.registarFactura(_idSucursal: Integer; _especificacion: Byte; _correlativoSucursal: Integer;
                                _fechaFactura: TDate; _nroFactura, _nroAutorizacion: Int64; _estado: string;
                                _nit: Int64; _razonSocial: string;
                                _importeTotal, _importeIce, _importeExportaciones,
                                _importeVentastasaCero, _importeSubtotal, _importeRebajas,
                                _importeBaseDebitoFiscal, _debitoFiscal: Currency;
                                _codigoControl: string;
                                _idVenta: Integer;
                                _fechaLimiteEmision: TDate);
var qConsulta: TADOQuery;
  _sqlIns_a, _sqlVal_a, _sqlIns_b, _sqlVal_b, _sql: string;
begin
  _sqlIns_a := 'INSERT INTO factura(idSucursal, especificacion, correlativoSucursal, fechaFactura, nroFactura, nroAutorizacion, estado, nit, razonSocial, ';
  _sqlIns_b := 'importeTotal, importeIce, importeExportaciones, importeVentasTasaCero, importeSubtotal, importeRebajas, importeBaseDebitoFiscal, debitoFiscal, codigoControl, idVenta, fechaLimiteEmision)';

  _sqlVal_a := 'VALUES(:idSucursal, :especificacion, :correlativoSucursal, :fechaFactura, :nroFactura, :nroAutorizacion, :estado, :nit, :razonSocial, :importeTotal, ';
  _sqlVal_b := ':importeIce, :importeExportaciones, :importeVentasTasaCero, :importeSubtotal, :importeRebajas, :importeBaseDebitoFiscal, :debitoFiscal, :codigoControl, :idVenta, :fechaLimiteEmision)';

  _sql := _sqlIns_a+_sqlIns_b + ' ' + _sqlVal_a+_sqlVal_b;
  qConsulta := TADOQuery.Create(nil);
  qConsulta.Connection := Modulo.CNX;
  qConsulta.SQL.Add(_sql);

  qConsulta.Parameters.ParamByName('idSucursal').Value              := _idSucursal;
  qConsulta.Parameters.ParamByName('especificacion').Value          := _especificacion;
  qConsulta.Parameters.ParamByName('correlativoSucursal').Value     := _correlativoSucursal;
  qConsulta.Parameters.ParamByName('fechaFactura').DataType         := ftDate;
  qConsulta.Parameters.ParamByName('fechaFactura').Value            := _fechaFactura;
  qConsulta.Parameters.ParamByName('nroFactura').Value              := _nroFactura;
  qConsulta.Parameters.ParamByName('nroAutorizacion').Value         := _nroAutorizacion;
  qConsulta.Parameters.ParamByName('estado').Value                  := _estado;
  qConsulta.Parameters.ParamByName('nit').Value                     := _nit;
  qConsulta.Parameters.ParamByName('razonSocial').Value             := _razonSocial;
  qConsulta.Parameters.ParamByName('importeTotal').Value            := _importeTotal;
  qConsulta.Parameters.ParamByName('importeIce').Value              := _importeIce;
  qConsulta.Parameters.ParamByName('importeExportaciones').Value    := _importeExportaciones;
  qConsulta.Parameters.ParamByName('importeVentasTasaCero').Value   := _importeVentastasaCero;
  qConsulta.Parameters.ParamByName('importeSubtotal').Value         := _importeSubtotal;
  qConsulta.Parameters.ParamByName('importeRebajas').Value          := _importeRebajas;
  qConsulta.Parameters.ParamByName('importeBaseDebitoFiscal').Value := _importeBaseDebitoFiscal;
  qConsulta.Parameters.ParamByName('debitoFiscal').Value            := _debitoFiscal;
  qConsulta.Parameters.ParamByName('codigoControl').Value           := _codigoControl;
  qConsulta.Parameters.ParamByName('idVenta').Value                 := _idVenta;
  qConsulta.Parameters.ParamByName('fechaLimiteEmision').DataType   := ftDate;
  qConsulta.Parameters.ParamByName('fechaLimiteEmision').Value      := _fechaLimiteEmision;

  qConsulta.ExecSQL;
  qConsulta.Free;
end;

procedure TAtisbador.registrarVenta(_idVenta, _idSucursal, _idCaja: Integer; _usuario: string);
var qConsulta: TAdoQuery;
  _sql: string;
begin
  _sql := 'INSERT INTO venta(id, idCaja, idSucursal, usuario, fechaHora) VALUES(:id, :idCaja, :idSucursal, :usuario, now())';
  qConsulta := TAdoQuery.Create(nil);
  qConsulta.Connection := Modulo.CNX;
  qConsulta.SQL.Add(_sql);
  qConsulta.Parameters.ParamByName('id').Value         := _idVenta;
  qConsulta.Parameters.ParamByName('idCaja').Value     := _idCaja;
  qConsulta.Parameters.ParamByName('idSucursal').Value := _idSucursal;
  qConsulta.Parameters.ParamByName('usuario').Value    := _usuario;
  qConsulta.ExecSQL;
  qConsulta.Free;
end;

procedure TAtisbador.registrarDetalleVenta(_idVenta, _idProducto, _cantidad: integer; _precioUnitario, _iceUnitario, _precioTotal, _iceTotal, _iceAlicuota: Currency);
var qConsulta: TAdoQuery;
  _sql: string;
begin
  _sql := 'INSERT INTO detalleVenta(idVenta, idProducto, cantidad, precioUnitario, iceUnitario, precioTotal, iceTotal, alicuota) VALUES(:idVenta, :idProducto, :cantidad, :precioUnitario, :iceUnitario, :precioTotal, :iceTotal, :iceAlicuota)';
  qConsulta := TAdoQuery.Create(nil);
  qConsulta.Connection := Modulo.CNX;
  qConsulta.SQL.Add(_sql);
//  qConsulta.ParamByName('idVenta').DataType        := ftInteger;
  qConsulta.Parameters.ParamByName('idVenta').Value           := _idVenta;
//  qConsulta.ParamByName('idProducto').DataType     := ftInteger;
  qConsulta.Parameters.ParamByName('idProducto').Value        := _idProducto;
//  qConsulta.ParamByName('cantidad').DataType       := ftInteger;
  qConsulta.Parameters.ParamByName('cantidad').Value          := _cantidad;
//  qConsulta.ParamByName('precioUnitario').DataType := ftCurrency;
  qConsulta.Parameters.ParamByName('precioUnitario').Value    := _precioUnitario;
//  qConsulta.ParamByName('iceUnitario').DataType    := ftCurrency;
  qConsulta.Parameters.ParamByName('iceUnitario').Value       := _iceUnitario;
//  qConsulta.ParamByName('precioTotal').DataType    := ftCurrency;
  qConsulta.Parameters.ParamByName('precioTotal').Value       := _precioTotal;
//  qConsulta.ParamByName('iceTotal').DataType       := ftCurrency;
  qConsulta.Parameters.ParamByName('iceTotal').Value          := _iceTotal;
//  qConsulta.ParamByName('iceAlicuota').DataType    := ftCurrency;
  qConsulta.Parameters.ParamByName('iceAlicuota').Value       := _iceAlicuota;
  qConsulta.ExecSQL;

  qConsulta.Free;
end;


function TAtisbador.nroVenta(_idSucursal:Integer): Integer;
var qConsulta: TAdoQuery;
  _sql: string;
  _cont: Integer;
begin
  _cont := 0;
  _sql := 'SELECT id FROM venta WHERE idSucursal = '+ IntToStr(_idSucursal) +' ORDER BY id DESC';
  qConsulta := TAdoQuery.Create(nil);
  qConsulta.Connection := Modulo.CNX;
  qConsulta.SQL.Add(_sql);
  qConsulta.Open;
  if qConsulta.RecordCount <> 0 then
    _cont := qConsulta.FieldByName('id').Value + 1
  else
    _cont := 1;

  qConsulta.Free;
  Result := _cont;
end;

procedure TAtisbador.registroDosificacion(_llaveDosificacion: string; _fecha, _fechaLimite: TDate; _nroAutorizacion, _nroInicioFactura: Int64);
//var qConsulta: TIBQuery;
//  _sql: string;
begin
//  _sql := 'INSERT INTO dosificacion(llaveDosificacion, fecha, fechaLimiteEmision, nroAutorizacion, nroInicioFactura) VALUES(:llaveDosificacion, :fecha, :fechaLimiteEmision, :nroAutorizacion, :nroInicioFactura)';
//  qConsulta := TIBQuery.Create(nil);
//  qConsulta.Database := Modulo.cPrincipal;
//  qConsulta.SQL.Add(_sql);
//  qConsulta.ParamByName('llaveDosificacion').Value    := _llaveDosificacion;
//  qConsulta.ParamByName('fecha').DataType             := ftDate;
//  qConsulta.ParamByName('fecha').Value                := _fecha;
//  qConsulta.ParamByName('fechaLimiteEmision').DataType:= ftDate;
//  qConsulta.ParamByName('fechaLimiteEmision').Value   := _fechaLimite;
//  qConsulta.ParamByName('nroAutorizacion').DataType   := ftLargeint;
//  qConsulta.ParamByName('nroAutorizacion').Value      := _nroAutorizacion;
//  qConsulta.ParamByName('nroInicioFactura').DataType  := ftInteger;
//  qConsulta.ParamByName('nroInicioFactura').Value     := _nroInicioFactura;
//  qConsulta.ExecSQL;
//  qConsulta.Transaction.Commit;
//  qConsulta.Free;

end;


procedure TAtisbador.registrarUsuario(_login, _contrasena, _nombreCompleto: string; _nivel: Byte);
//var qConsulta: TIBQuery;
//  _sql: string;
begin
//  _sql := 'INSERT INTO usuario(login, contrasena, nombreCompleto, nivel) VALUES(:login, :contrasena, :nombreCompleto, :nivel)';
//  qConsulta := TIBQuery.Create(nil);
//  qConsulta.Database := Modulo.cPrincipal;
//  qConsulta.SQL.Add(_sql);
//  qConsulta.ParamByName('login').Value          := _login;
//  qConsulta.ParamByName('contrasena').Value     := hashear(_contrasena);
//  qConsulta.ParamByName('nombreCompleto').Value := _nombreCompleto;
//  qConsulta.ParamByName('nivel').DataType       := ftInteger;
//  qConsulta.ParamByName('nivel').Value          := _nivel;
//  qConsulta.ExecSQL;
//  qConsulta.Transaction.Commit;
//  qConsulta.Free;
end;

function TAtisbador.validarUsuario(_login, _contrasena: string): Boolean;
//var _aux: Boolean;
//  qConsulta: TIBQuery;
//  _sql: string;
begin
//  _aux := false;
//  _sql := 'SELECT id, FROM usuario WHERE login = '+_login+' and contrasena = '+ hashear(_contrasena);
//  qConsulta := TIBQuery.Create(nil);
//  qConsulta.Database := Modulo.cPrincipal;
//  qConsulta.SQL.Add(_sql);
//  qConsulta.Open;
//  if qConsulta.RecordCount <> 0 then
//    _aux := True;
//  qConsulta.Free;
//
//  Result := _aux;
//
end;

function TAtisbador.hashear(_sinCodificar: string): string;
var
  _md5: TIdHashMessageDigest5;
  _contrasena: string;
begin
  _md5        := TIdHashMessageDigest5.Create;
  _contrasena := _md5.HashStringAsHex(_sinCodificar, nil);
  Result      := _contrasena;
end;

end.
