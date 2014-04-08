unit Unit_editor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, sRichEdit, sLabel, acImage, sPanel;

type
  TForm_editor = class(TForm)
    Button2: TButton;
    Button1: TButton;
    sLabelFX1: TsLabelFX;
    sRichEdit1: TsRichEdit;
    ButtonGroup2: TButtonGroup;
    ImageList1: TImageList;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_editor: TForm_editor;

implementation



{$R *.dfm}

end.
