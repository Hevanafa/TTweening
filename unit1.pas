unit Unit1;

{$Mode ObjFPC}
{$H+}
{$J-}

interface

uses
  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  UTweening;

type

  { TForm1 }

  TForm1 = class(TForm)
    DummyButton: TButton;
    StartButton: TButton;
    TweenUpdateTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure TweenUpdateTimerTimer(Sender: TObject);
  private
    testTween: TTween;

    procedure dummyOnUpdate(tween: TTween);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TweenUpdateTimerTimer(Sender: TObject);
begin
  TweenManager.update(0.016)  { or use an actual DeltaTime }
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TweenUpdateTimer.Enabled := true;


end;

function linear(v: single): single;
begin
  result := v
end;

procedure TForm1.dummyOnUpdate(tween: TTween);
begin
  DummyButton.Left := round(tween.currentValue);
end;

procedure TForm1.StartButtonClick(Sender: TObject);
begin
  if not assigned(testTween) then begin
    testTween := TTween.create(DummyButton.Left, DummyButton.Left + 100, 2.0);
    testTween.setEasing(@linear).onUpdate(@dummyOnUpdate).play;
    TweenManager.add(testTween);
  end;
end;

end.

