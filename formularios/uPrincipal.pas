unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    bVenta: TBitBtn;
    bDosificacion: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bVentaClick(Sender: TObject);
    procedure bDosificacionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uSucursal, uProductos, uPrecioVenta, uVenta, uDosificacion;

{$R *.dfm}

procedure TForm1.bDosificacionClick(Sender: TObject);
begin
  Application.CreateForm(TfDosificacion, fDosificacion);
  fDosificacion.ShowModal;
  fDosificacion.Free;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TfSucursal, fSucursal);
  fSucursal.ShowModal;
  fSucursal.Free;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TfProductos, fProductos);
  fProductos.ShowModal;
  fProductos.Free;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Application.CreateForm(TfPrecioProducto, fPrecioProducto);
  fPrecioProducto.ShowModal;
  fPrecioProducto.Free;
end;

procedure TForm1.bVentaClick(Sender: TObject);
begin
  Application.CreateForm(TfVenta, fVenta);
  fVenta.showmodal;
  fVenta.free;

end;

end.
