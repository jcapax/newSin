object fDosificacion: TfDosificacion
  Left = 0
  Top = 0
  Caption = 'Dosificaci'#243'n'
  ClientHeight = 436
  ClientWidth = 780
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
    Width = 780
    Height = 436
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDosificacion
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.Appending = True
      object cxGrid1DBTableView1llaveDosificacion: TcxGridDBColumn
        DataBinding.FieldName = 'llaveDosificacion'
        Width = 250
      end
      object cxGrid1DBTableView1fecha: TcxGridDBColumn
        DataBinding.FieldName = 'fecha'
        PropertiesClassName = 'TcxDateEditProperties'
      end
      object cxGrid1DBTableView1nombresucursal: TcxGridDBColumn
        DataBinding.FieldName = 'nombresucursal'
        Width = 160
      end
      object cxGrid1DBTableView1nroAutorizacion: TcxGridDBColumn
        DataBinding.FieldName = 'nroAutorizacion'
        Width = 103
      end
      object cxGrid1DBTableView1nroInicioFactura: TcxGridDBColumn
        DataBinding.FieldName = 'nroInicioFactura'
      end
      object cxGrid1DBTableView1fechaLimiteEmision: TcxGridDBColumn
        DataBinding.FieldName = 'fechaLimiteEmision'
      end
      object cxGrid1DBTableView1estado: TcxGridDBColumn
        DataBinding.FieldName = 'estado'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Width = 45
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object dsDosificacion: TDataSource
    DataSet = modulo.qDosificacion
    Left = 376
    Top = 96
  end
end
