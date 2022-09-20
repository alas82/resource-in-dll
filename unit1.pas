unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms,MMSystem, Controls, Graphics,LCLType, Dialogs, ExtCtrls, StdCtrls,LResources;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  LibHandle: THandle;
  Bitmap: Tbitmap;
begin
  LibHandle:=Loadlibrary('project1.dll');
  try
    if LibHandle<>0 then
    begin
      Bitmap:=TBitmap.Create;
      Bitmap.LoadFromResourceName(LibHandle,'IMG1');
      Image1.Canvas.Draw(0,0,Bitmap);
    end;
  finally
    Bitmap.Free;
    FreeLibrary(LibHandle);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  LibHandle: THandle;
  sound: TResourceStream;
begin
  LibHandle:=Loadlibrary('project1.dll');
  try
    if LibHandle<>0 then
    begin
      SOUND := TResourceStream.Create(LibHandle,'S1',RT_RCDATA);
     SOUND.SaveToFile('11.tmp');
     sndPlaySound('11.tmp',SND_NODEFAULT or SND_ASYNC);
    end;
  finally
    sound.Free;
    FreeLibrary(LibHandle);
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
LibHandle: THandle;
  S2: TResourceStream;
  begin

  LibHandle:=Loadlibrary('project1.dll');
    try
      if LibHandle<>0 then
      begin
       S2:= TResourceStream.Create(LibHandle,'JPG1',RT_RCDATA);
  Image2.Picture.Jpeg.LoadFromStream(S2);
      end;
    finally
      S2.Free;
      FreeLibrary(LibHandle);
    end;
end;




end.

