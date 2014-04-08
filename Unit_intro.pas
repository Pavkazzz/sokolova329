  unit Unit_intro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg, acImage,mmsystem;

type
  TForm_intro = class(TForm)
    sImage1: TsImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
  i:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_intro: TForm_intro;

implementation

{$R *.dfm}

uses Unit_main;

procedure TForm_intro.Timer1Timer(Sender: TObject);
var i:integer;
begin
  Timer1.Enabled:=false;
end;

end.
