unit UTweenFunctions;

{$Mode ObjFPC}
{$H+}

interface

uses
  Classes, SysUtils, Math;

function easeLinear(v: double): double;

function easeInQuad(v: double): double;
function easeOutQuad(v: double): double;
function easeInOutQuad(v: double): double;

function easeInSine(v: double): double;
function easeOutSine(v: double): double;
function easeInOutSine(v: double): double;

function easeInCubic(v: double): double;
function easeOutCubic(v: double): double;
function easeInOutCubic(v: double): double;

{ More easing functions: quart, quint, expo, circ, back, elastic, bounce }

implementation

function easeLinear(v: double): double;
begin
  result := v
end;

function easeInQuad(v: double): double;
begin
  result := v * v
end;

function easeOutQuad(v: double): double;
begin
  result := 1 - (1-v) * (1-v)
end;

function easeInOutQuad(v: double): double;
begin
  if v < 0.5 then
    result := 2 * v * v
  else
    result := 1 - power(-2 * v + 2, 2) / 2
end;

function easeInSine(v: double): double;
begin
  result := 1 - cos(v * pi / 2.0)
end;

function easeOutSine(v: double): double;
begin
  result := sin(v * pi / 2.0)
end;

function easeInOutSine(v: double): double;
begin
  result := -(cos(pi * v) - 1.0) / 2.0
end;

function easeInCubic(v: double): double;
begin
  result := v * v * v
end;

function easeOutCubic(v: double): double;
begin
  result := 1 - power(1 - v, 3)
end;

function easeInOutCubic(v: double): double;
begin
  if v < 0.5 then
    result := 4 * v * v * v
  else
    result := 1 - power(-2 * v + 2, 3) / 2.0;
end;

end.

