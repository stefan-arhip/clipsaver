unit _Main_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Tabnotbk, ExtCtrls, Buttons, Spin, ShellApi,
  fisHotKey, Jpeg, GIFImage, Menus, ShBrowseU, IniFiles, FileCtrl,
  _PersonalEdit_;

const wm_IconNotification = wm_User + 1909;

type
  TMain_ = class(TForm)
    fisHotKey2: TfisHotKey;
    PopupMenu1: TPopupMenu;
    AratainTASKBAR1: TMenuItem;
    N1: TMenuItem;
    Inchide1: TMenuItem;
    ImageList1: TImageList;
    Timer2: TTimer;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    fisHotKey1: TfisHotKey;
    Timer1: TTimer;
    TabbedNotebook1: TTabbedNotebook;
    Panel1: TPanel;
    Panel18: TPanel;
    Label7: TLabel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel19: TPanel;
    Panel20: TPanel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo1: TMemo;
    Panel4: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    HotKey1: THotKey;
    HotKey2: THotKey;
    Image1: TImage;
    Panel5: TPanel;
    Label1: TLabel;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    PersonalEdit1: TPersonalEdit;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit4: TSpinEdit;
    Panel6: TPanel;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit6: TSpinEdit;
    Label15: TLabel;
    Panel7: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel8: TPanel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel9: TPanel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    SpinEdit5: TSpinEdit;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    fisHotKey3: TfisHotKey;
    Label16: TLabel;
    HotKey3: THotKey;
    Panel10: TPanel;
    Label17: TLabel;
    Panel11: TPanel;
    Label18: TLabel;
    CheckBox1: TCheckBox;
    Label19: TLabel;
    SpinEdit7: TSpinEdit;
    Timer3: TTimer;
    Label20: TLabel;
    HotKey4: THotKey;
    fisHotKey4: TfisHotKey;
    Label21: TLabel;
    HotKey5: THotKey;
    fisHotKey5: TfisHotKey;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CheckBox2: TCheckBox;
    Image3: TImage;
    CheckBox3: TCheckBox;
    N2: TMenuItem;
    Zonacapturata1: TMenuItem;
    Realizeazacaptura1: TMenuItem;
    Oprestecaptura1: TMenuItem;
    CheckBox4: TCheckBox;
    procedure FormResize(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure fisHotKey2HotKey(Sender: TObject);
    procedure AratainTASKBAR1Click(Sender: TObject);
    procedure Inchide1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit6Change(Sender: TObject);
    procedure RefreshSpinValue;
    procedure SaveDialog1TypeChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure fisHotKey4HotKey(Sender: TObject);
    procedure fisHotKey3HotKey(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure SpinEdit7Change(Sender: TObject);
    procedure fisHotKey5HotKey(Sender: TObject);
    Procedure ControaleActive(Activare:Boolean);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    nid       :TNOTIFYICONDATA;
    TrayIconId:UINT;
    procedure  WMSysCommand    (var msg:TWMSysCommand);Message WM_SysCommand;
    function   AddTrayIconId   (iconId :UINT;icon:THandle;tip:PChar):Boolean;
    function   DeleteTrayIconId(iconId :UINT):Boolean;
    Procedure  HideFromTaskBar;
  public
    { Public declarations }
    x1,y1,x2,y2:Integer;
    ICO:TIcon;
    WinHide:Boolean;
    procedure ScreenShot(x,y,w,h:integer;bm:TBitMap);
    procedure IncarcareImagine;
    procedure CitireSetari(f:String);
    procedure ScriereSetari(f:String);
  protected
    procedure WMIconNotification(var Msg: TMessage); message wm_IconNotification;
  end;

Const DirectorAplicatie:String='';
      Extensie         :String='';
      nrCapturi        :LongInt=0;

var
  Main_: TMain_;

implementation

uses _Screen_;

Var  mHandle:THandle;    // Mutexhandle

{$R *.DFM}

(*procedure DrawCursor(ScreenShotBitmap : TBitmap);
var
  r: TRect;
  CI: TCursorInfo;
  Icon: TIcon;
  II: TIconInfo;
begin
  r := ScreenShotBitmap.Canvas.ClipRect;
  Icon := TIcon.Create;
  try
    CI.cbSize := SizeOf(CI);
    if GetCursorInfo(CI) then
      if CI.Flags = CURSOR_SHOWING then
      begin
        Icon.Handle := CopyIcon(CI.hCursor);
        if GetIconInfo(Icon.Handle, II) then
        begin
          ScreenShotBitmap.Canvas.Draw(
                ci.ptScreenPos.x - Integer(II.xHotspot) - r.Left,
                ci.ptScreenPos.y - Integer(II.yHotspot) - r.Top,
                Icon
                );
        end;
      end;
  finally
    Icon.Free;
  end;
end; *)

procedure ImageGrayScale(var AnImage: TImage);
var
  JPGImage: TJPEGImage;
  BMPImage: TBitmap;
  MemStream: TMemoryStream;
begin
  BMPImage := TBitmap.Create;
  try
    BMPImage.Width  := AnImage.Picture.Bitmap.Width;
    BMPImage.Height := AnImage.Picture.Bitmap.Height;

    JPGImage := TJPEGImage.Create;
    try
      JPGImage.Assign(AnImage.Picture.Bitmap);
      JPGImage.CompressionQuality := 100;
      JPGImage.Compress;
      JPGImage.Grayscale := True;

      BMPImage.Canvas.Draw(0, 0, JPGImage);

      MemStream := TMemoryStream.Create;
      try
        BMPImage.SaveToStream(MemStream);
        //you need to reset the position of the MemoryStream to 0
        MemStream.Position := 0;

        AnImage.Picture.Bitmap.LoadFromStream(MemStream);
        AnImage.Refresh;
      finally
        MemStream.Free;
      end;
    finally
      JPGImage.Free;
    end;
  finally
    BMPImage.Free;
  end;
end;//fin de ImageGrayScale

Procedure TMain_.CitireSetari(f:String);
Var
  ini:TIniFile;
begin
  ini:=TIniFile.Create(f);
  Try
    Memo3.Text           :=ini.ReadString ('Setari','Utilizator.','ORICINE');
    If Memo3.Text='' Then Memo3.Text:='ORICINE';
    Edit4.Text           :=ini.ReadString ('Setari','Director  .',Edit4.Text);
    If Not DirectoryExists(Edit4.Text) Then
      Edit4.Text:=DirectorAplicatie;
    PersonalEdit1.Text   :=ini.ReadString ('Setari','Fisier    .',PersonalEdit1.Text);
    If PersonalEdit1.Text='' Then PersonalEdit1.Text:='imagine';
    SpinEdit4.Value      :=ini.ReadInteger('Setari','Index     .',SpinEdit4.Value);
    If SpinEdit4.Value<1 Then SpinEdit4.Value:=1;
    ComboBox1.ItemIndex  :=ini.ReadInteger('Setari','Extensie  .',ComboBox1.ItemIndex);
    If ComboBox1.ItemIndex<0 Then ComboBox1.ItemIndex:=0;
    If ComboBox1.ItemIndex<2 Then ComboBox1.ItemIndex:=2;
    SpinEdit5.Value      :=ini.ReadInteger('Setari','Calitate  .',SpinEdit5.Value);
    If SpinEdit5.Value<1   Then SpinEdit5.Value:=1;
    If SpinEdit5.Value>100 Then SpinEdit5.Value:=100;
    ComboBox2.ItemIndex  :=ini.ReadInteger('Setari','Culori    .',ComboBox2.ItemIndex);
    x1                   :=ini.ReadInteger('Setari','x1        .',SpinEdit1.Value);
    If x1<0             Then x1:=0;
    If x1>Screen.Width  Then x1:=Screen.Width;
    SpinEdit1.Value:=x1;
    y1                   :=ini.ReadInteger('Setari','y1        .',SpinEdit2.Value);
    If y1<0             Then y1:=0;
    If y1>Screen.Width  Then y1:=Screen.Width;
    SpinEdit2.Value:=y1;
    x2                   :=ini.ReadInteger('Setari','x2        .',SpinEdit3.Value);
    If x2<0             Then x2:=0;
    If x2>Screen.Width  Then x2:=Screen.Width;
    SpinEdit3.Value:=x2;
    y2                   :=ini.ReadInteger('Setari','y2        .',SpinEdit6.Value);
    If y2<0             Then y2:=0;
    If y2>Screen.Height Then y2:=Screen.Height;
    SpinEdit6.Value:=y2;
    HotKey1.HotKey       :=TextToShortCut(ini.ReadString('Setari','Zona      .','F8'));
    HotKey2.HotKey       :=TextToShortCut(ini.ReadString('Setari','Captura   .','F9'));
    RadioButton1.Checked :=ini.ReadBool('Setari','Autosalvare',RadioButton1.Checked);
    RadioButton2.Checked :=Not RadioButton1.Checked;
    RadioButton1Click(Self);
    RadioButton3.Checked :=ini.ReadBool('Setari','Zona ecran.',RadioButton3.Checked);
    RadioButton4.Checked :=Not RadioButton3.Checked;
    RadioButton3Click(Self);
    CheckBox1.Checked    :=ini.ReadBool('Setari','Programare.',CheckBox1.Checked);
    CheckBox1Click(Self);
    SpinEdit7.Value      :=ini.ReadInteger('Setari','Interval  .',SpinEdit7.Value);
    SpinEdit7Change(Self);
    CheckBox2.Checked    :=ini.ReadBool('Setari','Imag.difer.',CheckBox2.Checked);
    CheckBox2Click(Self);
  Finally
    ini.Free;
  End;
end;

Procedure TMain_.ScriereSetari(f:String);
Var
  ini:TIniFile;
begin
  ini:=TIniFile.Create(f);
  Try
    ini.WriteString ('Setari','Utilizator.',Memo3.Text);
    ini.WriteString ('Setari','Director  .',Edit4.Text);
    ini.WriteString ('Setari','Fisier    .',PersonalEdit1.Text);
    ini.WriteInteger('Setari','Index     .',SpinEdit4.Value);
    ini.WriteInteger('Setari','Extensie  .',ComboBox1.ItemIndex);
    ini.WriteInteger('Setari','Calitate  .',SpinEdit5.Value);
    ini.WriteInteger('Setari','Culori    .',ComboBox2.ItemIndex);
    ini.WriteInteger('Setari','x1        .',x1);
    ini.WriteInteger('Setari','y1        .',y1);
    ini.WriteInteger('Setari','x2        .',x2);
    ini.WriteInteger('Setari','y2        .',y2);
    ini.WriteString ('Setari','Zona      .',ShortCutToText(fisHotKey1.Key));
    ini.WriteString ('Setari','Captura   .',ShortCutToText(fisHotKey2.Key));
    ini.WriteBool   ('Setari','Autosalvare',RadioButton1.Checked);
    ini.WriteBool   ('Setari','Zona ecran.',RadioButton3.Checked);
    ini.WriteBool   ('Setari','Programare.',CheckBox1.Checked);
    ini.WriteInteger('Setari','Interval  .',SpinEdit7.Value);
    ini.WriteBool   ('Setari','Imag.difer.',CheckBox2.Checked);
  Finally
    ini.Free;
  End;
end;

procedure TMain_.IncarcareImagine;
Var xy1,xy2:Extended;
Begin
  Image1.Picture   :=Image2.Picture;
  xy1              :=Image2.Width/Image2.Height;
  xy2              :=Panel4.Width/Panel4.Height;
  If ((xy1<=1) And (xy2<=1) And (xy1<=xy2)) Or
     ((xy1<=1) And (xy2> 1) And (xy1<=xy2)) Or
     ((xy1<=1) And (xy2> 1) And (xy1> xy2)) Or
     ((xy1> 1) And (xy2> 1) And (xy1<=xy2)) Then
    Begin
      Image1.Height:=Panel4.Height;
      Image1.Width :=Round(Image1.Height*xy1);
    End;
  If ((xy1<=1) And (xy2<=1) And (xy1> xy2)) Or
     ((xy1> 1) And (xy2<=1) And (xy1<=xy2)) Or
     ((xy1> 1) And (xy2<=1) And (xy1> xy2)) Or
     ((xy1> 1) And (xy2> 1) And (xy1> xy2)) Then
    Begin
      Image1.Width :=Panel4.Width;
      Image1.Height:=Round(Image1.Width/xy1);
    End;
  Image1.Left      :=(Panel4.Width -Image1.Width ) Div 2;
  Image1.Top       :=(Panel4.Height-Image1.Height) Div 2;
  Case ComboBox2.ItemIndex Of
    0:Image1.Picture.Bitmap.PixelFormat:=pf1bit;
    1:Image1.Picture.Bitmap.PixelFormat:=pf4bit;
    2:Image1.Picture.Bitmap.PixelFormat:=pf8bit;
    3:Image1.Picture.Bitmap.PixelFormat:=pf16bit;
    4:Image1.Picture.Bitmap.PixelFormat:=pf24bit;
    5:Image1.Picture.Bitmap.PixelFormat:=pf32bit;
  End;
  Image1.Repaint;
End;

procedure TMain_.ScreenShot(x,y,w,h:Integer;bm:TBitMap);
var
  dc    :HDC;
  lpPal :PLOGPALETTE;
begin
  If w<0 Then
    Begin
      x :=x+w+1;
      w := -w-2;
    End;
  If h<0 Then
    Begin
      y :=y+h+1;
      h := -h-2;
    End;
  {test width and height}
  If ((w=0) Or (h=0)) Then exit;
  bm.Width  :=w;
  bm.Height :=h;
  {get the screen dc}
  dc := GetDc(0);
  if (dc = 0) then exit;
  {do we have a palette device?}
  if (GetDeviceCaps(dc, RASTERCAPS) AND RC_PALETTE = RC_PALETTE) then begin
     {allocate memory for a logical palette}
     GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
     {zero it out to be neat}
     FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0);
     {fill in the palette version}
     lpPal^.palVersion := $300;
     {grab the system palette entries}
     lpPal^.palNumEntries := GetSystemPaletteEntries(dc, 0, 256, lpPal^.palPalEntry);
     if (lpPal^.PalNumEntries <> 0) then begin
         {create the palette}
         bm.Palette := CreatePalette(lpPal^);
     end;
     FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
  end;
  {copy from the screen to the bitmap}
  BitBlt(bm.Canvas.Handle, 0, 0, w, h, Dc, x, y, SRCCOPY);
  {release the screen dc}
  ReleaseDc(0, dc);
end;

procedure TMain_.FormResize(Sender: TObject);
begin
  If Width <400 Then Width :=400;
  If Height<343 Then Height:=343;
  Panel18.Left  :=(TabbedNotebook1.Width - 8-Panel18.Width)  Div 2;
  Panel18.Top   :=(TabbedNotebook1.Height-30-Panel18.Height) Div 2;
  Panel2 .Left  :=Panel18.Left;
  Panel2 .Top   :=Panel18.Top;
  Panel3 .Left  :=Panel18.Left;
  Panel3 .Top   :=Panel18.Top;
  Main_.IncarcareImagine;
end;

procedure TMain_.Label9Click(Sender: TObject);
Var t:Array[0..79]Of Char;
begin
  StrPCopy(t,Label9.Caption);
  ShellExecute(0, Nil, t, Nil, Nil, SW_NORMAL);
end;

procedure TMain_.Image1Click(Sender: TObject);
begin
  Main_.Visible:=False;
  Screen_.Left          :=0;
  Screen_.Top           :=0;
  Screen_.Width         :=Screen.Width;
  Screen_.Height        :=Screen.Height;
  Screen_.Label1.Left   :=(Screen_.Width -Screen_.Label1.Width) Div 2;
  Screen_.Label1.Top    :=(Screen_.Height-Screen_.Label1.Height) Div 2;
  Screen_.Label1.Visible:=False;
  Screen_.Shape1.Visible:=False;
  SleepEx(50, False);
//  MessageDlg('Selecteaza zona de ecran ce urmeaza a fi salvata.',mtInformation,[mbOk],0);
  ScreenShot              (0,0,Screen.Width,Screen.Height,Image2.Picture.Bitmap);
  Screen_.Shape1.Visible:=True;
  Screen_.Label1.Visible:=True;
  Screen_.Tag:=0;
  Screen_.Show;
end;

Function StrToNumber(s:String):Integer;
var I, Code: Integer;
begin
  { Get text from TEdit control }
  Val(s, I, Code);
  { Error during conversion to integer? }
  if code <> 0 then
    Result:=I
  else
    Result:=0;
end;

procedure TMain_.FormCreate(Sender: TObject);
Var sec:Integer;
begin
  WinHide:=False;
  mHandle:=CreateMutex(Nil,True,'ClipSAVER');
  If GetLastError=ERROR_ALREADY_EXISTS Then
    Begin
      MessageDlg('Aplicatia este deja lansata in executie!',mtInformation,[mbOk],0);
      Halt;
    End;
  DirectorAplicatie     :=ExtractFileDir(Application.ExeName);
  If DirectorAplicatie    [Length(DirectorAplicatie)]<>'\' Then
    DirectorAplicatie   :=DirectorAplicatie+'\';
  ICO                   :=TIcon.Create;
  nid.cbSize            :=SizeOf(TNOTIFYICONDATA);
  nid.Wnd               :=Handle;
  nid.uFlags            :=NIF_MESSAGE Or NIF_ICON Or NIF_TIP;
  nid.uCallbackMessage  :=wm_IconNotification;
  Edit4.Text            :=DirectorAplicatie;
  SaveDialog1.InitialDir:=DirectorAplicatie;
  PersonalEdit1.Text    :='imagine';
  SpinEdit4.Value       :=1;
  ComboBox1.ItemIndex   :=2;  //  GIF
  ComboBox1Change         (Sender);
  SpinEdit5.Value       :=30; // pentru JPG
  ComboBox2.ItemIndex   :=1;  // 4 biti
  HotKey1.HotKey        :=fisHotKey1.Key;
  HotKey2.HotKey        :=fisHotKey2.Key;
  SpinEdit1.MinValue    :=0;
  SpinEdit1.MaxValue    :=Screen.Width;
  SpinEdit2.MinValue    :=0;
  SpinEdit2.MaxValue    :=Screen.Height;
  SpinEdit3.MinValue    :=0;
  SpinEdit3.MaxValue    :=Screen.Width;
  SpinEdit6.MinValue    :=0;
  SpinEdit6.MaxValue    :=Screen.Height;
  CitireSetari(DirectorAplicatie+'ClipSAVER.INI');
  //Screen_.Shape1.Visible:=False;
  If RadioButton3.Checked Then
    ScreenShot              (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap)
  Else
    ScreenShot              (0,0,Screen.Width,Screen.Height,Image2.Picture.Bitmap);
  //Screen_.Shape1.Visible:=True;
  Main_.IncarcareImagine;
  Image3.Picture:=Image1.Picture;
  TabbedNoteBook1.PageIndex:=0;
  If ParamStr(1)='h' Then
      Begin
        CheckBox4.Checked:=True;
        SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
        RadioButton1.Checked:=True;
        CheckBox1.Checked:=True;
        Sec:=StrToNumber(ParamStr(2));
        If Sec=0 Then Sec:=5;
        SpinEdit7.Value:=Sec;
        CheckBox2.Checked:=True;
        CheckBox3.Checked:=True;//monocrom
        RadioButton1.Checked:=True;
        ComboBox1.ItemIndex:=2;//GIF
        ComboBox2.ItemIndex:=1;//4 biti - 16 culori
        Edit4.Text:=DirectorAplicatie;//directorul aplicatiei
        PersonalEdit1.Text:=FormatDateTime('yyyymmdd-',Now);
        SpinEdit4.Value:=0;
      End;
end;

procedure TMain_.ComboBox1Change(Sender: TObject);
begin
  Label2   .Enabled:=ComboBox1.ItemIndex=1; // JPG
  SpinEdit5.Enabled:=ComboBox1.ItemIndex=1; // JPG
  Case ComboBox1.ItemIndex of
    0:Extensie:='.BMP';
    1:Extensie:='.JPG';
    2:Extensie:='.GIF';
  End;
  RefreshSpinValue;
end;

Procedure SaveJpeg(f:String;BitMap:TBitMap;Quality:TJPEGQualityRange);
Var JpegImage:TJpegImage;
Begin
  Try
    JPEGImage:=TJPEGImage.Create;
    JPEGImage.CompressionQuality:=Quality;  // 1..100
    JPEGImage.Assign(Bitmap);
    JPEGImage.SaveToFile(f);
  Finally
    JPEGImage.Free;
  End;
End;

Procedure SaveGif(f:String;Bitmap:TBitmap);
Var GIF:TGifImage;
Begin
  Try
    GIF:=TGIFImage.Create;
    Try
      GIF.Assign(Bitmap);                 // Save the GIF
      GIF.Optimize([ooCrop,ooMerge,ooCleanup,ooColorMap,ooReduceColors],
                   rmWindows256,
                   dmNearest,
                   256);
      GIF.SaveToFile(f);                  // Display the GIF
    Finally
      GIF.Free;
    End;
  Finally
    //
  End;
End;

Function Add5Zero(s:String):String;
Begin
  While Length(s)<5 Do
    s:='0'+s;
  Result:=s;
End;

Procedure TMain_.ControaleActive(Activare:Boolean);
Begin
  RadioButton1      .Enabled:=Activare;
  RadioButton2      .Enabled:=Activare;
  CheckBox1         .Enabled:=Activare And RadioButton1.Checked;
  Label1            .Enabled:=Activare;
  Edit4             .Enabled:=Activare;
  BitBtn1           .Enabled:=Activare;
  Label4            .Enabled:=Activare;
  PersonalEdit1     .Enabled:=Activare;
  Label5            .Enabled:=Activare;
  SpinEdit4         .Enabled:=Activare;
  Label19           .Enabled:=Activare And CheckBox1.Checked;
  SpinEdit7         .Enabled:=Activare And CheckBox1.Checked;
  Label17           .Enabled:=Activare;
  RadioButton3      .Enabled:=Activare;
  RadioButton4      .Enabled:=Activare;
  Label8            .Enabled:=Activare And RadioButton3.Checked=True;
  SpinEdit1         .Enabled:=Activare And RadioButton3.Checked=True;
  Label13           .Enabled:=Activare And RadioButton3.Checked=True;
  SpinEdit2         .Enabled:=Activare And RadioButton3.Checked=True;
  Label14           .Enabled:=Activare And RadioButton3.Checked=True;
  SpinEdit3         .Enabled:=Activare And RadioButton3.Checked=True;
  Label15           .Enabled:=Activare And RadioButton3.Checked=True;
  SpinEdit6         .Enabled:=Activare And RadioButton3.Checked=True;
  BitBtn7           .Enabled:=Activare And RadioButton3.Checked=True;
  Label18           .Enabled:=Activare;
  Label6            .Enabled:=Activare;
  ComboBox1         .Enabled:=Activare;
  Label2            .Enabled:=Activare And (ComboBox1.ItemIndex=1);
  SpinEdit5         .Enabled:=Activare And (ComboBox1.ItemIndex=1);
  Label3            .Enabled:=Activare;
  ComboBox2         .Enabled:=Activare;
  Label11           .Enabled:=Activare;
  HotKey1           .Enabled:=Activare;
  Label12           .Enabled:=Activare;
  HotKey2           .Enabled:=Activare;
  //Label16         .Enabled:=Activare;
  //HotKey3         .Enabled:=Activare;
  //Label20           .Enabled:=Activare;
  //HotKey4           .Enabled:=Activare;
  //Label21           .Enabled:=Activare;
  //HotKey5           .Enabled:=Activare;
  BitBtn2           .Enabled:=Activare;
  Zonacapturata1    .Enabled:=BitBtn2.Enabled;
  BitBtn3           .Enabled:=Activare;
  Realizeazacaptura1.Enabled:=BitBtn3.Enabled;
  CheckBox2         .Enabled:=BitBtn3.Enabled;
  CheckBox3         .Enabled:=BitBtn3.Enabled;
  //BitBtn4         .Enabled:=Activare;
  //BitBtn5         .Enabled:=Activare;
  //BitBtn6         .Enabled:=Activare;
End;

procedure TMain_.fisHotKey2HotKey(Sender: TObject);
Var f:String;
begin
  If CheckBox4.Checked Then
    Main_.Hide;
  Screen_.Shape1.Visible:=False;
  If RadioButton3.Checked Then
    Main_.ScreenShot (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap)
  Else
    Main_.ScreenShot (0,0,Screen.Width,Screen.Height,Image2.Picture.Bitmap);
  Screen_.Shape1.Visible:=True;
  Main_.IncarcareImagine;
  If RadioButton1.Checked Then
    Begin
      If CheckBox1.Checked Then
        Begin
          If CheckBox4.Checked Then
            Begin
              nrCapturi:=0;
              ControaleActive(False);
              Timer3.Enabled:=True;
            End
          Else
            If MessageDlg('Se captureaza zona de ecran: '+
                          '('+IntToStr(x1)+','+IntToStr(y1)+') x '+
                          '('+IntToStr(x2)+','+IntToStr(y2)+')'+#13+
                          'la un interval de '+IntToStr(SpinEdit7.Value)+' secunde,'+#13+
                          'in directorul "'+Edit4.Text+'"?',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
              Begin
                nrCapturi:=0;
                ControaleActive(False);
                Timer3.Enabled:=True;
              End;
        End
      Else
        Begin
          Repeat
            f:=Edit4.Text+PersonalEdit1.Text+'-'+Add5Zero(IntToStr(SpinEdit4.Value))+Extensie;
            SpinEdit4.Value:=SpinEdit4.Value+1;
          Until Not FileExists(f);
          If CheckBox3.Checked Then ImageGrayScale(Image1);
          Case ComboBox1.ItemIndex Of
            0:           Image1.Picture.Bitmap.SaveToFile(f);
            1:SaveJpeg(f,Image1.Picture.Bitmap,SpinEdit5.Value);
            2:SaveGif (f,Image1.Picture.Bitmap);
          End;
        End;
    End
  Else
    Begin
      Case ComboBox1.ItemIndex Of
        0:SaveDialog1.DefaultExt:='BMP';
        1:SaveDialog1.DefaultExt:='JPG';
        2:SaveDialog1.DefaultExt:='GIF';
      End;
      SaveDialog1.FilterIndex:=ComboBox1.ItemIndex+1;
      If SaveDialog1.Execute Then
        Begin
          If CheckBox3.Checked Then ImageGrayScale(Image1);
          Case SaveDialog1.FilterIndex Of
            1:                              Image1.Picture.Bitmap.SaveToFile(SaveDialog1.FileName);
            2:SaveJpeg(SaveDialog1.FileName,Image1.Picture.Bitmap,SpinEdit5.Value);
            3:SaveGif (SaveDialog1.FileName,Image1.Picture.Bitmap);
          End;
//          Label17      .Caption:='Cere numele fisierului la salvare.'+#13+
//                                 'Directorul implicit in care se salveaza imaginile:'+#13+
//                                 '"'+SaveDialog1.InitialDir+'"';
        End;
    End;
End;

function TMain_.AddTrayIconId(iconId: UINT; icon: THandle; tip: PChar): boolean;
begin
  nid.uID:=iconId;
  nid.hIcon:=icon;
  If tip<>Nil Then
    StrLCopy(nid.szTip, tip, SizeOf(nid.szTip))
  Else
    nid.szTip[0] := #0;
  Result := Shell_NotifyIcon(NIM_ADD, @nid);
end;

function TMain_.DeleteTrayIconId(iconId: UINT): boolean;
begin
  nid.uId:=iconId;
  Result :=Shell_NotifyIcon(NIM_DELETE, @nid);
  nid.hIcon:=0;
end;

procedure TMain_.WMIconNotification(var Msg: TMessage);
var
  MouseMsg:Longint;
  Pt:TPoint;
begin
  MouseMsg:=Msg.LParam;
  Case MouseMsg Of
    wm_LButtonUp:
      AratainTASKBAR1Click(self);
    wm_RButtonUp:
      Begin
        GetCursorPos(Pt);
        popupmenu1.PopUp(Pt.X,Pt.Y);
      End;
  end;
end;

Procedure TMain_.HideFromTaskBar;
Begin
  ImageList1.GetIcon(0,ICO);
  AddTrayIconId     (0,ICO.Handle,'ClipSAVER v1');
  Hide;
End;

procedure TMain_.WMSysCommand(Var msg:TWMSysCommand);
begin
  If msg.CmdType And $FFF0=SC_MINIMIZE Then
    Begin
      WinHide:=True;
      HideFromTaskBar;
    End
  Else
    Inherited;
end;

procedure TMain_.AratainTASKBAR1Click(Sender: TObject);
begin
  BringToFront;
  If Not Visible Then
    Begin
      WinHide:=False;
      Visible:=True;
      DeleteTrayIconId(TrayIconID);
      ImageList1.GetIcon(0, ICO);
    End;
end;

procedure TMain_.Inchide1Click(Sender: TObject);
begin
  DeleteTrayIconId(TrayIconID);
  Main_.Close;
end;

procedure TMain_.Timer2Timer(Sender: TObject);
begin
  HideFromTaskBar;
  Timer2.Enabled:=False;
end;

procedure TMain_.BitBtn1Click(Sender: TObject);
Var s:String;
begin
  //FormStyle:=fsNormal;
  Hide;
  With TShBrowse.Create Do
    Begin
      Caption:='Selectare director';
      UserMessage:='Selecteaza directorul in care se vor salva imaginile:';
      InitFolder:=Edit4.Text;
      If Execute Then
        Begin
          s:=Folder;
          If s[Length(s)]<>'\' Then
            s:=s+'\';
          Edit4.Text:=s;
        End;
      Free;
  End;
  //FormStyle:=fsStayOnTop;
  Show;
end;

procedure TMain_.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If Not CheckBox4.Checked Then
    If MessageDlg('Se inchide aplicatia?',mtConfirmation,[mbYes,mbNo],0)=mrYes Then
      Begin
  //      WinMax:=Main_.WindowState:=wsMaximized;
        If (x1>=x2) Then
          Begin
            If x1<Screen.Width Then
              x2:=x1+1
            Else
              x1:=x2-1;
            MessageDlg('Au fost ajustate valorile incorect introduse pe x!',mtInformation,[mbOk],0);
          End;
        If (y1>=y2) Then
          Begin
            If y1<Screen.Height Then
              y2:=y1+1
            Else
              y1:=y2-1;
            MessageDlg('Au fost ajustate valorile incorect introduse pe y!',mtInformation,[mbOk],0);
          End;
        ScriereSetari(DirectorAplicatie+'ClipSAVER.INI');
        If mHandle<>0 Then CloseHandle(mHandle);
      End
    Else
      CanClose:=False;
end;

procedure TMain_.Timer1Timer(Sender: TObject);
begin
  If fisHotKey1.Key<>HotKey1.HotKey Then
    fisHotKey1.Key:=HotKey1.HotKey;
  If fisHotKey2.Key<>HotKey2.HotKey Then
    fisHotKey2.Key:=HotKey2.HotKey;
  If fisHotKey3.Key<>HotKey3.HotKey Then
    fisHotKey3.Key:=HotKey3.HotKey;
  If fisHotKey4.Key<>HotKey4.HotKey Then
    fisHotKey4.Key:=HotKey4.HotKey;
  If fisHotKey5.Key<>HotKey5.HotKey Then
    fisHotKey5.Key:=HotKey5.HotKey;
end;

procedure TMain_.ComboBox2Change(Sender: TObject);
begin
  RefreshSpinValue;
end;

procedure TMain_.TabbedNotebook1Change(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  FormResize(Sender);
end;

procedure TMain_.RadioButton1Click(Sender: TObject);
begin
  Label1       .Enabled:=RadioButton1.Checked=True;
  Edit4        .Enabled:=RadioButton1.Checked=True;
  BitBtn1      .Enabled:=RadioButton1.Checked=True;
  Label4       .Enabled:=RadioButton1.Checked=True;
  PersonalEdit1.Enabled:=RadioButton1.Checked=True;
  Label5       .Enabled:=RadioButton1.Checked=True;
  SpinEdit4    .Enabled:=RadioButton1.Checked=True;
  Panel5       .Visible:=RadioButton1.Checked=True;
  Panel10      .Visible:=RadioButton2.Checked=True;
  Label17      .Caption:='Cere numele fisierului la salvare.'+#13+
                         'Directorul implicit in care se salveaza imaginile:'+#13+
                         '"'+SaveDialog1.InitialDir+'"';
  CheckBox1.Enabled:=RadioButton1.Checked;
  CheckBox2.Enabled:=CheckBox1.Enabled;
  CheckBox1Click(Sender);                       
  RefreshSpinValue;
end;

procedure TMain_.RadioButton3Click(Sender: TObject);
begin
  Label8   .Enabled:=RadioButton3.Checked=True;
  SpinEdit1.Enabled:=RadioButton3.Checked=True;
  Label13  .Enabled:=RadioButton3.Checked=True;
  SpinEdit2.Enabled:=RadioButton3.Checked=True;
  Label14  .Enabled:=RadioButton3.Checked=True;
  SpinEdit3.Enabled:=RadioButton3.Checked=True;
  Label15  .Enabled:=RadioButton3.Checked=True;
  SpinEdit6.Enabled:=RadioButton3.Checked=True;
  BitBtn7  .Enabled:=RadioButton3.Checked=True;
  Panel6   .Visible:=RadioButton3.Checked=True;
  Panel11  .Visible:=RadioButton3.Checked=False;
  Label18  .Caption:='Captura a intregului ecran.'+#13+
                     'Dimensiunile zonei capturate:'+#13+
                     '(0,0) x ('+IntToStr(Screen.Width)+','+IntToStr(Screen.Height)+')';
  RefreshSpinValue;
end;

Function RedIsFalse(b:Boolean):TColor;
Begin
  If b Then
    Result:=clBlack
  Else
    Result:=clRed;
End;

Procedure TMain_.RefreshSpinValue;
Begin
  Label8   .Font.Color:=RedIsFalse(x1<x2);
  SpinEdit1.Font.Color:=RedIsFalse(x1<x2);
  Label13  .Font.Color:=RedIsFalse(y1<y2);
  SpinEdit2.Font.Color:=RedIsFalse(y1<y2);
  Label15  .Font.Color:=RedIsFalse(y1<y2);
  Label14  .Font.Color:=RedIsFalse(x1<x2);
  SpinEdit3.Font.Color:=RedIsFalse(x1<x2);
  SpinEdit6.Font.Color:=RedIsFalse(y1<y2);
  If (x1<x2) And (y1<y2) Then
    Begin
      If RadioButton3.Checked Then
        ScreenShot              (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap)
      Else
        ScreenShot              (0,0,Screen.Width,Screen.Height,Image2.Picture.Bitmap);
      //Main_.IncarcareImagine;
    End;
  Main_.IncarcareImagine;  
End;

procedure TMain_.SpinEdit1Change(Sender: TObject);
begin
  x1                  :=SpinEdit1.Value;
  RefreshSpinValue;
end;

procedure TMain_.SpinEdit2Change(Sender: TObject);
begin
  y1                  :=SpinEdit2.Value;
  RefreshSpinValue;
end;

procedure TMain_.SpinEdit3Change(Sender: TObject);
begin
  x2:=SpinEdit3.Value;
  RefreshSpinValue;
end;

procedure TMain_.SpinEdit6Change(Sender: TObject);
begin
  y2:=SpinEdit6.Value;
  RefreshSpinValue;
end;

procedure TMain_.SaveDialog1TypeChange(Sender: TObject);
begin
  Case SaveDialog1.FilterIndex Of
    1:SaveDialog1.DefaultExt:='BMP';
    2:SaveDialog1.DefaultExt:='JPG';
    3:SaveDialog1.DefaultExt:='GIF';
  End;
  ComboBox1.ItemIndex:=SaveDialog1.FilterIndex-1;
  ComboBox1Change(Sender);
end;

procedure TMain_.CheckBox1Click(Sender: TObject);
begin
  Label19  .Enabled:=CheckBox1.Checked;
  SpinEdit7.Enabled:=CheckBox1.Checked;
end;

procedure TMain_.fisHotKey4HotKey(Sender: TObject);
begin
  Close;
end;

procedure TMain_.fisHotKey3HotKey(Sender: TObject);
begin
  Timer3.Enabled:=False;
  ShowMessage('Captura automata programata s-a incheiat!'+#13+
              'S-au efectuat '+IntToStr(nrCapturi)+' capturi.');
  ControaleActive(True);
end;

Function ImaginiDiferite(Image1,Image2:TImage):Integer;
var
  b1, b2: TBitmap;
  c1, c2: PByte;
  x, y, different: Integer; // Counter for different pixels
begin
  Try
    b1 := Image1.Picture.Bitmap;
    b2 := Image2.Picture.Bitmap;
    Assert(b1.PixelFormat = b2.PixelFormat); // they have to be equal
    different := 0;
    for y := 0 to b1.Height - 1 do
    begin
      c1 := b1.Scanline[y];
      c2 := b2.Scanline[y];
      for x := 0 to b1.Width - 1 do
     //   for i := 0 to {BytesPerPixel - 1}spinedit1.value do // 1, to 4, dep. on pixelformat
        begin
          Inc(different, Integer(c1^ <> c2^));
          Inc(c1);
          Inc(c2);
        end;
    end;
  Finally
  End;
  Result:=different;
end;

(*function BitmapDifference(BmpA, BmpB: TBitmap): double;
var
  x, y: integer;
  P, Q: PByte;
  Diff: double;
begin
  Assert(BmpA.PixelFormat = BmpB.PixelFormat);
  if not assigned(BmpA) or not assigned(BmpB)
  or (BmpA.PixelFormat <> pf24bit) or (BmpB.PixelFormat <> pf24bit)
  or (BmpA.Width <> BmpB.Width) or (BmpA.Height <> BmpB.Height)
  or (BmpA.Width * BmpA.Height = 0) then
    begin //raise Exception.Create('Cannot compare bitmaps');
      result:=1000;
    end
  else
    begin
      Diff := 0;
      for y := 0 to BmpA.Height - 1 do begin
        P := BmpA.Scanline[y];
        Q := BmpB.Scanline[y];
        for x := 0 to BmpA.Width - 1 do begin
          Diff := Diff + Sqr(P^ - Q^); inc(P); inc(Q);
          Diff := Diff + Sqr(P^ - Q^); inc(P); inc(Q);
          Diff := Diff + Sqr(P^ - Q^); inc(P); inc(Q);
        end;
      end;
      Result := Sqrt(Diff / (BmpA.Width * BmpA.Height));
    end;
end;*)

function BitmapsAreEqual(const B1, B2: TBitmap): Boolean;
var
  ms1: TMemoryStream;
  ms2: TMemoryStream;
begin
  Result := False;
  ms1    := TMemoryStream.Create;
  try
    B1.SaveToStream(ms1);
    ms2 := TMemoryStream.Create;
    try
      B2.SaveToStream(ms2);
      if ms1.Size = ms2.Size then
        Result := CompareMem(ms1.Memory, ms2.Memory, ms1.Size)
      finally
        ms2.Free
    end
  finally
    ms1.Free
  end
end;

procedure TMain_.Timer3Timer(Sender: TObject);
Var f:String;
begin
  Screen_.Shape1.Visible:=False;
  If RadioButton3.Checked Then
    Main_.ScreenShot (x1,y1,x2-x1,y2-y1,Image2.Picture.Bitmap)
  Else
    Main_.ScreenShot (0,0,Screen.Width,Screen.Height,Image2.Picture.Bitmap);
  Screen_.Shape1.Visible:=True;
  Main_.IncarcareImagine;
  If CheckBox2.Checked And (Not BitmapsAreEqual(Image1.Picture.Bitmap,Image3.Picture.Bitmap)) Then //(ImaginiDiferite(Image1,Image3)<>0) Then
    Begin
      Repeat
        f:=Edit4.Text+PersonalEdit1.Text+'-'+Add5Zero(IntToStr(SpinEdit4.Value))+Extensie;
        SpinEdit4.Value:=SpinEdit4.Value+1;
      Until Not FileExists(f);
      If CheckBox3.Checked Then ImageGrayScale(Image1);
      Case ComboBox1.ItemIndex Of
        0:           Image1.Picture.Bitmap.SaveToFile(f);
        1:SaveJpeg(f,Image1.Picture.Bitmap,SpinEdit5.Value);
        2:SaveGif (f,Image1.Picture.Bitmap);
      End;
    End;
  Image3.Picture:=Image1.Picture;
  Inc(nrCapturi);
end;

procedure TMain_.SpinEdit7Change(Sender: TObject);
begin
  Timer3.Interval:=1000*SpinEdit7.Value;
end;

procedure TMain_.fisHotKey5HotKey(Sender: TObject);
begin
  If Visible Then
    //Visible:=False
    HideFromTaskBar
  Else
    AratainTASKBAR1Click(Sender);
end;              

procedure TMain_.CheckBox2Click(Sender: TObject);
begin
  //
end;    

procedure TMain_.FormActivate(Sender: TObject);
begin
  If CheckBox4.Checked Then
    fisHotKey2HotKey(Sender);
end;

end.
