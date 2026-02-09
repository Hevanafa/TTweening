unit Unit1;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs;

type
  TEasingFunction = function(v: single): single;
  TTweenCallback = procedure(t: TTweenCallback) of object;

  TTween = class
  private
    fStartValue: single;
    fEndValue: single;
    fCurrentValue: single;
    fDuration: single;
    fElapsed: single;
    fEasing: TEasingFunction;
    fIsPlaying: boolean;
    fIsComplete: boolean;

    { Callbacks }
    fOnStart: TTweenCallback;
    fOnUpdate: TTweenCallback;
    fOnComplete: TTweenCallback;

  public
    constructor create(startVal, endVal, duration: single);
    destructor destroy; override;

    procedure update(deltaTime: double);
    procedure play;
    procedure pause;
    procedure reset;

    function setEasing(easing: TEasingFunction): TTween;
    function onStart(callback: TTweenCallback): TTween;
    function onUpdate(callback: TTweenCallback): TTween;
    function onComplete(callback: TTweenCallback): TTween;
    function thenTween(nextTween: TTween): TTween;

    property currentValue: single read fCurrentValue;
    property isComplete: boolean read fIsComplete;
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

