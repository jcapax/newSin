unit uCodigoControl;

interface

Uses
  SysUtils, Math;

type
  TCodigoControl = class
    private
    public
      numeroAutorizacion: string;
      numeroFactura     : string;
      nitCliente        : string;
      fechaTransaccion  : string;
      montoTransaccion  : string;
      llaveDosificacion : string;

      function f_invertir(s:string):string;
      function f_base64(s:string):string;
      function f_verhoeff(s:string):string;
      function f_allegedRC4(cadena,llave:string):string;
      function f_sumatoria(s, dv:string):string;
      function f_codigoControlPuro():string;
      function f_codigoControlImpresion(codigoControlPuro:string):string;

      constructor create(AnumeroAutorizacion, AnumeroFactura, AnitCliente, AfechaTransaccion, AmontoTransaccion, AllaveDosificacion: string);

  end;

  const
    mul   : array[0..9,0..9] of integer = ((0,1,2,3,4,5,6,7,8,9),(1,2,3,4,0,6,7,8,9,5),(2,3,4,0,1,7,8,9,5,6),(3,4,0,1,2,8,9,5,6,7),(4,0,1,2,3,9,5,6,7,8),(5,9,8,7,6,0,4,3,2,1),(6,5,9,8,7,1,0,4,3,2),(7,6,5,9,8,2,1,0,4,3),(8,7,6,5,9,3,2,1,0,4),(9,8,7,6,5,4,3,2,1,0));
    per   : array[0..7,0..9] of integer = ((0,1,2,3,4,5,6,7,8,9),(1,5,7,6,2,8,3,0,9,4),(5,8,0,3,7,9,6,1,4,2),(8,9,1,6,0,4,3,5,2,7),(9,4,5,3,1,2,6,8,7,0),(4,2,8,6,5,7,3,9,0,1),(2,7,9,3,8,0,6,4,1,5),(7,0,4,6,9,1,3,2,5,8));
    dig   : array[0..9]      of integer = (0,4,3,2,1,5,6,7,8,9);
    base64: array[0..63]     of string  = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','+','/');


implementation

constructor TCodigoControl.create(AnumeroAutorizacion, AnumeroFactura, AnitCliente, AfechaTransaccion, AmontoTransaccion, AllaveDosificacion: string);
begin
  numeroAutorizacion := AnumeroAutorizacion;
  numeroFactura      := AnumeroFactura;
  nitCliente         := AnitCliente;
  fechaTransaccion   := AfechaTransaccion;
  montoTransaccion   := AmontoTransaccion;
  llaveDosificacion  := AllaveDosificacion;
end;

function TCodigoControl.f_codigoControlImpresion(codigoControlPuro:string):string;
var i:integer;
  codigoControl: string;
begin
     i := 1;
     while  i < length(codigoControlPuro) do
       begin
         codigoControl := codigoControl + copy(codigoControlPuro,i,2)+'-';
         i := i + 2;
       end;

    result := copy(codigoControl,1,(length(codigoControl)-1)); 
end;

function TcodigoControl.f_codigoControlPuro():string;
var suma : Int64 ;
  i,j: integer;
  digitoVerhoeff, suma5:string;
  dig5  :array[0..4] of integer;
  cadena:array[0..4] of string;
  cadenaConcatenada, llaveCifrado: string;

  sumatoria, base64_ : string;
  codigoControl : string;

  numeroFactura_v, nitCliente_v, fechaTransaccion_v, montotransaccion_v: string;
begin
     numeroFactura_v := numeroFactura   + f_verhoeff(numeroFactura);
     numeroFactura_v := numeroFactura_v + f_verhoeff(numeroFactura_v);

     nitCliente_v := nitCliente   + f_verhoeff(nitCliente);
     nitCliente_v := nitCliente_v + f_verhoeff(nitCliente_v);

     fechaTransaccion_v := fechaTransaccion   + f_verhoeff(fechaTransaccion);
     fechaTransaccion_v := fechaTransaccion_v + f_verhoeff(fechaTransaccion_v);

     montotransaccion_v := montoTransaccion   + f_verhoeff(montoTransaccion);
     montotransaccion_v := montotransaccion_v + f_verhoeff(montotransaccion_v);

     suma := strtoint(numeroFactura_v)+StrToInt64(nitCliente_v)+strtoint(fechaTransaccion_v)+strtoint(montotransaccion_v);

     suma5 := inttostr(suma);

     for i:= 1 to 5 do
       begin
          suma5 := suma5 + f_verhoeff(suma5);
       end;

     for i:= length(suma5) downto (length(suma5)-4) do
          digitoVerhoeff := digitoVerhoeff + copy(suma5,i,1);

     j:= 0;

     for i:= 5 downto 1 do
     begin
         dig5[j]:= strtoint(copy(digitoVerhoeff,i,1))+1;
         j := j + 1;
     end;

     j := 1;
     for i:= 0 to 4 do
     begin
         cadena[i]:=copy(llaveDosificacion,j,dig5[i]);
         j:= j + dig5[i];
     end;

     cadenaConcatenada := numeroAutorizacion+cadena[0]+numeroFactura_v+cadena[1]+nitCliente_v+cadena[2]+fechaTransaccion_v+cadena[3]+montoTransaccion_v+cadena[4];

     llaveCifrado := llaveDosificacion + f_invertir(digitoverhoeff);

     sumatoria := f_sumatoria(f_allegedRC4(CadenaConcatenada,llaveCifrado), digitoVerhoeff);

     base64_:= f_base64(sumatoria);

     codigoControl := f_allegedRC4(base64_,llaveCifrado);

     result := codigoControl;
end;

function TCodigoControl.f_invertir(s:string):string;
var i:byte;
begin
    for i := (length(s)) downto 1 do
      begin
         result := result + copy(s,i,1);
      end;
end;

function TCodigoControl.f_base64(s:string):string;
var resto:integer;
  cociente, numero: integer;
  cadena:string;
begin
  numero   := strtoint(s);
  cociente := 1;
  cadena   := '';
  while(cociente > 0)do
    begin
        cociente := trunc(numero/64);
        resto    := numero mod 64;
        cadena   := base64[resto]+cadena;
        numero   := cociente;
    end;

  result := cadena;
end;

function TCodigoControl.f_verhoeff(s:string):string;
var i, check:integer;
  a,b,c:integer;
  r:integer;
  largo:integer;
  invertido:string;
begin
  invertido := f_invertir(s);
  check := 0;
  largo := length(s)-1;
  for i := 0 to largo do
  begin
      a := (i+1) mod 8;
      b := strtoint(invertido[i+1]);
      c := per[a,b];
      check := mul[check,c];
  end;

  r := dig[check];

  result := inttostr(r);
end;

function TCodigoControl.f_allegedRC4(cadena, llave: string):string;
var estado:array[0..255] of integer;
  i, x, y, index1, index2, nmen, intercambiar, est: integer;
  mensajeCifrado:string;
  ascii : integer;
begin
  x     := 0;
  y     := 0;
  index1:= 0;
  index2:= 0;
  mensajeCifrado:= '';


  for i := 0 to 255 do
    estado[i] := i;

  for i := 0 to 255 do
    begin
      ascii  := ord(llave[index1+1]);
      index2 := (ascii + estado[i] + index2) mod 256;

      intercambiar   := estado[i];
      estado[i]      := estado[index2];
      estado[index2] := intercambiar;

      index1 := (index1 + 1) mod length(llave);
    end;

  for i:= 0 to (length(cadena) - 1) do
    begin
      x := (x+1) mod 256;
      y := (estado[x]+y) mod 256;

      intercambiar := estado[x];
      estado[x]    := estado[y];
      estado[y]    := intercambiar;

      ascii := ord(cadena[i+1]);

      est   := estado[(estado[x]+estado[y]) mod 256];

      nmen  := ascii xor est;

      mensajeCifrado := mensajeCifrado + inttohex(nmen,2);
    end;

    result := mensajeCifrado;
end;

function TcodigoControl.f_sumatoria(s, dv: string):string;
var j, sumTotal, res: integer;
  sumPar: array[0..4] of integer;
  digitoVerhoeff : string;
begin
  j              := 0;
  sumTotal       := 0;
  digitoVerhoeff := '';
  digitoVerhoeff := f_invertir(dv);

  sumPar[0] := 0;
  sumPar[1] := 0;
  sumPar[2] := 0;
  sumPar[3] := 0;
  sumPar[4] := 0;

  while j <= (length(s)) do
    begin

        if (j+1)<=length(s) then
          sumPar[0] := sumPar[0]+ ord(s[j+1]);

        if (j+2)<=length(s) then
          sumPar[1] := sumPar[1]+ ord(s[j+2]);

        if (j+3)<=length(s) then
          sumPar[2] := sumPar[2]+ ord(s[j+3]);

        if (j+4)<=length(s) then
          sumPar[3] := sumPar[3]+ ord(s[j+4]);

        if (j+5)<=length(s) then
          sumPar[4] := sumPar[4]+ ord(s[j+5]);

        j := j + 5;

        if (j) > (length(s)) then break;
    end;

  sumTotal :=  sumPar[0] + sumPar[1] + sumPar[2] + sumPar[3] + sumPar[4];

  res := 0;

  for j:= 0 to 4 do
        res := trunc((sumTotal * sumPar[j]) / (strtoint((digitoVerhoeff[j+1]))+1)) + res;

  result := inttostr(res);

end;

end.
