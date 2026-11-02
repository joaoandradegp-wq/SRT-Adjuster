unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls,
  ShellAPI, Vcl.Buttons, Vcl.WinXCtrls;

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
  end;

var
Splash_Screen: TSplash_Screen;

implementation

uses Unit1, Language;

{$R *.dfm}

procedure Tsplash_screen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Splash_Screen.Release;
Splash_Screen:=Nil;
end;

procedure Tsplash_screen.FormCreate(Sender: TObject);
begin
Label1.Caption:=Lang_SRT(94);
Label1.Left :=(ClientWidth-Label1.Width ) div 2;

FIndicator := TActivityIndicator.Create(Self);
FIndicator.Parent := Self;
FIndicator.IndicatorSize := aisMedium;
FIndicator.Left := (ClientWidth - FIndicator.Width) div 2;
FIndicator.Top  := ClientHeight - FIndicator.Height - MulDiv(50, CurrentPPI, 96);
FIndicator.Animate := True;

  if FileExists('check_update.exe') then
  ShellExecute(0,'open','check_update.exe',pchar(SRT_VERSAO_Global),nil,SW_HIDE);

end;

end.
