object modulo: Tmodulo
  OldCreateOrder = False
  Height = 467
  Width = 764
  object CNX: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=fasin' +
      '_'
    LoginPrompt = False
    AfterConnect = CNXAfterConnect
    Left = 16
    Top = 24
  end
  object qSucursal: TADOQuery
    Active = True
    Connection = CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sucursal')
    Left = 152
    Top = 24
    object qSucursalid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qSucursalnombreSucursal: TStringField
      FieldName = 'nombreSucursal'
      Size = 45
    end
    object qSucursaldireccion: TStringField
      FieldName = 'direccion'
      Size = 100
    end
    object qSucursaltipoProductos: TMemoField
      FieldName = 'tipoProductos'
      BlobType = ftMemo
    end
    object qSucursalestado: TWordField
      FieldName = 'estado'
    end
    object qSucursallugarSucursal: TStringField
      FieldName = 'lugarSucursal'
      Size = 45
    end
    object qSucursalactividadEconomica: TStringField
      FieldName = 'actividadEconomica'
      Size = 145
    end
  end
  object qProducto: TADOQuery
    Active = True
    Connection = CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM producto')
    Left = 256
    Top = 24
    object qProductoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qProductonombreProducto: TStringField
      FieldName = 'nombreProducto'
      Size = 45
    end
    object qProductounidad: TStringField
      FieldKind = fkLookup
      FieldName = 'unidad'
      LookupDataSet = qUnidadMedida
      LookupKeyFields = 'id'
      LookupResultField = 'simbolo'
      KeyFields = 'idUnidadMedida'
      Lookup = True
    end
    object qProductoidUnidadMedida: TIntegerField
      FieldName = 'idUnidadMedida'
    end
    object qProductocapacidad: TFloatField
      FieldName = 'capacidad'
    end
    object qProductoICE: TFloatField
      FieldName = 'ICE'
    end
  end
  object qUnidadMedida: TADOQuery
    Active = True
    Connection = CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM unidadMedida')
    Left = 360
    Top = 24
    object qUnidadMedidaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qUnidadMedidanombreUnidadMedida: TStringField
      FieldName = 'nombreUnidadMedida'
      Size = 45
    end
    object qUnidadMedidasimbolo: TStringField
      FieldName = 'simbolo'
      Size = 3
    end
  end
  object qPrecioProducto: TADOQuery
    Active = True
    Connection = CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM precioProducto')
    Left = 152
    Top = 96
    object qPrecioProductoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qPrecioProductoidProducto: TIntegerField
      FieldName = 'idProducto'
    end
    object qPrecioProductoidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qPrecioProductoprecioUnitario: TFMTBCDField
      FieldName = 'precioUnitario'
      Precision = 10
    end
    object qPrecioProductoestado: TWordField
      FieldName = 'estado'
    end
    object qPrecioProductonombreSucursal: TStringField
      FieldKind = fkLookup
      FieldName = 'nombreSucursal'
      LookupDataSet = qSucursal
      LookupKeyFields = 'id'
      LookupResultField = 'nombreSucursal'
      KeyFields = 'idSucursal'
      Lookup = True
    end
    object qPrecioProductonombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'nombreProducto'
      LookupDataSet = qProducto
      LookupKeyFields = 'id'
      LookupResultField = 'nombreProducto'
      KeyFields = 'idProducto'
      Size = 45
      Lookup = True
    end
  end
  object qDosificacion: TADOQuery
    Connection = CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM dosificacion')
    Left = 256
    Top = 96
    object qDosificacionid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qDosificacionllaveDosificacion: TStringField
      FieldName = 'llaveDosificacion'
      Size = 150
    end
    object qDosificacionfecha: TDateField
      FieldName = 'fecha'
    end
    object qDosificacionidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qDosificacionnroAutorizacion: TStringField
      FieldName = 'nroAutorizacion'
      Size = 45
    end
    object qDosificacionnroInicioFactura: TIntegerField
      FieldName = 'nroInicioFactura'
    end
    object qDosificacionfechaLimiteEmision: TDateField
      FieldName = 'fechaLimiteEmision'
    end
    object qDosificacionnombresucursal: TStringField
      FieldKind = fkLookup
      FieldName = 'nombresucursal'
      LookupDataSet = qSucursal
      LookupKeyFields = 'id'
      LookupResultField = 'nombreSucursal'
      KeyFields = 'idSucursal'
      Size = 50
      Lookup = True
    end
    object qDosificacionestado: TWordField
      FieldName = 'estado'
    end
    object qDosificacionpieFactura: TStringField
      FieldName = 'pieFactura'
      Size = 300
    end
  end
  object raveFasin: TRvProject
    Engine = RvSystem1
    Left = 128
    Top = 200
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Impuestos'
    SystemSetups = [ssAllowSetup, ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile]
    SystemOptions = []
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 216
    Top = 200
  end
  object qrFactura: TADOQuery
    Connection = CNX
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idVenta'
        DataType = ftWideString
        Size = 16
        Value = '0'
      end>
    SQL.Strings = (
      'select * from v_factura'
      'where idVenta_ = :idVenta')
    Left = 344
    Top = 208
    object qrFacturaidVenta_: TIntegerField
      FieldName = 'idVenta_'
    end
    object qrFacturaidCaja: TIntegerField
      FieldName = 'idCaja'
    end
    object qrFacturausuario: TStringField
      FieldName = 'usuario'
      Size = 3
    end
    object qrFacturafechaHora: TDateTimeField
      FieldName = 'fechaHora'
    end
    object qrFacturaidFactura: TAutoIncField
      FieldName = 'idFactura'
      ReadOnly = True
    end
    object qrFacturaidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qrFacturaespecificacion: TWordField
      FieldName = 'especificacion'
    end
    object qrFacturacorrelativoSucursal: TIntegerField
      FieldName = 'correlativoSucursal'
    end
    object qrFacturafechaFactura: TDateField
      FieldName = 'fechaFactura'
    end
    object qrFacturanroFactura: TLargeintField
      FieldName = 'nroFactura'
    end
    object qrFacturanroAutorizacion: TStringField
      FieldName = 'nroAutorizacion'
      Size = 30
    end
    object qrFacturaestado: TStringField
      FieldName = 'estado'
      FixedChar = True
      Size = 1
    end
    object qrFacturanit: TLargeintField
      FieldName = 'nit'
    end
    object qrFacturarazonSocial: TStringField
      FieldName = 'razonSocial'
      Size = 45
    end
    object qrFacturaimporteTotal: TBCDField
      FieldName = 'importeTotal'
      Precision = 10
    end
    object qrFacturaimporteIce: TBCDField
      FieldName = 'importeIce'
      Precision = 10
    end
    object qrFacturaimporteExportaciones: TBCDField
      FieldName = 'importeExportaciones'
      Precision = 10
    end
    object qrFacturaimporteVentasTasaCero: TBCDField
      FieldName = 'importeVentasTasaCero'
      Precision = 10
    end
    object qrFacturaimporteSubtotal: TBCDField
      FieldName = 'importeSubtotal'
      Precision = 10
    end
    object qrFacturaimporteRebajas: TBCDField
      FieldName = 'importeRebajas'
      Precision = 10
    end
    object qrFacturaimporteBaseDebitoFiscal: TBCDField
      FieldName = 'importeBaseDebitoFiscal'
      Precision = 10
    end
    object qrFacturadebitoFiscal: TBCDField
      FieldName = 'debitoFiscal'
      Precision = 10
    end
    object qrFacturacodigoControl: TStringField
      FieldName = 'codigoControl'
      Size = 15
    end
    object qrFacturaidVenta: TIntegerField
      FieldName = 'idVenta'
    end
    object qrFacturafechaLimiteEmision: TDateField
      FieldName = 'fechaLimiteEmision'
    end
    object qrFacturaidproducto: TIntegerField
      FieldName = 'idproducto'
    end
    object qrFacturanombreProducto: TStringField
      FieldName = 'nombreProducto'
      Size = 45
    end
    object qrFacturasimbolo: TStringField
      FieldName = 'simbolo'
      Size = 3
    end
    object qrFacturacapacidad: TFloatField
      FieldName = 'capacidad'
    end
    object qrFacturacantidad: TBCDField
      FieldName = 'cantidad'
      Precision = 10
      Size = 2
    end
    object qrFacturaprecioUnitario: TBCDField
      FieldName = 'precioUnitario'
      Precision = 10
    end
    object qrFacturaiceUnitario: TBCDField
      FieldName = 'iceUnitario'
      Precision = 10
    end
    object qrFacturaprecioTotal: TBCDField
      FieldName = 'precioTotal'
      Precision = 10
    end
    object qrFacturaiceTotal: TBCDField
      FieldName = 'iceTotal'
      Precision = 10
    end
    object qrFacturaalicuota: TBCDField
      FieldName = 'alicuota'
      Precision = 10
    end
    object qrFacturacodigoQR: TBlobField
      FieldName = 'codigoQR'
    end
    object qrFacturaunitarioCalculado: TBCDField
      FieldName = 'unitarioCalculado'
      Precision = 12
    end
    object qrFacturanombreSucursal: TStringField
      FieldName = 'nombreSucursal'
      Size = 45
    end
    object qrFacturadireccion: TStringField
      FieldName = 'direccion'
      Size = 100
    end
    object qrFacturalugarSucursal: TStringField
      FieldName = 'lugarSucursal'
      Size = 45
    end
    object qrFacturaactividadEconomica: TStringField
      FieldName = 'actividadEconomica'
      Size = 145
    end
    object qrFacturapieFactura: TStringField
      FieldName = 'pieFactura'
      Size = 300
    end
  end
  object rdsFactura: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qrFactura
    Left = 424
    Top = 208
  end
end
