object fVenta: TfVenta
  Left = 0
  Top = 0
  Caption = 'Venta'
  ClientHeight = 498
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    775
    498)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 24
    Top = 18
    Width = 49
    Height = 16
    Caption = 'Sucursal'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 45
    Height = 16
    Caption = 'NIT / CI'
  end
  object Label3: TLabel
    Left = 176
    Top = 80
    Width = 73
    Height = 16
    Caption = 'Raz'#243'n Social'
  end
  object pQR: TPaintBox
    Left = 608
    Top = 375
    Width = 105
    Height = 98
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnPaint = pQRPaint
    ExplicitHeight = 106
  end
  object Label4: TLabel
    Left = 360
    Top = 404
    Width = 102
    Height = 16
    Caption = 'C'#243'digo de Control'
  end
  object eRazonSocial: TcxTextEdit
    Left = 176
    Top = 102
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 345
  end
  object eNit: TEdit
    Left = 24
    Top = 102
    Width = 121
    Height = 24
    NumbersOnly = True
    TabOrder = 1
    OnExit = eNitExit
    OnKeyPress = eNitKeyPress
  end
  object cxGrid1: TcxGrid
    Left = 24
    Top = 132
    Width = 729
    Height = 237
    TabOrder = 3
    OnEnter = cxGrid1Enter
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      DataController.DataSource = dsDetalleVenta
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = cxGrid1DBTableView1iceAlicuota
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGrid1DBTableView1iceTotal
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGrid1DBTableView1precioTotal
        end
        item
          Kind = skSum
          Column = cxGrid1DBTableView1iceAlicuota
        end
        item
          Kind = skSum
          Column = cxGrid1DBTableView1iceTotal
        end
        item
          Kind = skSum
          Column = cxGrid1DBTableView1precioTotal
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1iceAlicuota
        end
        item
          Format = '#,##0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1iceTotal
        end
        item
          Format = '#,##0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1precioTotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Appending = True
      OptionsView.ScrollBars = ssVertical
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object cxGrid1DBTableView1contador: TcxGridDBColumn
        DataBinding.FieldName = 'contador'
        MinWidth = 0
        Options.Editing = False
        Options.Focusing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 0
      end
      object cxGrid1DBTableView1nombreProducto: TcxGridDBColumn
        DataBinding.FieldName = 'nombreProducto'
        Width = 182
      end
      object cxGrid1DBTableView1cantidad: TcxGridDBColumn
        DataBinding.FieldName = 'cantidad'
      end
      object cxGrid1DBTableView1precioUnitario: TcxGridDBColumn
        DataBinding.FieldName = 'precioUnitario'
        Options.Editing = False
        Options.Focusing = False
      end
      object cxGrid1DBTableView1capacidad: TcxGridDBColumn
        DataBinding.FieldName = 'capacidad'
        Visible = False
      end
      object cxGrid1DBTableView1iceUnitario: TcxGridDBColumn
        DataBinding.FieldName = 'iceUnitario'
        Visible = False
      end
      object cxGrid1DBTableView1precioTotal: TcxGridDBColumn
        DataBinding.FieldName = 'precioTotal'
        Options.Focusing = False
      end
      object cxGrid1DBTableView1iceTotal: TcxGridDBColumn
        DataBinding.FieldName = 'iceTotal'
        Options.Focusing = False
      end
      object cxGrid1DBTableView1iceAlicuota: TcxGridDBColumn
        DataBinding.FieldName = 'iceAlicuota'
        Options.Editing = False
        Options.Focusing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cSucursal: TDBLookupComboBox
    Left = 24
    Top = 40
    Width = 497
    Height = 24
    KeyField = 'id'
    ListField = 'nombreSucursal'
    ListSource = dsSucursal
    TabOrder = 0
    OnClick = cSucursalClick
  end
  object bRegistrarVenta: TBitBtn
    Left = 24
    Top = 425
    Width = 105
    Height = 25
    Caption = 'Registrar Venta'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = bRegistrarVentaClick
  end
  object eCodigoControl: TEdit
    Left = 360
    Top = 426
    Width = 209
    Height = 24
    TabOrder = 5
  end
  object cdsDetalleVenta: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idProdcuto'
        DataType = ftByte
      end
      item
        Name = 'nombreProducto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'cantidad'
        DataType = ftFloat
      end
      item
        Name = 'precioUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'iceUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'precioTotal'
        DataType = ftCurrency
      end
      item
        Name = 'iceTotal'
        DataType = ftCurrency
      end
      item
        Name = 'iceAlicuota'
        DataType = ftCurrency
      end
      item
        Name = 'capacidad'
        DataType = ftFloat
      end
      item
        Name = 'contador'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = cdsDetalleVentaBeforePost
    Left = 272
    Top = 248
    Data = {
      4C0100009619E0BD01000000180000000A0000000000030000004C010A696450
      726F646375746F01000200000000000E6E6F6D62726550726F647563746F0100
      4900000001000557494454480200020032000863616E74696461640800040000
      0000000E70726563696F556E69746172696F0800040000000100075355425459
      50450200490006004D6F6E6579000B696365556E69746172696F080004000000
      010007535542545950450200490006004D6F6E6579000B70726563696F546F74
      616C080004000000010007535542545950450200490006004D6F6E6579000869
      6365546F74616C080004000000010007535542545950450200490006004D6F6E
      6579000B696365416C6963756F74610800040000000100075355425459504502
      00490006004D6F6E65790009636170616369646164080004000000000008636F
      6E7461646F7204000100000000000000}
    object cdsDetalleVentacontador: TIntegerField
      FieldName = 'contador'
    end
    object cdsDetalleVentaidProdcuto: TByteField
      FieldName = 'idProdcuto'
      OnValidate = cdsDetalleVentaidProdcutoValidate
    end
    object cdsDetalleVentanombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'nombreProducto'
      LookupDataSet = qProducto
      LookupKeyFields = 'idProducto'
      LookupResultField = 'nombreProducto'
      KeyFields = 'idProdcuto'
      Size = 50
      Lookup = True
    end
    object cdsDetalleVentacantidad: TFloatField
      FieldName = 'cantidad'
    end
    object cdsDetalleVentaprecioUnitario: TCurrencyField
      FieldName = 'precioUnitario'
      DisplayFormat = '#,##0.00'
    end
    object cdsDetalleVentacapacidad: TFloatField
      FieldName = 'capacidad'
    end
    object cdsDetalleVentaiceUnitario: TCurrencyField
      FieldName = 'iceUnitario'
      DisplayFormat = '#,##0.00'
    end
    object cdsDetalleVentaprecioTotal: TCurrencyField
      FieldName = 'precioTotal'
      DisplayFormat = '#,##0.00'
    end
    object cdsDetalleVentaiceTotal: TCurrencyField
      FieldName = 'iceTotal'
      DisplayFormat = '#,##0.00'
    end
    object cdsDetalleVentaiceAlicuota: TCurrencyField
      FieldName = 'iceAlicuota'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsDetalleVenta: TDataSource
    DataSet = cdsDetalleVenta
    Left = 272
    Top = 296
  end
  object dsSucursal: TDataSource
    DataSet = qSucursal
    Left = 696
    Top = 16
  end
  object qSucursal: TADOQuery
    Connection = modulo.CNX
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM sucursal'
      'WHERE estado = 1')
    Left = 640
    Top = 16
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
  end
  object qProducto: TADOQuery
    Connection = modulo.CNX
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idSucursal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 72
        Precision = 255
        Size = 255
        Value = '0'
      end>
    SQL.Strings = (
      
        'SELECT p.id, p.idProducto, r.nombreProducto, p.idSucursal, p.pre' +
        'cioUnitario, r.ice'
      'FROM precioProducto p'
      '  JOIN producto r ON p.idProducto = r.id'
      'WHERE p.estado = 1 AND p.idSucursal = :idSucursal')
    Left = 608
    Top = 72
    object qProductoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qProductoidProducto: TIntegerField
      FieldName = 'idProducto'
    end
    object qProductonombreProducto: TStringField
      FieldName = 'nombreProducto'
      Size = 45
    end
    object qProductoidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qProductoprecioUnitario: TFMTBCDField
      FieldName = 'precioUnitario'
      currency = True
      Precision = 10
    end
    object qProductoice: TFMTBCDField
      FieldName = 'ice'
      Precision = 10
      Size = 5
    end
  end
  object qDosificacionSucursal: TADOQuery
    Connection = modulo.CNX
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idSucursal'
        DataType = ftWideString
        Size = 16
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT * FROM dosificacion d'
      'where idSucursal = :idSucursal'
      '   and estado = 1')
    Left = 696
    Top = 72
    object qDosificacionSucursalid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qDosificacionSucursalllaveDosificacion: TStringField
      FieldName = 'llaveDosificacion'
      Size = 150
    end
    object qDosificacionSucursalfecha: TDateField
      FieldName = 'fecha'
    end
    object qDosificacionSucursalidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qDosificacionSucursalnroAutorizacion: TStringField
      FieldName = 'nroAutorizacion'
      Size = 45
    end
    object qDosificacionSucursalnroInicioFactura: TIntegerField
      FieldName = 'nroInicioFactura'
    end
    object qDosificacionSucursalfechaLimiteEmision: TDateField
      FieldName = 'fechaLimiteEmision'
    end
    object qDosificacionSucursalestado: TWordField
      FieldName = 'estado'
    end
  end
  object qFactura: TADOQuery
    Connection = modulo.CNX
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftWideString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from factura'
      'where idVenta = :id')
    Left = 696
    Top = 128
    object qFacturaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qFacturaidSucursal: TIntegerField
      FieldName = 'idSucursal'
    end
    object qFacturaespecificacion: TWordField
      FieldName = 'especificacion'
    end
    object qFacturacorrelativoSucursal: TIntegerField
      FieldName = 'correlativoSucursal'
    end
    object qFacturafechaFactura: TDateField
      FieldName = 'fechaFactura'
    end
    object qFacturanroFactura: TLargeintField
      FieldName = 'nroFactura'
    end
    object qFacturanroAutorizacion: TStringField
      FieldName = 'nroAutorizacion'
      Size = 30
    end
    object qFacturaestado: TStringField
      FieldName = 'estado'
      FixedChar = True
      Size = 1
    end
    object qFacturanit: TLargeintField
      FieldName = 'nit'
    end
    object qFacturarazonSocial: TStringField
      FieldName = 'razonSocial'
      Size = 45
    end
    object qFacturaimporteTotal: TBCDField
      FieldName = 'importeTotal'
      Precision = 10
    end
    object qFacturaimporteIce: TBCDField
      FieldName = 'importeIce'
      Precision = 10
    end
    object qFacturaimporteExportaciones: TBCDField
      FieldName = 'importeExportaciones'
      Precision = 10
    end
    object qFacturaimporteVentasTasaCero: TBCDField
      FieldName = 'importeVentasTasaCero'
      Precision = 10
    end
    object qFacturaimporteSubtotal: TBCDField
      FieldName = 'importeSubtotal'
      Precision = 10
    end
    object qFacturaimporteRebajas: TBCDField
      FieldName = 'importeRebajas'
      Precision = 10
    end
    object qFacturaimporteBaseDebitoFiscal: TBCDField
      FieldName = 'importeBaseDebitoFiscal'
      Precision = 10
    end
    object qFacturadebitoFiscal: TBCDField
      FieldName = 'debitoFiscal'
      Precision = 10
    end
    object qFacturacodigoControl: TStringField
      FieldName = 'codigoControl'
      Size = 15
    end
    object qFacturaidVenta: TIntegerField
      FieldName = 'idVenta'
    end
    object qFacturafechaLimiteEmision: TDateField
      FieldName = 'fechaLimiteEmision'
    end
    object qFacturacodigoQR: TBlobField
      FieldName = 'codigoQR'
    end
  end
  object qRazonSocial: TADOQuery
    Connection = modulo.CNX
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'nit'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = ''
      end>
    SQL.Strings = (
      'SELECT nit, razonSocial'
      'FROM factura f'
      'WHERE nit = :nit'
      'ORDER BY id Desc'
      'LIMIT 1;')
    Left = 616
    Top = 136
    object qRazonSocialnit: TLargeintField
      FieldName = 'nit'
    end
    object qRazonSocialrazonSocial: TStringField
      FieldName = 'razonSocial'
      Size = 45
    end
  end
  object Literal1: TLiteral
    Numero = 0
    Left = 584
    Top = 16
  end
end
