unit SK.SplashForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  Skia, Skia.FMX;

type
  TSplashForm = class(TForm)
    ImageSplash: TSkAnimatedImage;
    Backgound: TRectangle;
    procedure ImageSplashAnimationFinished(Sender: TObject);
  strict private
    FMainForm: TCommonCustomForm;
  public
  end;

var
  SplashForm: TSplashForm;

implementation


{$R *.fmx}


procedure TSplashForm.ImageSplashAnimationFinished(Sender: TObject);
begin
  FMainForm := nil;
  // Find actuual Main form. Created after TSplashForm.
  for var i := 0 to Application.ComponentCount - 1 do
  begin
    var
    LComponent := Application.Components[i];
    if (LComponent is TCommonCustomForm) and not(LComponent is TSplashForm) then
    begin
      // First form after Splash is real main form
      FMainForm := LComponent as TCommonCustomForm;
      break;
    end;
  end;
  if Assigned(FMainForm) then
  begin
    //Todo: Center MainForm on SplashForm's position
    FMainForm.Position := self.Position;
    FMainForm.Show;
    Application.MainForm := FMainForm;
    Release;
  end
  else
  begin
    // No form to show found. Just close...
    close;
  end;
end;

end.
