program project;

{$Mode ObjFPC}
{$H+}

uses
  Interfaces,  { this includes the LCL widgetset }
  Forms, Unit1
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

