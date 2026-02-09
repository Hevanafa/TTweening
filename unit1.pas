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
    procedure TweenUpdateTimerTimer(Sender: TObject);
  private
    fTweenManager: TTweenManager;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TweenUpdateTimerTimer(Sender: TObject);
begin
  fTweenManager.update(0.016)
end;

end.

