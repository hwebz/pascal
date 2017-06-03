unit Test;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  GallonPrice = 6.5;

function GetKilometers(Payment, Consumption: integer): single;

implementation

function GetKilometers(Payment, Consumption: integer): single;
begin
  Result := (Payment / GallonPrice) * Consumption;
end;

end.
