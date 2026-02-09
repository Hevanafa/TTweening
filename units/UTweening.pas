unit UTweening;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils;

type
  TEasingFunction = function(v: single): single;
  TTweenCallback = procedure(t: TTweenCallback) of object;

  { TTween }

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


implementation

{ TTween }

constructor TTween.create(startVal, endVal, duration: single);
begin

end;

destructor TTween.destroy;
begin
  inherited destroy;
end;

procedure TTween.update(deltaTime: double);
begin

end;

procedure TTween.play;
begin

end;

procedure TTween.pause;
begin

end;

procedure TTween.reset;
begin

end;

function TTween.setEasing(easing: TEasingFunction): TTween;
begin

end;

function TTween.onStart(callback: TTweenCallback): TTween;
begin

end;

function TTween.onUpdate(callback: TTweenCallback): TTween;
begin

end;

function TTween.onComplete(callback: TTweenCallback): TTween;
begin

end;

function TTween.thenTween(nextTween: TTween): TTween;
begin

end;

end.

