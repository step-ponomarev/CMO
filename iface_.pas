unit iface_;
interface
uses func_, graphic_, graph, crt;

type
globalMenu = object
  drawMode : integer;
  procedure draw(var gMode, exit : integer);
  procedure refreshMainMenu(mode : integer);
end;

optionsMenu = object(globalMenu)
  procedure draw;
  procedure change(key : char);
  procedure arrowPush(key : char);
  procedure arrowDance(key : char);
end;

result = object(globalMenu)
  procedure draw;
  procedure refreshResult;
end;

graphsMenu = object(globalMenu)
  procedure draw;
  procedure refreshGraphs(mode : integer);
end;

helpMenu = object(globalMenu)
  procedure draw;
end;

procedure mainMenu;

var
sys : system_;

implementation

procedure helpMenu.draw;
var
  yPos : integer;
  key : char;
begin
  yPos := 350;
  setTextStyle(0, 0 , 3);
  while (yPos <> 110) do
  begin
    setColor(black);
    bar(80, yPos, 640, 480);

    yPos := yPos - 10;

    setColor(lightRed);
    OutTextXY(80, yPos, 'Help');

    setColor(lightGreen);
    OutTextXY(80, yPos, 'Help');
  end;
  setColor(black);
  bar(80, yPos-10, 640, 480);
  setColor(yellow);
  OutTextXY(80, yPos, 'Help');

  setTextStyle(0, 0 , 2);
  setColor(White);
  OutTextXY(50, 160, 'KMIN - The minimum number of gene-');
  OutTextXY(50, 180, 'rated requests from each source.');

  setColor(red);
  OutTextXY(50, 210, 'LAM(x) - The intensity of genera-');
  OutTextXY(50, 230, 'ting requests from the source.');

  setColor(green);
  OutTextXY(50, 260, 'P(x) - The probability of failure');
  OutTextXY(50, 280, 'in lambda.');

  setColor(lightRed);
  OutTextXY(50, 310, 'K(x) - The employment rate of the');
  OutTextXY(50, 330, 'device by the source.');

  setColor(lightGreen);
  OutTextXY(50, 360, 'M(x) - Average service time from ');
  OutTextXY(50, 380, 'source.');

  key := '0';
  setTextStyle(0, 0 , 3);
  while True do
  begin
    setColor(Green);
    OutTextXY(500, 410, 'OK');
    setColor(Red);
    OutTextXY(500, 410, 'OK');
    setColor(Yellow);
    OutTextXY(500, 410, 'OK');
    key := readkey;
    case key of
      #13 : break;
      else continue;
    end;
  end;
end;

procedure optionsMenu.arrowPush(key : char);
var
  yPos : integer;
begin
  yPos := 110;
  case drawMode of
    1 : begin
      if (key = #75) then
      begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(80, yPos + 90, 100, yPos + 100);
        line(80, yPos + 90, 100, yPos + 80);
        line(100, yPos + 100, 105, yPos + 90);
        line(100, yPos + 80, 105, yPos + 90);
        SetFillStyle(1, lightGreen);
        FloodFill(90,yPos + 90, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(80, yPos + 90, 100, yPos + 100);
        line(80, yPos + 90, 100, yPos + 80);
        line(100, yPos + 100, 105, yPos + 90);
        line(100, yPos + 80, 105, yPos + 90);
        SetFillStyle(1, lightRed);
        FloodFill(90,yPos + 90, Red);
      end
      else begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(317, yPos + 90, 297, yPos + 100);
        line(317, yPos + 90, 297, yPos + 80);
        line(297, yPos + 100, 292, yPos + 90);
        line(297, yPos + 80, 292, yPos + 90);
        SetFillStyle(1, lightGreen);
        FloodFill(310,yPos + 90, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(317, yPos + 90, 297, yPos + 100);
        line(317, yPos + 90, 297, yPos + 80);
        line(297, yPos + 100, 292, yPos + 90);
        line(297, yPos + 80, 292, yPos + 90);
        SetFillStyle(1, lightRed);
        FloodFill(310,yPos + 90, Red);
      end;
    end;
    2 : begin
      if (key = #75) then
      begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(80, yPos + 150, 100, yPos + 160);
        line(80, yPos + 150, 100, yPos + 140);
        line(100, yPos + 160, 105, yPos + 150);
        line(100, yPos + 140, 105, yPos + 150);
        SetFillStyle(1, lightGreen);
        FloodFill(90,yPos + 150, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(80, yPos + 150, 100, yPos + 160);
        line(80, yPos + 150, 100, yPos + 140);
        line(100, yPos + 160, 105, yPos + 150);
        line(100, yPos + 140, 105, yPos + 150);
        SetFillStyle(1, lightRed);
        FloodFill(90,yPos + 150, Red);
      end
      else begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(317, yPos + 150, 297, yPos + 160);
        line(317, yPos + 150, 297, yPos + 140);
        line(297, yPos + 160, 292, yPos + 150);
        line(297, yPos + 140, 292, yPos + 150);
        SetFillStyle(1, lightGreen);
        FloodFill(310,yPos + 150, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(317, yPos + 150, 297, yPos + 160);
        line(317, yPos + 150, 297, yPos + 140);
        line(297, yPos + 160, 292, yPos + 150);
        line(297, yPos + 140, 292, yPos + 150);
        SetFillStyle(1, lightRed);
        FloodFill(310,yPos + 150, Red);
      end;
    end;
    3 : begin
      if (key = #75) then
      begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(80, yPos + 210, 100, yPos + 220);
        line(80, yPos + 210, 100, yPos + 200);
        line(100, yPos + 220, 105, yPos + 210);
        line(100, yPos + 200, 105, yPos + 210);
        SetFillStyle(1, lightGreen);
        FloodFill(90,yPos + 210, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(80, yPos + 210, 100, yPos + 220);
        line(80, yPos + 210, 100, yPos + 200);
        line(100, yPos + 220, 105, yPos + 210);
        line(100, yPos + 200, 105, yPos + 210);
        SetFillStyle(1, lightRed);
        FloodFill(90,yPos + 210, Red);
      end
      else begin
        setColor(Green);
        setLineStyle(0, 0, 3);
        line(252, yPos + 210, 232, yPos + 220);
        line(252, yPos + 210, 232, yPos + 200);
        line(232, yPos + 220, 227, yPos + 210);
        line(232, yPos + 200, 227, yPos + 210);
        SetFillStyle(1, lightGreen);
        FloodFill(242,yPos + 210, Green);

        setColor(Red);
        setLineStyle(0, 0, 3);
        line(252, yPos + 210, 232, yPos + 220);
        line(252, yPos + 210, 232, yPos + 200);
        line(232, yPos + 220, 227, yPos + 210);
        line(232, yPos + 200, 227, yPos + 210);
        SetFillStyle(1, lightRed);
        FloodFill(242,yPos + 210, Red);
      end;
    end;
  end;
end;

procedure optionsMenu.arrowDance(key : char);
var
  i, yPos : integer;
begin
  yPos := 110;
  case drawMode of
    1 : begin
      if (key = #75) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(80, yPos + 90, 100, yPos + 100);
          line(80, yPos + 90, 100, yPos + 80);
          line(100, yPos + 100, 105, yPos + 90);
          line(100, yPos + 80, 105, yPos + 90);
          SetFillStyle(1, lightGreen);
          FloodFill(90,yPos + 90, Green);

          setColor(yellow);
          setLineStyle(0, 0, 3);
          line(80, yPos + 90, 100, yPos + 100);
          line(80, yPos + 90, 100, yPos + 80);
          line(100, yPos + 100, 105, yPos + 90);
          line(100, yPos + 80, 105, yPos + 90);
          SetFillStyle(1, yellow);
          FloodFill(90,yPos + 90, yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(80, yPos + 90, 100, yPos + 100);
          line(80, yPos + 90, 100, yPos + 80);
          line(100, yPos + 100, 105, yPos + 90);
          line(100, yPos + 80, 105, yPos + 90);
          SetFillStyle(1, lightRed);
          FloodFill(90,yPos + 90, Red);
        end;
      end;

      if (key = #77) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(317, yPos + 90, 297, yPos + 100);
          line(317, yPos + 90, 297, yPos + 80);
          line(297, yPos + 100, 292, yPos + 90);
          line(297, yPos + 80, 292, yPos + 90);
          SetFillStyle(1, lightGreen);
          FloodFill(310,yPos + 90, Green);

          setColor(yellow);
          setLineStyle(0, 0, 3);
          line(317, yPos + 90, 297, yPos + 100);
          line(317, yPos + 90, 297, yPos + 80);
          line(297, yPos + 100, 292, yPos + 90);
          line(297, yPos + 80, 292, yPos + 90);
          SetFillStyle(1, yellow);
          FloodFill(310,yPos + 90, yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(317, yPos + 90, 297, yPos + 100);
          line(317, yPos + 90, 297, yPos + 80);
          line(297, yPos + 100, 292, yPos + 90);
          line(297, yPos + 80, 292, yPos + 90);
          SetFillStyle(1, lightRed);
          FloodFill(310,yPos + 90, Red);
        end;
      end;
    end;
    2 : begin
      if (key = #75) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(80, yPos + 150, 100, yPos + 160);
          line(80, yPos + 150, 100, yPos + 140);
          line(100, yPos + 160, 105, yPos + 150);
          line(100, yPos + 140, 105, yPos + 150);
          SetFillStyle(1, lightGreen);
          FloodFill(90,yPos + 150, Green);

          setColor(yellow);
          setLineStyle(0, 0, 3);
          line(80, yPos + 150, 100, yPos + 160);
          line(80, yPos + 150, 100, yPos + 140);
          line(100, yPos + 160, 105, yPos + 150);
          line(100, yPos + 140, 105, yPos + 150);
          SetFillStyle(1, yellow);
          FloodFill(90,yPos + 150, yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(80, yPos + 150, 100, yPos + 160);
          line(80, yPos + 150, 100, yPos + 140);
          line(100, yPos + 160, 105, yPos + 150);
          line(100, yPos + 140, 105, yPos + 150);
          SetFillStyle(1, lightRed);
          FloodFill(90,yPos + 150, Red);
        end;
      end;

      if (key = #77) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(317, yPos + 150, 297, yPos + 160);
          line(317, yPos + 150, 297, yPos + 140);
          line(297, yPos + 160, 292, yPos + 150);
          line(297, yPos + 140, 292, yPos + 150);
          SetFillStyle(1, lightGreen);
          FloodFill(310,yPos + 150, Green);

          setColor(yellow);
          setLineStyle(0, 0, 3);
          line(317, yPos + 150, 297, yPos + 160);
          line(317, yPos + 150, 297, yPos + 140);
          line(297, yPos + 160, 292, yPos + 150);
          line(297, yPos + 140, 292, yPos + 150);
          SetFillStyle(1, yellow);
          FloodFill(310,yPos + 150, yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(317, yPos + 150, 297, yPos + 160);
          line(317, yPos + 150, 297, yPos + 140);
          line(297, yPos + 160, 292, yPos + 150);
          line(297, yPos + 140, 292, yPos + 150);
          SetFillStyle(1, lightRed);
          FloodFill(310,yPos + 150, Red);
        end;
      end;
    end;
    3 : begin
      if (key = #75) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(80, yPos + 210, 100, yPos + 220);
          line(80, yPos + 210, 100, yPos + 200);
          line(100, yPos + 220, 105, yPos + 210);
          line(100, yPos + 200, 105, yPos + 210);
          SetFillStyle(1, lightGreen);
          FloodFill(90,yPos + 210, Green);

          setColor(Yellow);
          setLineStyle(0, 0, 3);
          line(80, yPos + 210, 100, yPos + 220);
          line(80, yPos + 210, 100, yPos + 200);
          line(100, yPos + 220, 105, yPos + 210);
          line(100, yPos + 200, 105, yPos + 210);
          SetFillStyle(1, Yellow);
          FloodFill(90,yPos + 210, Yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(80, yPos + 210, 100, yPos + 220);
          line(80, yPos + 210, 100, yPos + 200);
          line(100, yPos + 220, 105, yPos + 210);
          line(100, yPos + 200, 105, yPos + 210);
          SetFillStyle(1, lightRed);
          FloodFill(90,yPos + 210, Red);
        end;
      end;

      if (key = #77) then
      begin
        for i := 1 to 10 do
        begin
          setColor(Green);
          setLineStyle(0, 0, 3);
          line(252, yPos + 210, 232, yPos + 220);
          line(252, yPos + 210, 232, yPos + 200);
          line(232, yPos + 220, 227, yPos + 210);
          line(232, yPos + 200, 227, yPos + 210);
          SetFillStyle(1, lightGreen);
          FloodFill(242,yPos + 210, Green);

          setColor(Yellow);
          setLineStyle(0, 0, 3);
          line(252, yPos + 210, 232, yPos + 220);
          line(252, yPos + 210, 232, yPos + 200);
          line(232, yPos + 220, 227, yPos + 210);
          line(232, yPos + 200, 227, yPos + 210);
          SetFillStyle(1, Yellow);
          FloodFill(242,yPos + 210, Yellow);

          setColor(Red);
          setLineStyle(0, 0, 3);
          line(252, yPos + 210, 232, yPos + 220);
          line(252, yPos + 210, 232, yPos + 200);
          line(232, yPos + 220, 227, yPos + 210);
          line(232, yPos + 200, 227, yPos + 210);
          SetFillStyle(1, lightRed);
          FloodFill(242,yPos + 210, Red);
        end;
      end;
    end;
  end;
end;

procedure optionsMenu.change(key : char);
var
  cStr : string;
  yPos : integer;
begin
  yPos := 110;
  case drawMode of
    1 : begin
      if (key = #75) then
      begin
        LAM[1] := LAM[1] - 0.2;
      end
      else begin
        LAM[1] := LAM[1] + 0.2;
      end;

      if (LAM[1] < 0.1) then
      begin
        arrowDance(key);
        LAM[1] := 0.2;
      end
      else if (LAM[1] > 5.1) then
      begin
        arrowDance(key);
        LAM[1] := 5.0;
      end
      else begin
        arrowPush(key);
        setColor(lightGreen);
        setTextStyle(0, 0 , 3);
        setFillStyle(solidFill, black);
        bar(430, 180, 640, 220);
        str(LAM[1]:0:1, cStr);
        OutTextXY(430, yPos + 80, cStr);
        if ((LAM[1] > 4.9) or (LAM[1] < 0.3)) then
        begin
          sys.limited;
        end;
      end;
    end;
    2 : begin
      if (key = #75) then
      begin
        LAM[3] := LAM[3] - 0.2;
      end
      else begin
        LAM[3] := LAM[3] + 0.2;
      end;

      if (LAM[3] < 0.1) then
      begin
        arrowDance(key);
        LAM[3] := 0.2;
      end
      else if (LAM[3] > 5.1) then
      begin
        arrowDance(key);
        LAM[3] := 5.0;
      end
      else begin
        arrowPush(key);
        setColor(lightRed);
        setTextStyle(0, 0 , 3);
        setFillStyle(solidFill, black);
        bar(430, 230, 640, 270);
        str(LAM[3]:0:1, cStr);
        OutTextXY(430, yPos + 140, cStr);
        if ((LAM[3] > 4.9) or (LAM[3] < 0.3)) then
        begin
          sys.limited;
        end;
      end;

    end;
    3 : begin
      if (key = #75) then
      begin
        amount := amount - 1000;
      end
      else begin
        amount := amount + 1000;
      end;

      if (amount < 1000) then
      begin
        arrowDance(key);
        amount := 1000;
      end
      else if (amount > 20000) then
      begin
        arrowDance(key);
        amount := 20000;
      end
      else begin
        arrowPush(key);
        setColor(white);
        setTextStyle(0, 0 , 3);
        setFillStyle(solidFill, black);
        bar(370, 300, 640, 480);
        str(amount, cStr);
        OutTextXY(430, yPos + 200, cStr);
        if ((amount = 1000) or (amount = 20000)) then
        begin
          sys.limited;
        end;
      end;

    end;
  end;
end;

procedure optionsMenu.draw;
const
  n = 4;
var
  yPos, cacheMode : integer;
  cStr : string;
  key : char;
  cache : array[1..3] of real;
begin
  yPos := 270;
  setTextStyle(0, 0 , 3);
  setFillStyle(solidFill, black);
  bar(80, 240, 640, 480);
  while (yPos <> 110) do
  begin
    setColor(black);
    yPos := (yPos - 10);
    bar(80, yPos, 640, 480);
    setColor(lightRed);
    OutTextXY(80, yPos, 'Options');

    setColor(lightGreen);
    OutTextXY(80, yPos, 'Options');
  end;
  setColor(yellow);
  OutTextXY(80, yPos, 'Options');

  setTextStyle(0, 0 , 3);
  setColor(green);
  OutTextXY(120, yPos + 80, 'LAM(S1)');
  setColor(lightGreen);
  str(LAM[1]:0:1, cStr);
  OutTextXY(430, yPos + 80, cStr);

  setColor(Red);
  OutTextXY(120, yPos + 140, 'LAM(S3)');
  setColor(lightRed);
  str(LAM[3]:0:1, cStr);
  OutTextXY(430, yPos + 140, cStr);

  setColor(white);
  OutTextXY(120, yPos + 200, 'KMIN');
  setColor(white);
  str(amount, cStr);
  OutTextXY(430, yPos + 200, cStr);

  setColor(Yellow);
  OutTextXY(260, yPos + 270, 'Save');

  setColor(Red);
  setLineStyle(0, 0, 3);
  line(80, yPos + 90, 100, yPos + 100);
  line(80, yPos + 90, 100, yPos + 80);
  line(100, yPos + 100, 105, yPos + 90);
  line(100, yPos + 80, 105, yPos + 90);
  SetFillStyle(1, lightRed);
  FloodFill(90,yPos + 90, Red);

  setColor(Red);
  setLineStyle(0, 0, 3);
  line(317, yPos + 90, 297, yPos + 100);
  line(317, yPos + 90, 297, yPos + 80);
  line(297, yPos + 100, 292, yPos + 90);
  line(297, yPos + 80, 292, yPos + 90);
  SetFillStyle(1, lightRed);
  FloodFill(310,yPos + 90, Red);

  if ((LAM[1] > 4.9) or (LAM[1] < 0.3)) then
  begin
    sys.limited;
  end;

  cache[1] := LAM[1];
  cache[2] := LAM[3];
  cache[3] := amount;

  drawMode := 1;
  key := '0';
  while true do
  begin
    key := '0';
    key := readkey;
    cacheMode := drawMode;
    case key of
      #72 : drawMode := drawMode - 1;
      #80 : drawMode := drawMode + 1;
      #75 : change(key);
      #77 : change(key);
      #13 : if (drawMode = 4) then break;
      else continue;
    end;

    if ((drawMode = 4) and ((key = #75) or (key = #77))) then
      key := '0';

    if drawMode < 1 then
      drawMode := 1;
    if drawMode > n then
      drawMode := n;

  case drawMode of
    1 : begin
      setColor(Red);
      setLineStyle(0, 0, 3);
      line(80, yPos + 90, 100, yPos + 100);
      line(80, yPos + 90, 100, yPos + 80);
      line(100, yPos + 100, 105, yPos + 90);
      line(100, yPos + 80, 105, yPos + 90);
      SetFillStyle(1, lightRed);
      FloodFill(90,yPos + 90, Red);

      setColor(Red);
      setLineStyle(0, 0, 3);
      line(317, yPos + 90, 297, yPos + 100);
      line(317, yPos + 90, 297, yPos + 80);
      line(297, yPos + 100, 292, yPos + 90);
      line(297, yPos + 80, 292, yPos + 90);
      SetFillStyle(1, lightRed);
      FloodFill(310,yPos + 90, Red);

      setFillStyle(solidFill, black);
      bar(370, 340, 640, 480);

      if ((LAM[1] > 4.9) or (LAM[1] < 0.3)) then
      begin
        sys.limited;
      end;
    end;
    2 : begin
      setColor(Red);
      setLineStyle(0, 0, 3);
      line(80, yPos + 150, 100, yPos + 160);
      line(80, yPos + 150, 100, yPos + 140);
      line(100, yPos + 160, 105, yPos + 150);
      line(100, yPos + 140, 105, yPos + 150);
      SetFillStyle(1, lightRed);
      FloodFill(90,yPos + 150, Red);

      setColor(Red);
      setLineStyle(0, 0, 3);
      line(317, yPos + 150, 297, yPos + 160);
      line(317, yPos + 150, 297, yPos + 140);
      line(297, yPos + 160, 292, yPos + 150);
      line(297, yPos + 140, 292, yPos + 150);
      SetFillStyle(1, lightRed);
      FloodFill(310,yPos + 150, Red);

      setFillStyle(solidFill, black);
      bar(370, 340, 640, 480);

      if ((LAM[3] > 4.9) or (LAM[3] < 0.3)) then
      begin
        sys.limited;
      end;
    end;
    3 : begin
      setColor(Red);
      setLineStyle(0, 0, 3);
      line(80, yPos + 210, 100, yPos + 220);
      line(80, yPos + 210, 100, yPos + 200);
      line(100, yPos + 220, 105, yPos + 210);
      line(100, yPos + 200, 105, yPos + 210);
      SetFillStyle(1, lightRed);
      FloodFill(90,yPos + 210, Red);

      setColor(Red);
      setLineStyle(0, 0, 3);
      line(252, yPos + 210, 232, yPos + 220);
      line(252, yPos + 210, 232, yPos + 200);
      line(232, yPos + 220, 227, yPos + 210);
      line(232, yPos + 200, 227, yPos + 210);
      SetFillStyle(1, lightRed);
      FloodFill(242,yPos + 210, Red);

      setFillStyle(solidFill, black);
      bar(370, 340, 640, 480);

      if ((amount = 1000) or (amount = 20000)) then
      begin
        sys.limited;
      end;
    end;
    4 : begin
      if (cacheMode <> drawMode) then
      begin
        setTextStyle(0, 0, 3);
        setColor(Black);
        OutTextXY(260, yPos + 270, 'Save');

        setColor(yellow);
        OutTextXY(260, yPos + 260, 'Save');

        setColor(green);
        OutTextXY(260, yPos + 260, 'Save');

        if (cache[1] <> LAM[1]) then
        begin
          setColor(yellow);
          str(LAM[1]:0:1, cStr);
          OutTextXY(430, yPos + 80, cStr);
        end;
        if (cache[2] <> LAM[3]) then
        begin
          setColor(yellow);
          str(LAM[3]:0:1, cStr);
          OutTextXY(430, yPos + 140, cStr);
        end;
        if (cache[3] <> amount) then
        begin
          setColor(yellow);
          str(amount, cStr);
          OutTextXY(430, yPos + 200, cStr);
        end;
      end;
      if (key = #13) then
        break;
    end;
  end;
  if (cacheMode <> drawMode) then
    case cacheMode of
      1 : begin
        setColor(Black);
        setLineStyle(0, 0, 3);
        line(80, yPos + 90, 100, yPos + 100);
        line(80, yPos + 90, 100, yPos + 80);
        line(100, yPos + 100, 105, yPos + 90);
        line(100, yPos + 80, 105, yPos + 90);
        SetFillStyle(1, black);
        FloodFill(90,yPos + 90, black);

        setColor(black);
        setLineStyle(0, 0, 3);
        line(317, yPos + 90, 297, yPos + 100);
        line(317, yPos + 90, 297, yPos + 80);
        line(297, yPos + 100, 292, yPos + 90);
        line(297, yPos + 80, 292, yPos + 90);
        SetFillStyle(1, black);
        FloodFill(310,yPos + 90, black);
      end;
      2 : begin
        setColor(Black);
        setLineStyle(0, 0, 3);
        line(80, yPos + 150, 100, yPos + 160);
        line(80, yPos + 150, 100, yPos + 170);
        line(100, yPos + 160, 105, yPos + 150);
        line(100, yPos + 140, 105, yPos + 150);
        SetFillStyle(1, black);
        FloodFill(90,yPos + 150, black);

        setColor(Black);
        setLineStyle(0, 0, 3);
        line(317, yPos + 150, 297, yPos + 160);
        line(317, yPos + 150, 297, yPos + 140);
        line(297, yPos + 160, 292, yPos + 150);
        line(297, yPos + 140, 292, yPos + 150);
        SetFillStyle(1, Black);
        FloodFill(310,yPos + 150, Black);
      end;
      3 : begin
        setColor(Black);
        setLineStyle(0, 0, 3);
        line(80, yPos + 210, 100, yPos + 220);
        line(80, yPos + 210, 100, yPos + 230);
        line(100, yPos + 220, 105, yPos + 210);
        line(100, yPos + 200, 105, yPos + 210);
        SetFillStyle(1, black);
        FloodFill(90,yPos + 210, black);

        setColor(Black);
        setLineStyle(0, 0, 3);
        line(252, yPos + 210, 232, yPos + 220);
        line(252, yPos + 210, 232, yPos + 200);
        line(232, yPos + 220, 227, yPos + 210);
        line(232, yPos + 200, 227, yPos + 210);
        SetFillStyle(1, black);
        FloodFill(242,yPos + 210, black);
      end;
      4 : begin
        setColor(yellow);
        setTextStyle(0, 0, 3);
        setFillStyle(solidFill, black);
        setColor(black);
        OutTextXY(260, yPos + 260, 'Save');

        setColor(green);
        OutTextXY(260, yPos + 270, 'Save');

        setColor(yellow);
        OutTextXY(260, yPos + 270, 'Save');

        if (cache[1] <> LAM[1]) then
        begin
          setColor(lightGreen);
          str(LAM[1]:0:1, cStr);
          OutTextXY(430, yPos + 80, cStr);
        end;

        if (cache[2] <> LAM[3]) then
        begin
          setColor(lightRed);
          str(LAM[3]:0:1, cStr);
          OutTextXY(430, yPos + 140, cStr);
        end;

        if (cache[3] <> amount) then
        begin
          setColor(white);
          str(amount, cStr);
          OutTextXY(430, yPos + 200, cStr);
        end;

      end;
    end;
  end;
end;

procedure graphsMenu.refreshGraphs(mode : integer);
var
  i : integer;
  strDot, strDia : string;
  titles : array[1..2] of string;
begin
  setTextStyle(0, 0 , 3);
  if (mode = 2) then
    refreshCMO
  else begin
    for i := 1 to 10 do
    begin
      setColor(lightRed);
      OutTextXY(120, 180, 'Graph');

      setColor(lightGreen);
      OutTextXY(120, 180, 'Graph');
    end;
    refreshBK;
  end;

  setTextStyle(0, 0 , 3);
  titles[1] := '';
  titles[2] := '';
  setColor(black);
  OutTextXY(120, 270, 'Table');
  setColor(yellow);
  OutTextXY(80, 110, 'Results');
  setColor(Green);
  OutTextXY(120, 190, 'Graph');

  setColor(lightred);
  strDot := 'Dot Graph';
  strDia := 'Diagrame';
  for i := 1 to length(strDot) do
  begin
    titles[1] := titles[1] + strDot[i];
    OutTextXY(160, 270, titles[1]);
  end;
  for i := 1 to length(strDia) do
  begin
    titles[2] := titles[2] + strDia[i];
    OutTextXY(160, 350, titles[2]);
  end;
end;

procedure graphsMenu.draw;
const
  n = 2;
var
  key : char;
  cacheMode, i : integer;
begin
  refreshGraphs(1);

  drawMode := 0;
  key := '0';
  while (key <> #8) do
  begin
    key := '0';
    while ((key <> #72) and (key <> #80)) do
    begin
      key := readkey;
      cacheMode := drawMode;
      case key of
        #80 : drawMode := drawMode + 1;
        #72 : drawMode := drawMode - 1;
        #13 : break;
        #8 : break;
      end;
    end;
    if ((key <> #8) and (key <> #13)) then
    begin
      if (drawMode < 1) then
        drawMode := 1;
      if (drawMode > n) then
        drawMode := n;
        setTextStyle(0, 0 , 3);
        if (cacheMode <> drawMode) then
          case drawMode of
            1 : begin
              setColor(black);
              setTextStyle(0, 0 , 3);
              OutTextXY(160, 270, 'Dot Graph');

              setColor(lightRed);
              OutTextXY(160, 260, 'Dot Graph');

              setColor(lightGreen);
              OutTextXY(160, 260, 'Dot Graph');
            end;
            2 : begin
              setColor(black);
              setTextStyle(0, 0 , 3);
              OutTextXY(160, 350, 'Diagrame');

              setColor(lightRed);
              OutTextXY(160, 340, 'Diagrame');

              setColor(lightGreen);
              OutTextXY(160, 340, 'Diagrame');
            end;
          end;
        if (drawMode <> cacheMode) then
          case cacheMode of
            1 : begin
              setColor(black);
              setTextStyle(0, 0 , 3);
              OutTextXY(160, 260, 'Dot Graph');

              setColor(lightGreen);
              OutTextXY(160, 270, 'Dot Graph');

              setColor(lightred);
              OutTextXY(160, 270, 'Dot Graph');
            end;
            2 : begin
              setColor(black);
              setTextStyle(0, 0 , 3);
              OutTextXY(160, 340, 'Diagrame');

              setColor(lightGreen);
              OutTextXY(160, 350, 'Diagrame');

              setColor(lightRed);
              OutTextXY(160, 350, 'Diagrame');
            end;
          end;
      end;
      setTextStyle(0, 0 , 3);
      if ((key = #13) and (drawMode <> 0)) then
      begin
        case drawMode of
          1 : begin
            for i := 1 to 10 do
            begin
              setColor(lightRed);
              OutTextXY(160, 260, 'Dot Graph');

              setColor(lightGreen);
              OutTextXY(160, 260, 'Dot Graph');
            end;
            LAMpan.chooseLAM;
            refreshBK;
            sys.generating;
            startGeneration(2);
            refreshGraphs(2);
          end;
          2 : begin
            for i := 1 to 10 do
            begin
              setColor(lightRed);
              OutTextXY(160, 340, 'Diagrame');

              setColor(lightGreen);
              OutTextXY(160, 340, 'Diagrame');
            end;
            LAMpan.chooseLAM;
            startGeneration(1);
            refreshGraphs(2);
          end;
        end;
        drawMode := 0;
      end;
  end;
end;

procedure result.refreshResult;
var
i : integer;
titles : array[1..2] of string;
strTable, strGraph : string;
begin
  refreshBK;
  setColor(Green);
  setTextStyle(0, 0 , 3);
  OutTextXY(80, 110, 'Results');

  strGraph := 'Graph';
  strTable := 'Table';
  titles[1] := '';
  titles[2] := '';
  i := 1;
  setColor(lightRed);
  while (i <= length(strTable)) do
  begin
    titles[1] := titles[1] + strGraph[i];
    OutTextXY(120, 190, titles[1]);
    Inc(i);
  end;
  i := 1;
  while (i <= length(strTable)) do
  begin
    titles[2] := titles[2] + strTable[i];
    OutTextXY(120, 270, titles[2]);
    Inc(i);
  end;
end;

procedure result.draw;
const
  n = 2;
var
  yPos, i, cacheMode : integer;
  key : char;
  graphs : graphsMenu;
begin
  setTextStyle(0, 0 , 3);
  setFillStyle(solidFill, Black);
  yPos := 190;
  while (yPos <> 110) do
  begin
    setColor(black);
    yPos := (yPos - 10);
    bar(80, yPos, 640, 480);

    setColor(lightRed);
    OutTextXY(80, yPos, 'Results');

    setColor(lightGreen);
    OutTextXY(80, yPos, 'Results');
  end;
  refreshResult;

  drawMode := 0;
  key := '0';
  while (key <> #8) do
  begin
    key := '0';
    cacheMode := drawMode;
    while ((key <> #80) and (key <> #72)) do
    begin
      key := readkey;
      case key of
        #80 : drawMode := drawMode + 1;
        #72 : drawMode := drawMode - 1;
        #13 : break;
        #8 : break;
      end;
    end;
    if ((key <> #8) and (key <> #13)) then
    begin

      if (drawMode < 1) then
        drawMode := 1;
      if (drawMode > n) then
        drawMode := n;

      setTextStyle(0, 0 , 3);
      setFillStyle(solidFill, black);
      if (drawMode <> cacheMode) then
        bar(280, 100, 640, 480);
      if (drawMode <> CacheMode) then
        case drawMode of
          1 : begin
            setColor(black);
            OutTextXY(120, yPos + 80, 'Graph');
            setColor(lightGreen);
            OutTextXY(120, yPos + 70, 'Graph');
            setColor(Yellow);
            setTextStyle(0, 0 , 2);
            OutTextXY(400, 340, '- Dot Graph');
            OutTextXY(400, 370, '- Diagrame');
          end;
          2 : begin
            setColor(black);
            OutTextXY(120, yPos + 160, 'Table');
            setColor(lightGreen);
            OutTextXY(120, yPos + 150, 'Table');
            setTextStyle(0, 0 , 2);
            setColor(Yellow);
            OutTextXY(400, 340, '- Result Table');
          end;
        end;

      setTextStyle(0, 0 , 3);
      if (cacheMode <> drawMode) then
        case cacheMode of
          1 : begin
            setColor(black);
            OutTextXY(120, yPos + 70, 'Graph');
            setColor(lightred);
            OutTextXY(120, yPos + 80, 'Graph');
          end;
          2 : begin
            setColor(black);
            OutTextXY(120, yPos + 150, 'Table');
            setColor(lightRed);
            OutTextXY(120, yPos + 160, 'Table');
          end;
        end;
      end;

      if ((key = #13) and (drawMode <> 0)) then
      begin
        case drawMode of
          1 : graphs.draw;
          2 : begin
            setTextStyle(0, 0 , 3);
            for i := 1 to 10 do
            begin
              setColor(lightRed);
              OutTextXY(120, 260, 'Table');

              setColor(lightGreen);
              OutTextXY(120, 260, 'Table');
            end;
            refreshBK;
            tab.drawTable;
          end;
        end;
        drawMode := 0;
        refreshResult;
      end;
  end;
end;

procedure globalMenu.refreshMainMenu(mode : integer);
var
  strOut: string;
  i, j : integer;
  titles : array[1..4] of string;
begin
  if (mode = 1) then
    refreshBK
  else
    refreshCMO;

  titles[1] := 'Start Generation';
  titles[2] := 'Result';
  titles[3] := 'Options';
  titles[4] := 'Help';

  setColor(lightRed);
  setTextStyle(0, 0 , 3);
  for i := 1 to 4 do
  begin
    strOut := '';
    for j := 1 to length(titles[i]) do
    begin
      strOut := strOut + titles[i][j];
      OutTextXY(80, 110 + (80 * (i - 1)), strOut);
    end;
  end;

  setColor(black);
  OutTextXY(80, 110, 'Start Generation');
  setColor(lightRed);
  OutTextXY(80, 100, 'Start Generation');
  setColor(lightGreen);
  OutTextXY(80, 100, 'Start Generation');

  setColor(yellow);
  setTextStyle(0, 0 , 2);
  OutTextXY(400, 340, '- Generation');
end;

procedure globalMenu.draw(var gMode, exit : integer);
var
  i, cacheMode, cacheExit : integer;
  key : char;
begin
  refreshMainMenu(1);
  drawMode := 1;
  key := '0';
  while ((key <> #13) and (key <> #27)) do
  begin
    key := '0';
    cacheMode := drawMode;
    while ((key <> #80) and (key <> #72)) do
    begin
      key := readkey;
      case key of
        #72 : drawMode := drawMode - 1;
        #80 : drawMode := drawMode + 1;
        #13 : break;
        #27 : begin
          refreshBK;
          sys.exit;
          while (key <> #13) do
          begin
            cacheExit := exit;
            key := readkey;
            case key of
              #75 : exit := 1;
              #77 : exit := 0;
            end;

            setTextStyle(0, 0 , 3);
            if (cacheExit <> exit) then
              case exit of
                1 : begin
                  setColor(black);
                  OutTextXY(80, 330, 'Exit');
                  setColor(Red);
                  OutTextXY(80, 320, 'Exit');
                  setColor(Green);
                  OutTextXY(80, 320, 'Exit');
                end;
                0 : begin
                  setColor(black);
                  OutTextXY(420, 330, 'Cancel');
                  setColor(Red);
                  OutTextXY(420, 320, 'Cancel');
                  setColor(Green);
                  OutTextXY(420, 320, 'Cancel');
                end;
              end;
              if (cacheExit <> exit) then
                case cacheExit of
                  1 : begin
                    setColor(black);
                    OutTextXY(80, 320, 'Exit');
                    setColor(Green);
                    OutTextXY(80, 330, 'Exit');
                    setColor(Red);
                    OutTextXY(80, 330, 'Exit');
                  end;
                  0 : begin
                    setColor(black);
                    OutTextXY(420, 320, 'Cancel');
                    setColor(Green);
                    OutTextXY(420, 330, 'Cancel');
                    setColor(Red);
                    OutTextXY(420, 330, 'Cancel');
                  end;
                end;
          end;
          case exit of
            1 : begin
              drawMode := 0;
              break;
            end;
            0 : begin
              drawMode := 1;
              cacheMode := drawMode;
              refreshMainMenu(1);
            end;
          end;
        end;
      end;
    end;

    if (exit <> 1) then
    begin
      if (drawMode > 4) then
        drawMode := 4;
      if (drawMode < 1) then
        drawMode := 1;
      setFillStyle(solidFill, black);
      if cacheMode <> drawMode then
      begin
        bar(280, 260, 640, 480);
        case drawMode of
          1 : begin
            setTextStyle(0, 0 , 3);
            setColor(black);
            OutTextXY(80, 110, 'Start Generation');
            setColor(lightRed);
            OutTextXY(80, 100, 'Start Generation');
            setColor(lightGreen);
            OutTextXY(80, 100, 'Start Generation');
            setColor(Yellow);
            setTextStyle(0, 0 , 2);
            OutTextXY(400, 340, '- Generation');
          end;
          2 : begin
            setTextStyle(0, 0 , 3);
            setColor(black);
            OutTextXY(80, 190, 'Results');
            setColor(lightRed);
            OutTextXY(80, 180, 'Results');
            setColor(lightGreen);
            OutTextXY(80, 180, 'Results');
            setColor(Yellow);
            setTextStyle(0, 0 , 2);
            OutTextXY(400, 340, '- Graph');
            OutTextXY(400, 370, '- Table');
          end;
          3 : begin
            setTextStyle(0, 0 , 3);
            setColor(black);
            OutTextXY(80, 270, 'Options');
            setColor(lightRed);
            OutTextXY(80, 260, 'Options');
            setColor(lightGreen);
            OutTextXY(80, 260, 'Options');
            setColor(Yellow);
            setTextStyle(0, 0 , 2);
            OutTextXY(400, 340, '- LAM(S1)');
            OutTextXY(400, 370, '- LAM(S3)');
            OutTextXY(400, 400, '- KMIN');
          end;
          4 : begin
            setTextStyle(0, 0 , 3);
            setColor(black);
            OutTextXY(80, 350, 'Help');
            setColor(lightRed);
            OutTextXY(80, 340, 'Help');
            setColor(lightGreen);
            OutTextXY(80, 340, 'Help');
            setColor(Yellow);
            setTextStyle(0, 0 , 2);
            OutTextXY(400, 340, '- Information');
          end;
        end;
      end;

    if (cacheMode <> drawMode) then
        case cacheMode of
        1 : begin
          setTextStyle(0, 0 , 3);
          setColor(black);
          OutTextXY(80, 100, 'Start Generation');
          setColor(lightGreen);
          OutTextXY(80, 110, 'Start Generation');
          setColor(lightRed);
          OutTextXY(80, 110, 'Start Generation');
        end;
        2 : begin
          setTextStyle(0, 0 , 3);
          setColor(black);
          OutTextXY(80, 180, 'Results');
          setColor(lightGreen);
          OutTextXY(80, 190, 'Results');
          setColor(lightRed);
          OutTextXY(80, 190, 'Results');
        end;
        3 : begin
          setTextStyle(0, 0 , 3);
          setColor(black);
          OutTextXY(80, 260, 'Options');
          setColor(lightGreen);
          OutTextXY(80, 270, 'Options');
          setColor(lightRed);
          OutTextXY(80, 270, 'Options');
        end;
        4 : begin
          setTextStyle(0, 0 , 3);
          setColor(black);
          OutTextXY(80, 340, 'Help');

          setColor(lightGreen);
          OutTextXY(80, 350, 'Help');

          setColor(lightRed);
          OutTextXY(80, 350, 'Help');
        end;
      end;
    end;
end;
if (drawMode = 1) then begin
  setTextStyle(0, 0 , 3);
  for i := 1 to 10 do
  begin
    setColor(lightRed);
    OutTextXY(80, 100, 'Start Generation');

    setColor(lightGreen);
    OutTextXY(80, 100, 'Start Generation');
  end;
  LAMpan.chooseLAM;
  refreshBK;
  sys.generating
end;
gMode := drawMode;
end;

procedure mainMenu;
var
  menu : globalMenu;
  res : result;
  options : optionsMenu;
  help : helpMenu;
  mode, exit : integer;
begin
  exit := 0;
  amount := 1000;
  LAM[1] := 2;
  LAM[2] := 1;
  LAM[3] := 1;
  finalLAM2 := 3;
  det := 0.2;
  refreshCMO;
  while (exit <> 1) do
  begin
    mode := 0;
    menu.draw(mode, exit);
    case mode of
      1 : startGeneration(0);
      2 : res.draw;
      3 : options.draw;
      4 : help.draw;
    end;
  end;
end;

begin
end.
