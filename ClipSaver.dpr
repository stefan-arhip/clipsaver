program ClipSaver;

uses
  Forms,
  _Main_ in '_Main_.pas' {Main_},
  _Screen_ in '_Screen_.pas' {Screen_};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMain_, Main_);
  Application.CreateForm(TScreen_, Screen_);
  Application.Run;
end.
