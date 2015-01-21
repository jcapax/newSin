object fProductos: TfProductos
  Left = 0
  Top = 0
  Caption = 'Productos'
  ClientHeight = 509
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 893
    Height = 509
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsProducto
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      object cxGrid1DBTableView1nombreProducto: TcxGridDBColumn
        DataBinding.FieldName = 'nombreProducto'
      end
      object cxGrid1DBTableView1unidad: TcxGridDBColumn
        DataBinding.FieldName = 'unidad'
      end
      object cxGrid1DBTableView1capacidad: TcxGridDBColumn
        DataBinding.FieldName = 'capacidad'
      end
      object cxGrid1DBTableView1ICE: TcxGridDBColumn
        DataBinding.FieldName = 'ICE'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dsProducto: TDataSource
    DataSet = modulo.qProducto
    Left = 296
    Top = 88
  end
end
