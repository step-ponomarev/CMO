program CMO;
uses iface_, graph, crt;

var
gd, gm : integer;
begin
  initgraph(gd, gm, 'C:\tp\bgi');
  if graphresult <> 0 then
  begin
    writeln('mistake,graphresult= ',graphresult); halt;
  end;
  mainMenu;
  closeGraph;
end.
