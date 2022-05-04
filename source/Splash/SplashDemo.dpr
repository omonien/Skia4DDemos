program SplashDemo;

uses
  System.StartUpCopy,
  Skia.FMX,
  FMX.Types,
  FMX.Forms,
  SplashDemo.Forms.Main in 'SplashDemo.Forms.Main.pas' {FormMain} ,
  SK.SplashForm in '..\common\SK.SplashForm.pas' {Splash};

{$R *.res}


begin
  GlobalUseSkia := true;
  GlobalUseMetal := true; // macOS / iOS
  GlobalUseSkiaRasterWhenAvailable := false; // Windows

  Application.Initialize;
  // Show a splash form first. It will destroy it self automatically and make the second form the new MainForm.
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
