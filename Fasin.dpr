program Fasin;

uses
  Forms,
  uPrincipal in 'formularios\uPrincipal.pas' {Form1},
  uModulo in 'modulo\uModulo.pas' {modulo: TDataModule},
  uSucursal in 'formularios\uSucursal.pas' {fSucursal},
  uProductos in 'formularios\uProductos.pas' {fProductos},
  uPrecioVenta in 'formularios\uPrecioVenta.pas' {fPrecioProducto},
  uVenta in 'formularios\uVenta.pas' {fVenta},
  uDosificacion in 'formularios\uDosificacion.pas' {fDosificacion},
  uComun in 'unidades\uComun.pas',
  uCodigoControl in 'unidades\uCodigoControl.pas',
  DelphiZXIngQRCode in 'unidades\DelphiZXIngQRCode.pas',
  uTestCodigoControl in 'formularios\uTestCodigoControl.pas' {fTestCodigoControl};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tmodulo, modulo);
  Application.CreateForm(TfTestCodigoControl, fTestCodigoControl);
  Application.Run;
end.
