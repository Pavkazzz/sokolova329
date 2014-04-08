unit Main_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TForm_main = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    J1: TMenuItem;
    N6: TMenuItem;
    Button2: TButton;
    C1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

{$R *.dfm}

uses Unit_viewer;

procedure TForm_main.Button1Click(Sender: TObject);
var
path:string;
begin
path:=ExtractFilePath(Application.ExeName);
OpenDialog1.Execute;
Edit1.Text:=OpenDialog1.FileName;
end;

procedure TForm_main.Button2Click(Sender: TObject);
begin
Form_viewer.RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
Form_viewer.Show;
hide;
end;

end.
