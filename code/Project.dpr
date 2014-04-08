program Project;

{$R *.dres}

uses
  Vcl.Forms,
  mmsystem,
  Unit_main in 'Unit_main.pas' {Form_main},
  Unit_viewer in 'Unit_viewer.pas' {Form_viewer},
  Unit_intro in 'Unit_intro.pas' {Form_intro},
  Unit_editor in 'Unit_editor.pas' {Form_editor},
  Unit_about in 'Unit_about.pas' {Form_about};

{$R *.res}

begin
  Application.Initialize;
  Form_intro:=TForm_intro.create(application);
  Form_intro.Show;
  Form_intro.Update;
  //PlaySound('Alarm01.wav',0,SND_ASYNC);
  while Form_intro.Timer1.Enabled do
    Application.ProcessMessages;
  //Application.MainFormOnTaskbar := True;   //??????
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_viewer, Form_viewer);
  Application.CreateForm(TForm_editor, Form_editor);
  Application.CreateForm(TForm_about, Form_about);
  //Application.CreateForm(TForm_intro, Form_intro);
  Form_intro.Close;
  Form_intro.Free;
  Application.Run;
end.
