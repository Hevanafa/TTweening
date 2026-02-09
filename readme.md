# TTweening

An object-oriented easing library made for Object Pascal

Inspired by DOTween, Phaser 3 and Cocos Creator

This is compatible with most desktop implementations (Windows & Linux) since it uses FGL under the hood. May not be compatible with `embedded` targets because of it

## Requirements

- Lazarus IDE (v3.6 by the time of writing)

## How to Use

Simply add `UTweening` under `uses` clause

An example usage in `Unit1`:

```pascal
procedure TForm1.StartButtonClick(Sender: TObject);
var
  testTween: TTween;
begin
  testTween := TTween.create(DummyButton.Left, DummyButton.Left + 100, 2.0);

  testTween
    .setEasing(@easeOutQuad)
    .onStart(@dummyOnStart)
    .onUpdate(@dummyOnUpdate)
    .onComplete(@dummyOnComplete)
    .play;

  TweenManager.add(testTween);
end;
```

This uses a similar pattern like in Phaser 3 with callback functions
