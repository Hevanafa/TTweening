unit UTweening;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils;

type
  TTween = class;

  TEasingFunction = function(v: single): single;
  TTweenCallback = procedure(t: TTween) of object;

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
  fStartValue := startVal;
  fEndValue := endVal;
  fDuration := duration;
end;

destructor TTween.destroy;
begin
  inherited destroy;
end;

procedure TTween.update(deltaTime: double);
var
  perc, eased: double;
begin
  if fIsComplete then exit;

  if fIsPlaying then
    fElapsed := fElapsed + deltaTime;

  if fElapsed > fDuration then begin
    fElapsed := fDuration;
    fCurrentValue := fEndValue;
    fIsComplete := true;

    if assigned(fOnComplete) then fOnComplete(self);

    exit
  end;

  perc := fElapsed / fDuration;
  eased := fEasing(perc);
  fCurrentValue := fStartValue + (fEndValue - fStartValue) * eased;

  if assigned(fOnUpdate) then fOnUpdate(self);
end;

procedure TTween.play;
begin
  fIsPlaying := true;

  { First time playing }
  if (fElapsed = 0.0) and assigned(fOnStart) then fOnStart(self);
end;

procedure TTween.pause;
begin
  fIsPlaying := false
end;

procedure TTween.reset;
begin
  fElapsed := 0.0;
  fCurrentValue := fStartValue;
  fIsPlaying := false;
  fIsComplete := false
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

