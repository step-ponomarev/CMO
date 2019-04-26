unit graphic_;

interface
uses graph, crt;

type
coords_ = record
  x : integer;
  y : integer;
end;

data = record
LAM : real;
POTK : array[1..3] of real;
KZANP1 : real;
MOBS2 : real;
end;

stackData = array[1..11] of data;

lines_ = record
  new, last : coords_;
  n : integer;
end;

graph_system = object
  constructor init;
  procedure drawSystem;
  procedure drawDetal; virtual;
  function getColor(numb : integer) : word;
end;

system_ = object
  procedure generationInfo(amount : integer);
  procedure generating;
  procedure limited;
  procedure exit;
end;

otkaz_graph = object(graph_system)
  lines : array[1..3] of lines_;
  procedure drawDetal; virtual;
  procedure reset;
  procedure drawLines(p : real; numb : integer);
  function getX(var numb : integer) : integer;
  function getY(p : real) : integer;
end;

otkaz_dot = object(graph_system)
  dotKmin : integer;
  constructor init(KMIN : integer);
  procedure drawDetal; virtual;
  procedure setDot(KMIN : integer; p : real; numb : integer);
  function getX(KMIN : integer) : integer;
  function getY(p : real) : integer;
end;

table = object
  CacheData : stackData;
  used : integer;
  procedure drawTable;
  procedure error;
  procedure getData(cache : stackData);
end;

LAMpanel = object
  mode : integer;
  procedure chooseLAM;
  procedure delta(key : char);
  procedure arrowDraw(cacheMode : integer);
  procedure arrowPush(key : char);
end;

procedure refreshBK;
procedure refreshCMO;

var
coords : coords_;
graph1 : otkaz_graph;
graph2 : otkaz_dot;
LAM : array[1..3] of real;
LAMpan : LAMpanel;
finalLAM2 : real;

implementation
const
W = 640;
H = 480;

procedure LAMpanel.arrowPush(key : char);
var
  i : integer;
begin
  if (mode = 1) then
  begin
    case key of
      #75 : begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(80, 260, 100, 270);
          line(80, 260, 100, 250);
          line(100, 260, 100, 270);
          line(100, 260, 100, 250);
          SetFillStyle(1, lightGreen);
          FloodFill(90, 260, green);
          
          setColor(Red);
          setLineStyle(0, 0, 3);
          line(80, 260, 100, 270);
          line(80, 260, 100, 250);
          line(100, 260, 100, 270);
          line(100, 260, 100, 250);
          SetFillStyle(1, lightRed);
          FloodFill(90, 260, Red);
        end;
      end;
      #77 : begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(395, 260, 375, 270);
          line(395, 260, 375, 250);
          line(375, 260, 375, 270);
          line(375, 260, 375, 250);
          SetFillStyle(1, lightGreen);
          FloodFill(383, 260, Green);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(395, 260, 375, 270);
          line(395, 260, 375, 250);
          line(375, 260, 375, 270);
          line(375, 260, 375, 250);
          SetFillStyle(1, lightRed);
          FloodFill(383, 260, Red);
        end;
      end;
    end;
  end
  else begin
    case key of
      #75 : begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(80, 360, 100, 370);
          line(80, 360, 100, 350);
          line(100, 360, 100, 370);
          line(100, 360, 100, 350);
          SetFillStyle(1, lightGreen);
          FloodFill(90, 360, Green);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(80, 360, 100, 370);
          line(80, 360, 100, 350);
          line(100, 360, 100, 370);
          line(100, 360, 100, 350);
          SetFillStyle(1, lightRed);
          FloodFill(90, 360, Red);
        end;
      end;
      #77 : begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(420, 360, 400, 370);
          line(420, 360, 400, 350);
          line(400, 360, 400, 370);
          line(400, 360, 400, 350);
          SetFillStyle(1, lightGreen);
          FloodFill(410, 360, Green);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(420, 360, 400, 370);
          line(420, 360, 400, 350);
          line(400, 360, 400, 370);
          line(400, 360, 400, 350);
          SetFillStyle(1, lightRed);
          FloodFill(410, 360, Red);
        end;
      end;
    end;
  end;
end;

procedure LAMpanel.delta(key : char);
var
  cStr : string;
  saver : real;
begin
  if (mode = 1) then
  begin
    saver := LAM[2];
    str(LAM[2]:0:1, cStr);

    case key of
      #75 : LAM[2] := LAM[2] - 0.2;
      #77 : LAM[2] := LAM[2] + 0.2;
    end;

    if LAM[2] <= 1 then
      LAM[2] := 1;
    if LAM[2] >= 2.8 then
      LAM[2] := 2.8;

    if (saver <> LAM[2]) then
    begin
      arrowPush(key);
      setColor(black);
      OutTextXY(450, 250, cStr);
    end;
    setColor(lightGreen);
    str(LAM[2]:0:1, cStr);
    OutTextXY(450, 250, cStr);
  end
  else  begin
    saver := finalLAM2;
    str(finalLAM2:0:1, cStr);

    case key of
      #75 : finalLAM2 := finalLAM2 - 0.2;
      #77 : finalLAM2 := finalLAM2 + 0.2;
    end;

    if finalLAM2 <= 1.2 then
      finalLAM2 := 1.2;
    if finalLAM2 >= 3 then
      finalLAM2 := 3;
    if LAM[2] > finalLAM2 then
      finalLAM2 := finalLAM2 + 0.2;

    if (saver <> finalLAM2) then
    begin
      arrowPush(key);
      setColor(black);
      OutTextXY(450, 350, cStr);
    end;
    setColor(lightGreen);
    str(finalLAM2:0:1, cStr);
    OutTextXY(450, 350, cStr);
  end;

  if LAM[2] > finalLAM2 then begin
    saver := finalLAM2;
    str(finalLAM2:0:1, cStr);

    setColor(black);
    OutTextXY(450, 350, cStr);

    finalLAM2 := finalLAM2 + 0.2;

    setColor(lightGreen);
    str(finalLAM2:0:1, cStr);
    OutTextXY(450, 350, cStr);
  end;


end;

procedure LAMpanel.arrowDraw(cacheMode : integer);
begin
  if (mode = 1) then
  begin
    setColor(Red);
    setLineStyle(0, 0, 3);
    line(80, 260, 100, 270);
    line(80, 260, 100, 250);
    line(100, 260, 100, 270);
    line(100, 260, 100, 250);
    SetFillStyle(1, lightRed);
    FloodFill(90, 260, Red);

    setColor(Red);
    setLineStyle(0, 0, 3);
    line(395, 260, 375, 270);
    line(395, 260, 375, 250);
    line(375, 260, 375, 270);
    line(375, 260, 375, 250);
    SetFillStyle(1, lightRed);
    FloodFill(383, 260, Red);
  end
  else begin
    setColor(Red);
    setLineStyle(0, 0, 3);
    line(80, 360, 100, 370);
    line(80, 360, 100, 350);
    line(100, 360, 100, 370);
    line(100, 360, 100, 350);
    SetFillStyle(1, lightRed);
    FloodFill(90, 360, Red);

    setColor(Red);
    setLineStyle(0, 0, 3);
    line(420, 360, 400, 370);
    line(420, 360, 400, 350);
    line(400, 360, 400, 370);
    line(400, 360, 400, 350);
    SetFillStyle(1, lightRed);
    FloodFill(410, 360, Red);
  end;

  if (cacheMode = 1) then
  begin
    setColor(black);
    setLineStyle(0, 0, 3);
    line(80, 260, 100, 270);
    line(80, 260, 100, 250);
    line(100, 260, 100, 270);
    line(100, 260, 100, 250);
    SetFillStyle(1, black);
    FloodFill(90, 260, black);

    setColor(black);
    setLineStyle(0, 0, 3);
    line(395, 260, 375, 270);
    line(395, 260, 375, 250);
    line(375, 260, 375, 270);
    line(375, 260, 375, 250);
    SetFillStyle(1, black);
    FloodFill(383, 260, black);
  end
  else begin
    setColor(black);
    setLineStyle(0, 0, 3);
    line(80, 360, 100, 370);
    line(80, 360, 100, 350);
    line(100, 360, 100, 370);
    line(100, 360, 100, 350);
    SetFillStyle(1, black);
    FloodFill(90, 360, black);

    setColor(black);
    setLineStyle(0, 0, 3);
    line(420, 360, 400, 370);
    line(420, 360, 400, 350);
    line(400, 360, 400, 370);
    line(400, 360, 400, 350);
    SetFillStyle(1, black);
    FloodFill(410, 360, black);
  end;
end;

procedure LAMpanel.chooseLAM;
var
  key : char;
  cacheMode : integer;
  cStr : string;
begin
  refreshCMO;
  setColor(yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(80, 100, 'System:');
  setTextStyle(0, 0 , 3);
  setColor(green);
  OutTextXY(200, 125 + 20, 'Chose LAM2');

  setTextStyle(0, 0 , 3);

  setColor(Yellow);
  OutTextXY(120, 250, 'Start LAM2');
  setColor(lightGreen);
  str(LAM[2]:0:1, cStr);
  OutTextXY(450, 250, cStr);

  setColor(Yellow);
  OutTextXY(120, 350, 'Finish LAM2');
  setColor(lightGreen);
  str(finalLAM2:0:1, cStr);
  OutTextXY(450, 350, cStr);

  mode := 1;
  arrowDraw(0);

  while (key <> #13) do
  begin
    key := '0';
    cacheMode := mode;
    while ((key <> #72) and (key <> #80)) do
    begin
      key := readkey;
      case key of
        #72 : mode := (mode - 1);
        #80 : mode := (mode + 1);
        #75 : delta(key);
        #77 : delta(key);
        #13 : break;
        else continue;
      end;

      if mode <= 1 then
        mode := 1;
      if mode >= 2 then
        mode := 2;

    end;
    if (mode <> cacheMode) then
      arrowDraw(cacheMode);
  end;
end;


procedure refreshCMO;
begin
  setTextStyle(0, 0 , 4);
  setFillStyle(solidFill, black);
  bar(0, 0, 640, 480);
  setColor(Red);
  OutTextXY(260, 30, 'S');
  setColor(yellow);
  OutTextXY(300, 30, 'M');
  setColor(Green);
  OutTextXY(340, 30, 'O');
end;

procedure refreshBK;
begin
  setFillStyle(solidFill, black);
  bar(0, 80, 640, 480);
  setTextStyle(0, 0 , 4);
end;

procedure system_.limited;
begin
  setColor(Red);
  setTextStyle(0, 0 , 2);
  setFillStyle(solidFill, black);
  bar(370, 340, 640, 480);
  OutTextXY(430, 380, '-Limited');
end;

procedure system_.generating;
begin
  setColor(yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(80, 100, 'System:');
  setTextStyle(0, 0 , 3);
  OutTextXY(200, 125 + 20, 'Generating...');
  setColor(Green);
  setTextStyle(0, 0 , 3);
  OutTextXY(100, 250, 'Progress: ');
  setColor(lightRed);
  OutTextXY(350, 250, '0%');
end;

procedure system_.exit;
var
  strExit, strOut : string;
  strings : array[1..4] of string;
  i, j : integer;
begin
  setColor(Yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(80, 100, 'System:');

  setColor(Red);
  setTextStyle(0, 0 , 3);
  strOut := '';
  strExit := 'Exit';
  for i := 1 to length(strExit) do
  begin
    strOut := strOut + strExit[i];
    OutTextXY(250, 125 + 20, strOut);
  end;

  setTextStyle(0, 0 , 2);
  setColor(lightRed);
  strings[1] := 'Are you sure you want to quit?';
  strings[2] := 'Click "Exit" to exit. To return';
  strings[3] := 'to the menu, click "Cancel".';
  strings[4] := 'start the generation.';
  for i := 1 to 4 do
  begin
    strOut := '';
    for j := 1 to length(strings[i]) do
    begin
      strOut := strOut + strings[i][j];
      OutTextXY(80, 190 + (30 * (i - 1)), strOut);
    end;
  end;

  setTextStyle(0, 0 , 3);
  setColor(red);
  OutTextXY(80, 330, 'Exit');

  setColor(green);
  OutTextXY(420, 330, 'Cancel');

  setColor(black);
  OutTextXY(420, 330, 'Cancel');

  setColor(green);
  OutTextXY(420, 320, 'Cancel');

end;

procedure system_.generationInfo(amount : integer);
var
  i, j : integer;
  strings : array[1..4] of string;
  strOut, strSuc : string;
begin
  setFillStyle(solidFill, Black);
  bar(80, 80, 640, 480);

  setColor(Yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(80, 100, 'System:');
  setTextStyle(0, 0 , 3);

  setColor(Green);
  strSuc := 'Success!';
  strOut := '';
  for i := 1 to length(strSuc) do
  begin
    strOut := strOut + strSuc[i];
    OutTextXY(220, 125 + 20, strOut);
  end;

  setTextStyle(0, 0 , 2);
  setColor(lightGreen);
  strings[1] := 'The generation completed and';
  strings[2] := 'the results were saved. To';
  strings[3] := 'view the results, go to the';
  strings[4] := '"Results" section.';
  for i := 1 to 4 do
  begin
    strOut := '';
    for j := 1 to length(strings[i]) do
    begin
      strOut := strOut + strings[i][j];
      OutTextXY(80, 190 + (30 * (i - 1)), strOut);
    end;
  end;

  setColor(yellow);
  OutTextXY(80, 300 + 20, 'KMIN : ');
  str(amount, strOut);
  OutTextXY(190, 300 + 20, strOut);

  setTextStyle(0, 0 , 3);
  setColor(Green);
  OutTextXY(80, 360, 'Press "ENTER"');

  setColor(Red);
  OutTextXY(80, 360, 'Press "ENTER"');
  while (readkey <> #13) do
  begin
    setColor(Green);
    OutTextXY(80, 360, 'Press "ENTER"');

    setColor(Red);
    OutTextXY(80, 360, 'Press "ENTER"');
  end;
end;

procedure table.error;
var
  i, j : integer;
  strings : array[1..4] of string;
  strOut, strError : string;
begin
  setFillStyle(solidFill, Black);
  bar(80, 80, 640, 480);

  setColor(Yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(80, 100, 'System:');
  setTextStyle(0, 0 , 3);

  setColor(Red);
  strError := 'Error!';
  strOut := '';
  for i := 1 to length(strError) do
  begin
    strOut := strOut + strError[i];
    OutTextXY(240, 125 + 20, strOut);
  end;

  strings[1] := 'Missing data. To collect data';
  strings[2] := 'you need to start the generation';
  strings[3] := 'system. Go to the main menu to';
  strings[4] := 'start the generation.';
  setColor(lightRed);
  setTextStyle(0, 0 , 2);
  for i := 1 to 4 do
  begin
    strOut := '';
    for j := 1 to length(strings[i]) do
    begin
      strOut := strOut + strings[i][j];
      OutTextXY(80, 190 + (30 * (i - 1)), strOut);
    end;
  end;

  setTextStyle(0, 0 , 3);
  setColor(Green);
  OutTextXY(80, 360, 'Press "ENTER"');

  setColor(Red);
  OutTextXY(80, 360, 'Press "ENTER"');
  while (readkey <> #13) do
  begin
    setColor(Green);
    OutTextXY(80, 360, 'Press "ENTER"');

    setColor(Red);
    OutTextXY(80, 360, 'Press "ENTER"');
  end;
end;

procedure table.drawTable;
var
  i : integer;
  sString : string;
  key : char;
begin
  if used = 1 then
  begin
    for i := 1 to 11 do
    begin
      setColor(yellow);
      setTextStyle(0, 0 , 2);
      OutTextXY(30, 90, 'LAM');
      setColor(green);
      OutTextXY(110, 90, 'P1');
      setColor(yellow);
      OutTextXY(215, 90, 'P2');
      setColor(red);
      OutTextXY(320, 90, 'P3');
      setColor(green);
      OutTextXY(425, 90, 'K(1)');
      setColor(yellow);
      OutTextXY(530, 90, 'M(2)');
      with CacheData[i] do
      begin
        setColor(yellow);
        str(LAM:0:1, sString);
        OutTextXY(30, 100 + (30 * i), sString);

        setColor(lightGreen);
        str(POTK[1]:0:3, sString);
        OutTextXY(110, 100 + (30 * i), sString);

        setColor(yellow);
        str(POTK[2]:0:3, sString);
        OutTextXY(215, 100 + (30 * i), sString);

        setColor(lightRed);
        str(POTK[3]:0:3, sString);
        OutTextXY(320, 100 + (30 * i), sString);

        setColor(lightGreen);
        str(KZANP1:0:3, sString);
        OutTextXY(425, 100 + (30 * i), sString);

        setColor(yellow);
        str(MOBS2:0:3, sString);
        OutTextXY(530, 100 + (30 * i), sString);
      end;
    end;
    key := '0';
    while (key <> #13) do
      key := readkey;
  end
  else begin
    error;
  end;
end;

procedure table.getData(cache : stackData);
begin
  CacheData := cache;
  used := 1;
end;

procedure otkaz_graph.reset;
var
  i : integer;
begin
  for i := 1 to 3 do
  begin
      lines[i].n := 0;
  end;
end;
procedure graph_system.drawSystem;

begin
  setFillStyle(solidFill, Black);
  bar(0, H, W, 0);

  setColor(white);
  setLineStyle(0, 0, 3);
  line(coords.x, coords.y, coords.x + 420 , coords.y);
  line(coords.x + 420, coords.y, coords.x + 410, coords.y - 10);
  line(coords.x + 420, coords.y, coords.x + 410, coords.y + 10);
  line(coords.x, coords.y, coords.x, coords.y - 400);
  line(coords.x, coords.y - 400, coords.x - 10, coords.y - 390 + 10);
  line(coords.x, coords.y - 400, coords.x + 10, coords.y - 390 + 10);

  setColor(Green);
  setTextStyle(0, 0 , 2);
  OutTextXY(coords.x + 440, coords.y - 40, 'Source 1');

  setColor(yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(coords.x + 440, coords.y - 80, 'Source 2');

  setColor(Red);
  setTextStyle(0, 0 , 2);
  OutTextXY(coords.x + 440, coords.y - 120, 'Source 3');
  drawDetal;

  setTextStyle(0, 0 , 2);
  setColor(Green);
  OutTextXY(480, 80, 'Progress:');
end;

function graph_system.getColor(numb : integer) : word;
begin
  case numb of
    1 : getColor := green;
    2 : getColor := yellow;
    3 : getColor := red;
  end;
end;

procedure graph_system.drawDetal;
begin
end;

constructor graph_system.init;
begin
end;

function otkaz_graph.getY(p : real) : integer;
begin
  getY := H - round(p * 400 + 40);
end;

function otkaz_graph.getX(var numb : integer) : integer;
var
  save : integer;
begin
  if (numb = 1) then
  begin
    save := round(LAM[2] - 1);
    if (save <> 0) then
      numb := round(save / 0.2) + 1
    else
      numb := 1;
  end;
  getX := coords.x + (36 * numb);
end;

procedure otkaz_graph.drawLines(p: real; numb : integer);
const
  r = 5;
begin
  setFillStyle(0, getColor(numb));
  setColor(getColor(numb));
  setLineStyle(0, 0, 3);
  if (lines[numb].n <> 0) then
  begin
    Inc(lines[numb].n);
    lines[numb].new.x := getX(lines[numb].n);
    lines[numb].new.y := getY(p);
    FillEllipse(lines[numb].new.x, lines[numb].new.y, r, r);
    line(lines[numb].last.x, lines[numb].last.y, lines[numb].new.x, lines[numb].new.y);
  end
  else
    Inc(lines[numb].n);
    lines[numb].new.x := getX(lines[numb].n);
    lines[numb].new.y := getY(p);
    FillEllipse(lines[numb].new.x, lines[numb].new.y, r, r);
  begin
    lines[numb].last.x := lines[numb].new.x;
    lines[numb].last.y := lines[numb].new.y;
  end;
end;

procedure otkaz_graph.drawDetal;

var
  i : integer;
  ditX, ditY : real;
  s : string;
begin
    ditX := 1.0;
    ditY := 0.1;
    setColor(white);
    setTextStyle(0, 0 , 1);

    for i := 0 to 11 do
    begin
      if (i > 0) then
      begin
        line(coords.x + 36 * i, coords.y, coords.x + 36 * i, coords.y - 10);
        str(ditX:0:1, s);
        OutTextXY(coords.x - 15 + 36 * i, coords.y + 15, s);
        ditX := ditX + 0.2;
      end;
    end;
    setColor(Red);
    for i := 1 to 9 do
    begin
        line(coords.x, coords.y - 40 * i, coords.x + 10, coords.y - 40 * i);
        str(ditY:0:1, s);
        OutTextXY(coords.x - 30, coords.y - 40 * i, s);
        ditY := ditY + 0.1;
    end;
    setTextStyle(0, 0 , 3);
    OutTextXY(coords.x + 190, coords.y - 430, 'P(LAM2)');
end;

constructor otkaz_dot.init(KMIN : integer);
begin
  dotKmin := KMIN;
end;

procedure otkaz_dot.drawDetal;
var
  i : integer;
  ditY : real;
  s : string;
begin
    ditY := 0.1;
    setColor(white);
    setLineStyle(0, 0, 3);
    setTextStyle(0, 0 , 2);
    str(dotKmin, s);
    OutTextXY(coords.x + 380, coords.y + 15, s);
    str(dotKmin div 2, s);
    line(coords.x + 220, coords.y, coords.x + 220, coords.y - 10);
    OutTextXY(coords.x + 190, coords.y + 15, s);
    OutTextXY(coords.x - 10, coords.y + 15, '0');
    setColor(red);
    FillEllipse(coords.x, coords.y, 3, 3);
    setTextStyle(0, 0 , 1);
    setColor(Red);
    for i := 1 to 9 do
    begin
        line(coords.x, coords.y - 40 * i, coords.x + 10, coords.y - 40 * i);
        str(ditY:0:1, s);
        OutTextXY(coords.x - 30, coords.y - 40 * i, s);
        ditY := ditY + 0.1;
    end;
    setTextStyle(0, 0 , 3);
    OutTextXY(coords.x + 190, coords.y - 430, 'P(KMIN)');
end;

procedure otkaz_dot.setDot(KMIN : integer; p : real; numb : integer);
begin
  setColor(getColor(numb));
  putPixel(getX(KMIN), getY(p), getColor(numb));
end;

function otkaz_dot.getX(KMIN : integer) : integer;
begin
    getX := 40 + KMIN;
end;

function otkaz_dot.getY(p : real) : integer;
begin
  getY := H - round(p * 400 + 40);
end;

begin
  with coords do
  begin
    x := 40;
    y := 440;
  end;
end.
