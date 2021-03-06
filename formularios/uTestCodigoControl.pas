unit uTestCodigoControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfTestCodigoControl = class(TForm)
    eNroAutorizacion: TEdit;
    Label1: TLabel;
    eNroFactura: TEdit;
    Label2: TLabel;
    function codControl(_nit: string; _importeTotal: Currency): string;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTestCodigoControl: TfTestCodigoControl;

implementation

uses uCodigoControl, uModulo;

{$R *.dfm}


function TfTestCodigoControl.codControl(_nit: string; _importeTotal: Currency): string;
var
  _codControl, _llaveDosif, _codPuro, _fechaFactura: string;

  _nroFactura: Integer;
  codCont: TCodigoControl;

  _dia, _mes, _anno: string;

  _nroAutorizacion: Int64;
begin

  _nroAutorizacion := StrToInt64(eNroAutorizacion.Text);

  _nroFactura := StrToInt(eNroFactura.Text);
//
//  _dia := inttostr(DayOf(date));
//  if Length(_dia) = 1 then
//    _dia := '0' + _dia;
//
//  _mes := inttostr(MonthOf(date));
//  if Length(_mes) = 1 then
//    _mes := '0' + _mes;
//
//  _fechaFactura := inttostr(YearOf(date)) + _mes + _dia;
//
//  _llaveDosif := qDosificacionSucursalllaveDosificacion.Value;
//
//  codCont := TCodigoControl.Create(inttostr(_nroAutorizacion),
//    inttostr(_nroFactura), _nit, _fechaFactura,
//    inttostr(modulo.aCero(_importeTotal)), _llaveDosif);
//
//  _codPuro := codCont.f_codigoControlPuro();
//
//  result := codCont.f_codigoControlImpresion(_codPuro);
end;


end.
