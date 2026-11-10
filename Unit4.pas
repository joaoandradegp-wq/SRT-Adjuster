unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Math, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Winapi.ShellAPI, Vcl.Buttons, Vcl.WinXCtrls;

type
  Tsplash_screen = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FIndicator: TActivityIndicator;
  public
    { Public declarations }
    procedure AjustarTamanho;
  end;

var
  Splash_Screen: Tsplash_screen;

implementation

uses Unit1, Language;

{$R *.dfm}

procedure Tsplash_screen.AjustarTamanho;
const
PERC_MAX = 0.38;
var
PicW, PicH, MaxW, MaxH, NewW, NewH: Integer;
Esc: Double;
Src, Dst: TBitmap;
begin
PicW := Image1.Picture.Width;
PicH := Image1.Picture.Height;

  if (PicW <= 0) or (PicH <= 0) then
  Exit;

MaxW := Round((Monitor.WorkareaRect.Right - Monitor.WorkareaRect.Left) * PERC_MAX);
MaxH := Round((Monitor.WorkareaRect.Bottom - Monitor.WorkareaRect.Top) * PERC_MAX);

Esc := Min(MaxW / PicW, MaxH / PicH);

  if Esc > 1 then
  Esc := 1;

NewW := Round(PicW * Esc);
NewH := Round(PicH * Esc);

  if Esc < 1 then
  begin
    Src := TBitmap.Create;
    Dst := TBitmap.Create;
    try
      Src.Assign(Image1.Picture.Graphic);
      Src.PixelFormat := pf24bit;
      Dst.PixelFormat := pf24bit;
      Dst.SetSize(NewW, NewH);
      SetStretchBltMode(Dst.Canvas.Handle, HALFTONE);
      SetBrushOrgEx(Dst.Canvas.Handle, 0, 0, nil);
      StretchBlt(Dst.Canvas.Handle, 0, 0, NewW, NewH,
        Src.Canvas.Handle, 0, 0, PicW, PicH, SRCCOPY);
      Image1.Picture.Assign(Dst);
    finally
      Src.Free;
      Dst.Free;
    end;
  end;

ClientWidth := NewW;
ClientHeight := NewH;

Image1.AutoSize := False;
Image1.Proportional := False;
Image1.Stretch := True;
Image1.Align := alClient;

Position := poScreenCenter;
end;

procedure Tsplash_screen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
Splash_Screen := nil;
end;

procedure Tsplash_screen.FormCreate(Sender: TObject);
var
Exe: string;
begin
AjustarTamanho;

Label1.Caption := Lang_SRT(94);
Label1.Left := (ClientWidth - Label1.Width) div 2;
Label1.Top := ClientHeight - Label1.Height - MulDiv(6, CurrentPPI, 96);

FIndicator := TActivityIndicator.Create(Self);
FIndicator.Parent := Self;
FIndicator.IndicatorSize := aisMedium;
FIndicator.Left := (ClientWidth - FIndicator.Width) div 2;
FIndicator.Top := ClientHeight - FIndicator.Height - MulDiv(50, CurrentPPI, 96);
FIndicator.Animate := True;

Exe := ExtractFilePath(ParamStr(0)) + 'check_update.exe';

  if FileExists(Exe) then
  ShellExecute(0, 'open', PChar(Exe), PChar(SRT_VERSAO_Global), nil, SW_HIDE);

end;

end.
