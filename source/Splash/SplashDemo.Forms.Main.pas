unit SplashDemo.Forms.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Controls.Presentation, FMX.StdCtrls,
  Skia.FMX;

type
  TFormMain = class(TForm)
    SkLabel1: TSkLabel;
    ButtonClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}


procedure TFormMain.FormCreate(Sender: TObject);
begin
  // No "close" button on mobile platforms
{$IF DEFINED(ANDROID) OR (DEFINED(IOS))}
  ButtonClose.Visible := false;
{$ELSE}
  ButtonClose.Visible := true;
{$ENDIF}
end;

procedure TFormMain.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
