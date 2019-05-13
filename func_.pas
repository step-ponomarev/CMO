unit func_;

interface
uses graphic_, graph, crt;

type
device = object
  START : real;
  TOSV : real;
  OBR : integer;
  procedure reset(startTime : real; NUMB : integer);
  procedure restart;
end;

source = object
  TIME, TAY : real;
  TOBS : real;
  KMIN, KOTK, KOBR : longInt;
  constructor Init;
  function getTay(LAMBDA : real) : real; virtual;
  function pOtk : real;
  procedure genRequest(LAM : real);
  procedure restart;
end;

sources = object(source)
  function getTay(LAMBDA : real) : real; virtual;
end;
sourceArray = array[2..3] of sources;

request = object
	TPOST : real;
end;
requestArray = array [1..3] of request;

procedure newRequest(var requests : requestArray; OBR : integer; var s1 : source; var s : sourceArray);

procedure newNMIN(var NMIN : integer);
function kZan_P1(LAST_TIME : real) : real;
function MObs : real;
procedure startGeneration(mode : integer);
procedure makeGraph(mode : integer; var lock : integer);

var
  tab : table;
  s1 : source;
  s : sourceArray;
  amount, kOut : longInt;
  requests : requestArray;
implementation

function source.pOtk : real;
begin
  pOtk := (KOTK / KMIN);
end;

function source.getTay(LAMBDA : real) : real;
begin
  getTay := -1/LAMBDA*ln(Random * Random);
end;

procedure source.genRequest(LAM : real);
begin
  TAY := getTAY(LAM);
  TIME := TIME + TAY;
  Inc(KMIN);
end;

procedure source.restart;
begin
  TIME := 0;
  KMIN := 0;
  TAY := 0;
  KOTK := 0;
  TOBS := 0;
  KOBR := 0;
end;

constructor source.Init;
begin
end;

function sources.getTay(LAMBDA : real) : real;
begin
  getTay := -1/LAMBDA*ln(Random);
end;

procedure device.reset(startTime : real; NUMB : integer);
begin
  START := startTime;
  TOSV := startTime + (-1/1*ln(Random));
  OBR := NUMB;
end;

procedure device.restart;
begin
  START := 0;
  OBR := 0;
  TOSV := 0;
end;

procedure newRequest(var requests : requestArray; OBR : integer; var s1 : source; var s : sourceArray);
begin
  if (OBR = 1) then
  begin
    s1.genRequest(LAM[OBR]);
    requests[OBR].TPOST := s1.TIME;
  end
  else begin
    s[OBR].genRequest(LAM[OBR]);
    requests[OBR].TPOST := s[OBR].TIME;
  end;
end;

procedure makeGraph(mode : integer; var lock : integer);
var
  i : integer;
begin
  case mode of
    1 : begin
      if (lock = 0) then
      begin
        graph1.reset;
        graph1.drawSystem;
        setColor(lightRed);
        setTextStyle(0, 0 , 2);
        OutTextXY(520, 120, '0%');
        lock := 1;
      end;
      for i := 1 to 3 do
      begin
        if (i <> 1) then
          graph1.drawLines(s[i].pOtk, i)
        else
          graph1.drawLines(s1.pOtk, i);
      end;
    end;
    2 : begin
      if (lock = 0) then
      begin
        graph2.drawSystem;
        setColor(lightGreen);
        setTextStyle(0, 0 , 2);
        OutTextXY(520, 120, '99%');
        lock := 1;
      end;
      for i := 1 to 3 do
      begin
        if (i <> 1) then
        begin
          if (s[i].KMIN mod kOut = 0) and ((s[i].KMIN / kOut) < 420) then
            graph2.setDot(round(s[i].KMIN/kOut), s[i].pOtk, i);
        end
        else if (s1.KMIN mod kOut = 0) and ((s1.KMIN / kOut) < 420) then
        begin
            graph2.setDot(round(s1.KMIN / kOut), s1.pOtk, i);
        end;
      end;
    end;
  end;
end;
procedure newNMIN(var NMIN : integer);
var
minTime : real;
begin
  minTime := requests[1].TPOST;
  NMIN := 1;
  if requests[2].TPOST < minTime then
  begin
    minTime := requests[2].TPOST;
    NMIN := 2;
  end;
  if requests[3].TPOST < minTime then
  begin
    minTime := requests[3].TPOST;
    NMIN := 3;
  end;
end;

function kZan_P1(LAST_TIME : real) : real;
begin
  kZan_P1 := s1.TOBS / LAST_TIME;
end;
function MObs : real;
begin
  MObs := s[2].TOBS / s[2].KOBR;
end;

procedure startGeneration(mode : integer);
var
  p : device;
  i, n : integer;
  lock, delta : integer;
  NMIN : integer;
  cache : stackData;
  sys : system_;
  cStr : string;
  progress : integer;
  cacheLam : array[1..3] of real;
begin
  if (mode = 2) then
    sys.generating;

  kOut := round(amount * 0.0005);
  if kOut < 1 then
    inc(kOut);

  progress := -10;
  delta := 10;
  if (mode = 0) then
  begin
    setColor(lightRed);
    setTextStyle(0, 0 , 3);
    OutTextXY(350, 250, '0%');
  end;

  cacheLam[1] := LAM[1];
  cacheLam[2] := LAM[2];
  cacheLam[3] := LAM[3];

  lock := 0;
  graph1.init;
  graph2.init(amount);
  s1.Init;
  s[2].Init;
  s[3].Init;

  n := 0;

  while (LAM[2] < (finalLAM2 + 0.1)) do
  begin
    randomize;
    p.restart;
    s1.restart;
    s[2].restart;
    s[3].restart;
    for i := 1 to 3 do
      newRequest(requests, i, s1, s);
    newNMIN(NMIN);
    Inc(n);

    while (s1.KMIN <= amount) or (s[2].KMIN <= amount) or (s[3].KMIN <= amount) do
    begin
      if ((lam[2] > (finalLAM2 - 0.1)) and (mode = 2)) then
        makeGraph(2, lock);
      if (requests[NMIN].TPOST < p.TOSV) then
      begin
        if (p.OBR > NMIN) then
        begin
          Inc(s[p.OBR].KOTK);
          p.reset(requests[NMIN].TPOST, NMIN);
        end
        else if (p.OBR <= NMIN) then {Low priority}
        begin
          if (NMIN <> 1) then
            Inc(s[NMIN].KOTK)
          else
            Inc(s1.KOTK);
        end;
      end
      else if (requests[NMIN].TPOST > p.TOSV) then
      begin
        if (p.OBR <> 0) then
          if (p.OBR <> 1) then
          begin
            Inc(s[p.OBR].KOBR);
            s[p.OBR].TOBS := s[p.OBR].TOBS + (p.TOSV - p.START);
          end
          else begin
            Inc(s1.KOBR);
            s1.TOBS := s1.TOBS + (p.TOSV - p.START);
          end;
        p.reset(requests[NMIN].TPOST, NMIN);
        end;
      newRequest(requests, NMIN, s1, s);
      newNMIN(NMIN);
    end;

    Inc(s1.KOTK);
    Inc(s[2].KOTK);
    Inc(s[3].KOTK);

    if (p.OBR <> 1) then
    begin
      Inc(s[p.OBR].KOBR);
      s[p.OBR].TOBS := s[p.OBR].TOBS + (p.TOSV - p.START);
    end
    else begin
      Inc(s1.KOBR);
      s1.TOBS := s1.TOBS + (p.TOSV - p.START);
    end;

    cache[n].LAM := LAM[2];
    with cache[n] do
    begin
      POTK[1] := s1.pOtk;
      POTK[2] := s[2].pOtk;
      POTK[3] := s[3].pOtk;
      KZANP1 := kZan_P1(p.TOSV);
      MOBS2 := MObs;
    end;

    progress := progress + delta;
    if (progress >= 100) then
      progress := 100;

    if ((mode = 0) and (progress > 0) and (progress <= 100)) then
    begin
      setFillStyle(solidFill, black);
      bar(320, 200, 640, 480);
      setTextStyle(0, 0 , 3);
      if (progress <= 30) then
        setColor(lightRed);
      if (progress > 30) then
        setColor(yellow);
      if (progress >= 70) then
        setColor(lightGreen);
      str(progress, cStr);
      cStr := cStr + '%';
      OutTextXY(350, 250, cStr);
    end;

    if ((mode <> 0) and (progress > 0) and (progress <= 100)) then
    begin
      if (mode <> 2) then
      begin
        setFillStyle(solidFill, black);
        bar(480, 120, 640, 250);
        setTextStyle(0, 0 , 2);
        if (progress <= 30) then
          setColor(lightRed);
        if (progress > 30) then
          setColor(yellow);
        if (progress >= 70) then
          setColor(lightGreen);
        str(progress, cStr);
        cStr := cStr + '%';
        OutTextXY(520, 120, cStr);
        if (LAM[2] >= finalLAM2) then
        begin
          setColor(black);
          OutTextXY(520, 120, cStr);
          setColor(lightGreen);
          OutTextXY(520, 120, '100%');
        end
      end
      else
      if (LAM[2] > (finalLAM2 - 0.1)) then
      begin
        setFillStyle(solidFill, black);
        bar(480, 120, 640, 250);
        str(progress, cStr);
        cStr := cStr + '%';
        OutTextXY(520, 120, cStr);
      end
      else begin
        setFillStyle(solidFill, black);
        bar(320, 200, 640, 480);
        setTextStyle(0, 0 , 3);
        if (progress <= 30) then
          setColor(lightRed);
        if (progress > 30) then
          setColor(yellow);
        if (progress >= 70) then
          setColor(lightGreen);
        str(progress, cStr);
        cStr := cStr + '%';
        OutTextXY(350, 250, cStr);
      end;
      if (LAM[2] >= finalLAM2) then
      begin
        setFillStyle(solidFill, black);
        bar(500, 100, 640, 140);
        setColor(Green);
        setTextStyle(0, 0 , 2);
        OutTextXY(520, 120, '100%');
      end;
    end;

    if (mode = 1) then
      makeGraph(mode, lock);

    LAM[2] := LAM[2] + det;
  end;

  tab.getData(cache, n);

  if (mode <> 0) then
    while (readkey <> #13) do
  else begin
    sys.generationInfo(amount);
  end;

  LAM[1] := cacheLam[1];
  LAM[2] := cacheLam[2];
  LAM[3] := cacheLam[3];
end;

begin
end.
