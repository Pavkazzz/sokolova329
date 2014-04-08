unit Unit_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, sLabel, sButton, sSkinManager, sEdit, sComboBox, sCalculator,
  Vcl.ExtCtrls;

type
  TForm_main = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    J1: TMenuItem;
    N6: TMenuItem;
    C1: TMenuItem;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    OpenFile: TAction;
    LangChoose: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    formClose: TAction;
    sButton1: TsButton;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sEdit1: TsEdit;
    sButton2: TsButton;
    sSkinManager1: TsSkinManager;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    procedure OpenFileExecute(Sender: TObject);
    procedure formCloseExecute(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure J1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

{$R *.dfm}

uses Unit_viewer, Unit_editor, Unit_about;


procedure TForm_main.FormCreate(Sender: TObject);
var menu:tmenuitem;
i:integer;
begin
  //TODO переделать в функцию
  //* Генерим mainmenu для языков
  menu:=TMenuItem.Create(self);
  for I := 0 to sComboBox2.Items.Count-1 do
  begin
    menu.Caption:=sComboBox2.Items[i];
    if i=0 then
      menu.Checked:=true
      else menu.Checked:=false;

    N5.add(menu);
  end;
  //*Mainmenu для экспорта
  menu:=TMenuItem.Create(self);
  for I := 0 to sComboBox1.Items.Count-1 do
  begin
    menu.Caption:=sComboBox1.Items[i];
    if i=0 then
      menu.Checked:=true;
    N7.Add(menu);
  end;
end;

procedure TForm_main.J1Click(Sender: TObject);
begin
Form_about.Show;
end;

procedure TForm_main.OpenFileExecute(Sender: TObject);  //Открытие файла
begin
OpenDialog1.Execute;
sEdit1.Text:=OpenDialog1.FileName;
end;

procedure TForm_main.sButton1Click(Sender: TObject);   //Выполнить
begin
  if (sEdit1.Text<>'C:\') then
  begin
    Form_viewer.Show;
    hide;
  end
  else ShowMessage('Откройте файл');
end;

procedure TForm_main.formCloseExecute(Sender: TObject);  //Закрытие
begin
 Form_main.Close;
end;

end.

