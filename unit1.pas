unit Unit1;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs;

type
  TEasingFunction = function(currentTime, startValue, delta, duration: single): single;
  TTweenCallback = procedure(t: TTweenCallback) of object;

  TTween = class

  end;

  TForm1 = class(TForm)
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

