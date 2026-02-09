unit UTweening;

{$Mode ObjFPC}
{$H+}
{$J-}
{$Notes OFF}

interface

uses
  Classes, SysUtils, FGL;

type
  TTween = class;

  TEasingFunction = function(v: single): single;
  TTweenCallback = procedure(t: TTween) of object;

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

    fAutoFree: boolean;

    { Callbacks }
    fOnStart: TTweenCallback;
    fOnUpdate: TTweenCallback;
    fOnComplete: TTweenCallback;
    fNextTween: TTween;

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
    property autoFree: boolean read fAutoFree write fAutoFree;
  end;

  { TTweenManager }

  TTweenList = specialize TFPGObjectList<TTween>;

  TTweenManager = class
  private
    fTweens: TTweenList;
  public
    constructor create;
    destructor destroy; override;

    function add(tween: TTween): TTween;
    procedure remove(tween: TTween);
    procedure update(deltaTime: double);
    procedure clear;
    procedure pauseAll;
    procedure resumeAll;
  end;

var
  TweenManager: TTweenManager;

implementation

{ TTween }

constructor TTween.create(startVal, endVal, duration: single);
begin
  fStartValue := startVal;
  fEndValue := endVal;
  fDuration := duration;

  fAutoFree := true
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
    if assigned(fNextTween) then fNextTween.play;

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
  fEasing := easing;
  result := self
end;

function TTween.onStart(callback: TTweenCallback): TTween;
begin
  fOnStart := callback;
  result := self
end;

function TTween.onUpdate(callback: TTweenCallback): TTween;
begin
  fOnUpdate := callback;
  result := self
end;

function TTween.onComplete(callback: TTweenCallback): TTween;
begin
  fOnComplete := callback;
  result := self
end;

function TTween.thenTween(nextTween: TTween): TTween;
begin
  fNextTween := nextTween;
  result := nextTween
end;

{ TTweenManager }

constructor TTweenManager.create;
begin
  fTweens := TTweenList.create(false);
end;

destructor TTweenManager.destroy;
begin
  fTweens.free;
  inherited destroy;
end;

function TTweenManager.add(tween: TTween): TTween;
begin
  fTweens.add(tween);
  result := tween
end;

procedure TTweenManager.remove(tween: TTween);
begin
  fTweens.Remove(tween)
end;

procedure TTweenManager.update(deltaTime: double);
var
  a: smallint;
  tween: TTween;
begin
  a:=0;

  while a < fTweens.count do begin
    tween := fTweens[a];
    tween.update(deltaTime);

    if tween.isComplete and tween.autoFree then begin
      fTweens.delete(a);
      tween.free
    end else inc(a);
  end;
end;

procedure TTweenManager.clear;
begin

end;

procedure TTweenManager.pauseAll;
begin

end;

procedure TTweenManager.resumeAll;
begin

end;

end.

