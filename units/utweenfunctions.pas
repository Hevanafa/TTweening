unit UTweenFunctions;

{$Mode ObjFPC}
{$H+}

interface

uses
  Classes, SysUtils;

function linear(v: double): double;

function easeInQuad(v: double): double;
function easeOutQuad(v: double): double;
function easeInOutQuad(v: double): double;

{ More easing functions: quart, quint, expo, elastic, bounce, and so on }

implementation

function linear(v: double): double;
begin
  result := v
end;

function easeInQuad(v: double): double;
begin
  result := v * v
end;

function easeOutQuad(v: double): double;
begin
  result := 1 - (1-x) * (1-x)
end;

function easeInOutQuad(v: double): double;
begin
  if x < 0.5 then
    result := 2 * x * x
  else
    result := 1 - pow(-2 * x + 2, 2) / 2
end;

end.

