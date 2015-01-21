object fPrecioProducto: TfPrecioProducto
  Left = 0
  Top = 0
  Caption = 'Precio Producto'
  ClientHeight = 527
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 742
    Height = 527
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -175
    ExplicitTop = -127
    ExplicitWidth = 893
    ExplicitHeight = 509
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsPrecioVenta
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      object cxGrid1DBTableView1nombreSucursal: TcxGridDBColumn
        DataBinding.FieldName = 'nombreSucursal'
      end
      object cxGrid1DBTableView1nombreProducto: TcxGridDBColumn
        DataBinding.FieldName = 'nombreProducto'
      end
      object cxGrid1DBTableView1precioUnitario: TcxGridDBColumn
        DataBinding.FieldName = 'precioUnitario'
        Width = 77
      end
      object cxGrid1DBTableView1estado: TcxGridDBColumn
        DataBinding.FieldName = 'estado'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dsPrecioVenta: TDataSource
    DataSet = modulo.qPrecioProducto
    Left = 368
    Top = 96
  end
end
