unit Unit1;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  UTweening, UTweenFunctions;

type

  { TForm1 }

  TForm1 = class(TForm)
    DummyButton: TButton;
    LoggerMemo: TMemo;
    StartButton: TButton;
    TweenUpdateTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure TweenUpdateTimerTimer(Sender: TObject);
  private
    procedure log(const msg: string);

    procedure dummyOnStart(tween: TTween);
    procedure dummyOnUpdate(tween: TTween);
    procedure dummyOnComplete(tween: TTween);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var
  lastTime: qword;  { in milliseconds }
  deltaTime: double;  { in seconds }

{ TForm1 }

procedure TForm1.TweenUpdateTimerTimer(Sender: TObject);
begin
  deltaTime := (GetTickCount64 - lastTime) / 1000.0;
  lastTime := GetTickCount64;

  TweenManager.update(deltaTime)  { or use an actual DeltaTime }
end;

procedure TForm1.log(const msg: string);
begin
  LoggerMemo.lines.add(msg);
  { auto-scroll }
  LoggerMemo.SelStart := LoggerMemo.GetTextLen
end;

procedure TForm1.dummyOnStart(tween: TTween);
begin
  log('Tween started')
end;

procedure TForm1.dummyOnUpdate(tween: TTween);
begin
  DummyButton.Left := round(tween.currentValue);
end;

procedure TForm1.dummyOnComplete(tween: TTween);
begin
  log('Tween completed!')
end;

procedure TForm1.StartButtonClick(Sender: TObject);
var
  testTween: TTween;
begin
  log('Test logger!');

  testTween := TTween.create(DummyButton.Left, DummyButton.Left + 100, 2.0);

  testTween
    .setEasing(@easeOutQuad)
    .onStart(@dummyOnStart)
    .onUpdate(@dummyOnUpdate)
    .onComplete(@dummyOnComplete)
    .play;

  TweenManager.add(testTween);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  lastTime := GetTickCount64;
  deltaTime := 0.0;

  TweenUpdateTimer.Enabled := true;
end;

end.

