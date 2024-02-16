unit _Screen_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls;

type
  TScreen_ = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    Enter1: TMenuItem;
    procedure Iesire1Click(Sender: TObject);
    procedure Enter1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Screen_: TScreen_;

implementation

uses _Main_;

{$R *.DFM}

procedure TScreen_.Iesire1Click(Sender: TObject);
begin
  Screen_.Shape1.Visible:=False;
  Main_.ScreenShot (Main_.x1,Main_.y1,Main_.x2-Main_.x1,Main_.y2-Main_.y1,Main_.Image2.Picture.Bitmap);
  Screen_.Shape1.Visible:=True;
  Main_.IncarcareImagine;
  Close;
end;

procedure TScreen_.Enter1Click(Sender: TObject);
begin
  Main_.x1:=0;
  Main_.y1:=0;
  Main_.x2:=Screen.Width;
  Main_.y2:=Screen.Height;
  Screen_.Shape1.Visible:=False;
  Main_.ScreenShot (Main_.x1,Main_.y1,Main_.x2-Main_.x1,Main_.y2-Main_.y1,Main_.Image2.Picture.Bitmap);
  Screen_.Shape1.Visible:=True;
  Main_.IncarcareImagine;
  Close;
end;

procedure TScreen_.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Tag=0 Then
    Begin
      Main_.x1      :=x;
      Main_.y1      :=y;
      Tag           :=1;
      Shape1.Left   :=Main_.x1;
      Shape1.Top    :=Main_.y1;
      Shape1.Visible:=True;
    End
  Else
    Begin
      Main_.x2:=x;
      Main_.y2:=y;
      Shape1.Visible:=False;
      Label1.Visible:=False;
      Screen_.Repaint;
      Screen_.Shape1.Visible:=False;
      With Main_ Do
        Begin
          ScreenShot (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap);
          SpinEdit1.Value:=x1;
          SpinEdit2.Value:=y1;
          SpinEdit3.Value:=x2;
          SpinEdit6.Value:=y2;
        End;
      Screen_.Shape1.Visible:=True;
      Main_.IncarcareImagine;
      Close;
    End;
end;

procedure TScreen_.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  If Tag<>0 Then
    Begin
      Main_.x2     :=x;
      Main_.y2     :=y;
      Shape1.Width :=x-Main_.x1;
      Shape1.Height:=y-Main_.y1;
    End;
end;

procedure TScreen_.FormActivate(Sender: TObject);
begin
  Image1.Picture.Bitmap:=Main_.Image2.Picture.Bitmap;
  Shape1.Left          :=Main_.x1;
  Shape1.Top           :=Main_.y1;
  Shape1.Width         :=Main_.x2-Main_.x1;
  Shape1.Height        :=Main_.y2-Main_.y1;
  Shape1.Visible       :=True;
  Label1.Visible       :=True;
end;

procedure TScreen_.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Main_.WinHide Then
  Else
    Main_.Visible:=True;
end;

procedure TScreen_.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  If Tag<>0 Then
    Begin
      Main_.x2     :=Shape1.Left+x;
      Main_.y2     :=Shape1.Top +y;
      Shape1.Width :=Main_.x2-Main_.x1;
      Shape1.Height:=Main_.y2-Main_.y1;
    End;
end;

procedure TScreen_.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Tag=0 Then
    Begin
      Tag           :=1;
      Main_.x1      :=Shape1.Left+x;
      Main_.y1      :=Shape1.Top +y;
      Shape1.Left   :=Main_.x1;
      Shape1.Top    :=Main_.y1;
      Shape1.Visible:=True;
    End
  Else
    Begin
      Main_.x2      :=Shape1.Left+x;
      Main_.y2      :=Shape1.Top +y;
      Shape1.Visible:=False;
      Label1.Visible:=False;
      Screen_.Repaint;
      Screen_.Shape1.Visible:=False;
      With Main_ Do
        Begin
          ScreenShot (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap);
          SpinEdit1.Value:=x1;
          SpinEdit2.Value:=y1;
          SpinEdit3.Value:=x2;
          SpinEdit6.Value:=y2;
        End;
      Screen_.Shape1.Visible:=True;
      Main_.IncarcareImagine;
      Close;
    End;
end;

end.
