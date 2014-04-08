unit Unit_about;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls,
  Vcl.StdCtrls, sButton;

type
  TForm_about = class(TForm)
    sButton1: TsButton;
    Image1: TImage;
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_about: TForm_about;

implementation

{$R *.dfm}

uses Unit_main;

procedure TForm_about.sButton1Click(Sender: TObject);
begin
Form_about.Close;
Form_main.Show;

end;

end.
