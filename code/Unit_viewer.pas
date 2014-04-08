unit Unit_viewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  acImage, sRichEdit, sButton, sLabel, Vcl.Grids;

type
  TForm_viewer = class(TForm)
    sRichEdit1: TsRichEdit;
    sLabelFX1: TsLabelFX;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    Image1: TImage;
    RichEdit1: TRichEdit;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure risovanie;
    procedure DrawShape(figureName:string;text:string);
    procedure FormActivate(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure SplitCode;
    function offset(num:integer):integer;
    procedure sButton1Click(Sender: TObject);
    procedure addBeginEnd;
    procedure addnullblock(i:integer);
    procedure sRichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sButton3Click(Sender: TObject);

  private
    topPos:integer;
    leftPos: integer;
    spacing:integer;
    multiplier:integer;
    drawingStatus:String;
    verticalLine:Boolean;
    mainTop,mainLeft,mainWidth:Integer;
    mainOffset:integer;
    bmp: TBitmap;
    isElse:Boolean;
    { Private declarations }
  public
    paintList:TStringList;
    { Public declarations }
  end;

var
  Form_viewer: TForm_viewer;

implementation

{$R *.dfm}

uses Unit_editor, Unit_main;

function tform_viewer.offset(num:integer):integer;   //Задел на будующее
begin

  Result:=round(Image1.Width/2)-num*50;
end;

procedure Tform_viewer.DrawShape(figureName:string;text: string);
var

  blockSize,blockSizeConn:TRect;

 // tempTopPos:integer;

begin
    with Image1 do
    begin
        //Рисуем блоки
      { bmp.LoadFromResourceName(HInstance,figureName);

       leftPos:=Offset(mainOffset)-round(bmp.Width/2);     //Выравниваем

        blockSize:=blockSize.Create(
          leftPos-multiplier,
          topPos-multiplier,
          leftPos+bmp.Width+multiplier,
          topPos+bmp.Height+multiplier
        );
        Canvas.StretchDraw(blockSize,bmp);
        Canvas.TextOut(leftPos+round(bmp.Width/4),topPos+Round(bmp.Height/4),text); //   TODO выравнять текст

        //Рисуем вертикальный линии
        topPos:=topPos+bmp.Height;
        Canvas.MoveTo(leftPos+round(bmp.Width/2),TopPos+multiplier);
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos+round(bmp.Width/2),TopPos);
        }
      if (drawingStatus<>'none') then
      begin
        if figureName='nullblock' then                      //TODO
        begin
          Canvas.MoveTo(leftPos+round(bmp.Width/2),TopPos+multiplier);
          topPos:=topPos+spacing;
          Canvas.LineTo(leftPos+round(bmp.Width/2),TopPos);
          topPos:=topPos-bmp.Height;
        end
        else
        begin
        bmp.LoadFromResourceName(HInstance,figureName);
           //Рисуем фигуру и текст в ней
        if not drawingStatus.Contains('if') then           //Выравнивание по середине.
          leftPos:=round(Image1.Width/2)-round(bmp.Width/2);

          blockSize:=blockSize.Create(
            leftPos-multiplier,
            topPos-multiplier,
            leftPos+bmp.Width+multiplier,
            topPos+bmp.Height+multiplier
          );

          Canvas.StretchDraw(blockSize,bmp);
          Canvas.TextOut(leftPos+round(bmp.Width/4),topPos+Round(bmp.Height/4),text);
        end;
      end;


                                                    //обработчик блока if

      if drawingStatus='if_true_complete' then       //Завершающий блок if  TRUE
      begin
        topPos:=topPos+bmp.Height;
        leftPos:=leftPos+round(bmp.Width/2);
        Canvas.MoveTo(leftPos,topPos+multiplier);     //  |_
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos,topPos);
        leftPos:=leftPos+round(leftPos*2/3);
        Canvas.LineTo(leftPos-spacing,topPos);
                                                    //рисуем соеденитель

        bmp.LoadFromResourceName(HInstance,'conn');

        leftPos:=round(Image1.Width/2)-round(bmp.Width/2);
        topPos:=topPos-Round(bmp.Height/2);
        blockSizeConn:=blockSizeConn.Create(
          leftPos-round(multiplier/2),
          topPos-round(multiplier/2),
          leftPos+round(bmp.Width)+round(multiplier/2),
          topPos+Round(bmp.Height)+round(multiplier/2)
        );

        Canvas.StretchDraw(blockSizeConn,bmp);

        if isElse  then
          drawingStatus:='if_else_single'
        else
          drawingStatus:='block';
        verticalLine:=true;
      end;

      if drawingStatus='if_true_single' then          //Одиночный блок if True
      begin
                                                    //  _
                                                    // |
        mainLeft:=leftPos;
        mainWidth:=bmp.Width;
        topPos:=topPos+round(bmp.Height/2);
        mainTop:=topPos;
        Canvas.MoveTo(leftPos,topPos);
        leftPos:=leftPos-round(bmp.Width/2);

        Canvas.LineTo(leftPos,TopPos);
        //Canvas.TextOut(leftPos-10,topPos-10,'TRUE');
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos,TopPos);
        leftPos:=leftPos-round(bmp.Width/2);
        drawingStatus:='if_true_complete';
        verticalLine:=false;
      end;


      if drawingStatus='if_else_complete' then        //Завершающий блок if  FALSE
      begin
        topPos:=topPos+bmp.Height;
        leftPos:=leftPos+round(bmp.Width/2);
        Canvas.MoveTo(leftPos,topPos+multiplier);     //  |_
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos,topPos);
        leftPos:=round(Image1.Width/2);               //-conn.width/2
        Canvas.LineTo(leftPos,topPos);
        leftPos:=leftPos-round(bmp.Width/2);          //как-то выравниваем
        topPos:=topPos-bmp.Height;
        drawingStatus:='block';
        verticalLine:=true;
      end;


      if drawingStatus='if_else_single' then                    //Одиночный else
      begin
                                                              //  _
                                                              //   |
        //topPos:=mainTop+round(bmp.Height/2);
        topPos:=mainTop;                                        //координаты половины блока if
        leftPos:=round(Image1.Width/2)+Round(mainWidth/2);
        Canvas.MoveTo(leftPos,topPos);
        leftPos:=leftPos+round(mainWidth/2);

        Canvas.LineTo(leftPos,TopPos);
        //Canvas.TextOut(leftPos-10,topPos-10,'TRUE');
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos,TopPos);
        leftPos:=leftPos-round(mainWidth/2);
        drawingStatus:='if_else_complete';
        verticalLine:=false;
      end;



      if drawingStatus='for_end' then
      begin
        topPos:=topPos+bmp.Height;
        Canvas.MoveTo(leftPos+round(bmp.Width/2),TopPos+multiplier);
        topPos:=topPos+spacing;

        Canvas.LineTo(leftPos+round(bmp.Width/2),TopPos);
        leftPos:=leftPos-round(bmp.Width/2);
        leftPos:=leftpos-multiplier;
        Canvas.LineTo(leftPos,TopPos);
        topPos:=topPos-(bmp.Height+spacing)*2+10;
        Canvas.LineTo(leftPos,topPos);
        leftPos:=leftPos+round(bmp.Width/2);
        leftPos:=leftpos+multiplier;
        Canvas.LineTo(leftPos-multiplier,TopPos);
        verticalLine:=false;
        drawingStatus:='for_finish';
      end;


      if drawingStatus='for_finish' then
      begin
        bmp.LoadFromResourceName(HInstance,'_for');
        leftPos:=leftPos+bmp.Width;
        Canvas.MoveTo(leftPos+multiplier,TopPos);
        leftPos:=leftPos+bmp.Width;
        Canvas.LineTo(leftPos+multiplier,TopPos);
        topPos:=topPos+(bmp.Height+spacing)*2;
        Canvas.LineTo(leftPos+multiplier,TopPos+multiplier);
        leftPos:=round(Image1.Width/2);
        Canvas.LineTo(leftPos,topPos+multiplier);
        toppos:=toppos-bmp.Height;
        leftpos:=leftpos-round(bmp.Width/2);
        verticalLine:=true;
        drawingStatus:='block';
      end;

      if drawingStatus='for' then
      begin
        drawingStatus:='for_end';
      end;

      if (text<>'end.') and (drawingStatus<>'none') and (verticalLine)then
      begin
        topPos:=topPos+bmp.Height;
        Canvas.MoveTo(leftPos+round(bmp.Width/2),TopPos+multiplier);
        topPos:=topPos+spacing;
        Canvas.LineTo(leftPos+round(bmp.Width/2),TopPos);
      end;
    end;
end;


procedure Tform_viewer.addnullblock(i:integer);
begin
 // paintList.Insert(i,);
end;

procedure TForm_viewer.risovanie;
var i:integer;
tempName,tempText:string;
elsecount:integer;
begin
  RichEdit1.Clear;
  RichEdit1.Lines.AddStrings(paintList);
  drawingStatus:='block';
  verticalLine:=true;
  DrawShape('_bgn','begin');
 // DrawShape('nullblock','');

  i:=0;
  while i<paintlist.Count do
  begin
    tempName:=paintList[i].Substring(0,4);
    tempText:=paintList[i].Substring(4);


    //Если у нас блоки if или for устанавливаем статус
    if tempName='_if_' then
    begin
      drawingStatus:='if_true_single';     //Одиночный блок условия
      {
      while not paintList[i+1].Contains('_if_') do
      begin

      end;
      }
      if paintList[i+4].Contains('noneelse') then
        begin
          isElse:=true;
          paintList.Delete(i+4);
        end;

    end;

    //addnullblock(i);       ???

    if tempName='_for' then
    begin
      drawingStatus:='for';
    end;

    if tempName<>'none' then
    DrawShape(tempName,tempText);

    i:=i+1;
  end;
  DrawShape('_bgn','end.');
end;

procedure TForm_viewer.sButton1Click(Sender: TObject);      //SaveDialogToBmp
begin
SaveDialog1.Filter := GraphicFilter(TBitmap);
SaveDialog1.Execute;
Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm_viewer.sButton3Click(Sender: TObject);
begin
Image1.Picture:=nil;
sRichEdit1.Text:='';
Form_main.Show;
Form_viewer.hide;
end;

procedure TForm_viewer.sButton4Click(Sender: TObject);      //+
begin
  if spacing<40 then
  begin
    spacing:=spacing+2;
    multiplier:=multiplier+1;
    topPos:=10;
    if topPos<=multiplier then
      topPos:=multiplier;
    Image1.Picture:=nil;
    risovanie;
    Image1.Repaint;
  end;
end;

procedure TForm_viewer.sButton5Click(Sender: TObject);     //-
begin
  if spacing>=20 then
  begin
    spacing:=spacing-2;
    multiplier:=multiplier-1;
    topPos:=10;
    if topPos<=multiplier then
      topPos:=multiplier;
    Image1.Picture:=nil;
    risovanie;
  end;
end;

procedure TForm_viewer.Button2Click(Sender: TObject);
begin
Form_editor.Image1.Picture:=Image1.Picture;
Form_editor.sRichEdit1.Lines:=sRichEdit1.Lines;
Form_editor.ShowModal;
end;

procedure TForm_viewer.addBeginEnd;
var i:integer;
begin
  for i:=0 to paintList.Count-1 do
  begin
    if (paintList[i].Contains('_if_')) and not (paintList[i+1].Contains('noneBeginBlock')) then
    begin
      paintList.Insert(i+1,'noneBeginBlock_true');
      paintList.Insert(i+3,'noneEndBlock_true');
    end;

    if (paintList[i].Contains('noneelseblock')) and not (paintList[i+1].Contains('noneBeginBlock')) then
    begin
      paintList.Insert(i+1,'noneBeginBlock_else');
      paintList.Insert(i+3,'noneEndBlock_else');
    end;

    if (paintList[i].Contains('_for')) and not (paintList[i+1].Contains('noneBeginBlock')) then
    begin
      paintList.Insert(i+1,'noneBeginBlock');
      paintList.Insert(i+3,'noneEndBlock');
    end;




  end;
end;


procedure tform_viewer.SplitCode;
var
  strList:TStringList;
  i:integer;
  Splitted: TArray<String>;
  tempStr:string;
  tempPos:integer;
  startOfComment,endOfComment:integer;
  tempText:string;
begin
  strList:=TStringList.Create;
  strList.LoadFromFile(Form_main.OpenDialog1.FileName);
  //заполняем richedit
  for i:=0 to strList.IndexOf('begin')-1 do          //Вырезаем все до begin
  begin
    strList.Delete(0);
  end;

          //Удаляем все коментарии TODO
    startOfComment:=strList.Text.IndexOf('{');
    endOfComment:=strList.Text.IndexOf('}');
    tempText:=strList.Text;
    Delete(tempText,startOfComment,endOfComment);
    strList.Text:=tempText;

      sRichEdit1.Lines.AddStrings(strList);//Добавляем в richEdit

  //Caption:='';
  for I := 0 to strList.Count-1 do
  begin

    if strList[i]='begin' then
      paintList.Add('noneBeginBlock');

    if (strList[i]='end;') or (strList[i]='end') or (strList[i]='end.') then
      paintList.Add('noneEndBlock');

    if strList[i].Contains(':=') and strList[i].Contains(';') then              //действие  добавляем
    begin
      tempStr:='_rct'+strList[i];
      tempPos:=tempStr.IndexOf(';');
      if (tempPos=length(tempStr)-1) then            //Удаляем ковычку из строки
        Delete(tempStr,tempPos+1,1);
      paintList.add(tempStr);
    end;

    if (strList[i].Contains('write(')) or (strList[i].Contains('read('))          //Ввод вывод переменных
    or (strList[i].Contains('writeln(')) or (strList[i].Contains('readln(')) then
    begin
      tempStr:='inpt';//+strList[i];
      Splitted:=strList[i].Split(['(']);
      tempStr:=tempStr+Splitted[0]+' ';
      Splitted:=Splitted[1].Split([')']);
      tempStr:=tempStr+Splitted[0];
      paintList.add(tempstr);
    end;

    if strList[i].Contains('if') and strList[i].Contains('then') then
    begin
      tempStr:='_if_';
      Splitted:=strList[i].Split(['if'], none);
      Splitted:=Splitted[1].Split(['then'],none);
      tempStr:=tempStr+Splitted[0];
      paintList.Add(tempStr);
    end;

    if strList[i]='else' then
      paintList.Add('noneelse');


    if strList[i].Contains('for') and strList[i].Contains('to') and strList[i].Contains('do') then
    begin
      tempStr:='_for';
      Splitted:=strList[i].Split(['for'], none);
      Splitted:=Splitted[1].Split(['do'], none);
      tempStr:=tempStr+Splitted[0];
      paintList.Add(tempStr);
    end;





  end;

end;

procedure TForm_viewer.sRichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_TAB then
  begin

    //RichEdit1.Paragraph.FirstIndent;
  end;
end;

procedure TForm_viewer.FormActivate(Sender: TObject);
begin
  bmp := TBitmap.Create;
  topPos:=10;
  spacing:=20;
  mainOffset:=0;
  paintList:=TStringList.Create;


  splitCode;
  addBeginEnd;
  risovanie;
end;

procedure TForm_viewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form_main.Close;
FreeAndNil(paintList);

end;

procedure TForm_viewer.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Caption:='x='+IntToStr(x)+' y='+inttostr(y);
end;

end.
