object fSucursal: TfSucursal
  Left = 0
  Top = 0
  Caption = 'Sucursal'
  ClientHeight = 509
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 843
    Height = 509
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 741
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSucursal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      object cxGrid1DBTableView1nombreSucursal: TcxGridDBColumn
        Caption = 'Nombre Sucursal'
        DataBinding.FieldName = 'nombreSucursal'
        Width = 206
      end
      object cxGrid1DBTableView1direccion: TcxGridDBColumn
        Caption = 'Direcci'#243'n'
        DataBinding.FieldName = 'direccion'
        Width = 266
      end
      object cxGrid1DBTableView1tipoProductos: TcxGridDBColumn
        Caption = 'Tipo Productos'
        DataBinding.FieldName = 'tipoProductos'
        Width = 153
      end
      object cxGrid1DBTableView1lugarSucursal: TcxGridDBColumn
        Caption = 'Lugar Sucursal'
        DataBinding.FieldName = 'lugarSucursal'
        Width = 251
      end
      object cxGrid1DBTableView1actividadEconomica: TcxGridDBColumn
        Caption = 'Actividad Econ'#243'mica'
        DataBinding.FieldName = 'actividadEconomica'
        Width = 304
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
  object dsSucursal: TDataSource
    DataSet = modulo.qSucursal
    Left = 280
    Top = 112
  end
end
