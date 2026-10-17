unit Unit7;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, registry, pngimage, abfControls, WinSkinData;

type
  TAboutBox = class(TForm)
    Label3: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Panel1: TPanel;
    abfImage1: TabfImage;
    Image1: TImage;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses Unit1, Language;

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
begin
Lang_SRT(5);
Label3.Caption:=Format(Lang_SRT(86),[SRT_VERSAO_Global]);
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 //Precisa ativar o KeyPreview no Form para funcionar
 if Key = VK_ESCAPE then
 Close;
 
end;

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AboutBox.Release;
AboutBox:=Nil;
end;

procedure TAboutBox.Button1Click(Sender: TObject);
begin
Close;

end;

end.

