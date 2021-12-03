Program KOZEL;
Uses crt,dos;
var
f1,f2:file of byte;
cards: array[1..36,1..12] of byte;
key:char;
yaytsa,scorei,scorek,hide,mol,scheti,schetk,mast,max,ukvzk,ukvzi:byte;
ksk,kbk,kozir,nado1,nado2,x1,y1,x2,y2,ukkart,n,i,j,card1,card2,buffer:byte;

Label
metka1,metka2,metka3,metka4,metka5,metka6,exit;

FUNCTION PR_STOLA(n:byte):byte;
BEGIN
For i:=1 to 4 Do
begin
If cards[i,8]<>0 then
   begin
   PR_STOLA:=cards[i,8];
   break;
   end
else PR_STOLA:=0;
end;
END;
                      {Описание глобальных переменных}
       {Универсальная процедура вывода значения и масти карт на экран}

{x1,y1=коорд масс,x2,y2=коорд экрана, nado1,nado2=вывод массива от и до}
PROCEDURE VIVOD(x1,y1,x2,y2,nado1,nado2,hide:byte);
BEGIN
For i:=nado1 to nado2 do
     begin

{Значение карт}
     If cards[x1,y1]=0 then
          begin
          gotoxy(x2,y2);
          write(' ');
          end;
     If hide=1 then if cards[x1,y1]<>0 then
          begin
          gotoxy(x2,y2);
          write('▒');
          end;
     If hide=0 then if cards[x1,y1]=49 then
          begin
          gotoxy(x2,y2);
          write('6');
          end;
     If hide=0 then if cards[x1,y1]=50 then
          begin
          gotoxy(x2,y2);
          write('7');
          end;
     If hide=0 then if cards[x1,y1]=51 then
          begin
          gotoxy(x2,y2);
          write('8');
          end;
     If hide=0 then if cards[x1,y1]=52 then
          begin
          gotoxy(x2,y2);
          write('9');
          end;
     If hide=0 then if cards[x1,y1]=53 then
          begin
          gotoxy(x2,y2);
          write('J');
          end;
     If hide=0 then if cards[x1,y1]=54 then
          begin
          gotoxy(x2,y2);
          write('Q');
          end;
     If hide=0 then if cards[x1,y1]=55 then
          begin
          gotoxy(x2,y2);
          write('K');
          end;
     If hide=0 then if cards[x1,y1]=56 then
          begin
          gotoxy(x2,y2);
          write('T');
          end;
     If hide=0 then if cards[x1,y1]=57 then
          begin
          gotoxy(x2,y2);
          write('A');
          end;
{}

     If hide=0 then if cards[x1,y1+1]=65 then
          begin
          gotoxy(x2,y2+1);
          write(chr(3));
          end;
     If hide=0 then if cards[x1,y1+1]=66 then
          begin
          gotoxy(x2,y2+1);
          write(chr(4));
          end;
     If hide=0 then if cards[x1,y1+1]=67 then
          begin
          gotoxy(x2,y2+1);
          write(chr(5));
          end;
     If hide=0 then if cards[x1,y1+1]=68 then
          begin
          gotoxy(x2,y2+1);
          write(chr(6));
          end;
     If cards[x1,y1]=0 then
          begin
          gotoxy(x2,y2+1);
          write(' ');
          end;
     {If hide=1 then
          begin
          gotoxy(x2,y2+1);
          write('▒');
          end;}
     x1:=x1+1;
     x2:=x2+1;

     end;
END;

PROCEDURE VZ_KOMPA;
BEGIN
For i:=1 to kbk Do
   begin
   cards[ukvzk,12]:=cards[i,7];
   cards[i,7]:=0;
   cards[i,8]:=0;
   ukvzk:=ukvzk+1;
   end;
For i:=1 to kbk Do
   begin
   cards[ukvzk,12]:=cards[i,9];
   cards[i,9]:=0;
   cards[i,10]:=0;
   ukvzk:=ukvzk+1;
   end;
ksk:=0;
kbk:=0;
END;

PROCEDURE VZ_IGROKA;
BEGIN
For i:=1 to ksk Do
   begin
   cards[ukvzi,11]:=cards[i,7];
   cards[i,7]:=0;
   cards[i,8]:=0;
   ukvzi:=ukvzi+1;
   end;
For i:=1 to ksk Do
   begin
   cards[ukvzi,11]:=cards[i,9];
   cards[i,9]:=0;
   cards[i,10]:=0;
   ukvzi:=ukvzi+1;
   end;
ksk:=0;
kbk:=0;
END;

PROCEDURE BACK(y1,y2:byte);{Возврат карт со стола компа, если он не бьёт}
BEGIN
For j:=1 to 4 Do
   begin
   For i:=1 to 4 Do
      begin
      If (cards[i,y2]<>0) then If cards[j,y1]=0 then
         begin
         cards[j,y1]:=cards[i,y2];
         cards[j,y1+1]:=cards[i,y2+1];
         cards[i,y2]:=0;
         cards[i,y2+1]:=0;
         end;
      end;
   end;
END;

PROCEDURE UD_PUSTO(y1:byte);
BEGIN
For j:=1 to 4 do
begin
For i:=1 to 4 do
   begin
   If cards[i,y1]=0 then
      begin
      cards[i,y1]:=cards[i+1,y1];
      cards[i,y1+1]:=cards[i+1,y1+1];
      cards[i+1,y1]:=0;
      cards[i+1,y1+1]:=0;
      end;
    end;
end;
END;

PROCEDURE XOD_KOMPA;
BEGIN
cards[6,5]:=0;
cards[7,5]:=0;
cards[8,5]:=0;
cards[9,5]:=0;

For i:=1 to 4 Do
   begin
   If cards[i,6]=65 then cards[6,5]:=cards[6,5]+1;
   If cards[i,6]=66 then cards[7,5]:=cards[7,5]+1;
   If cards[i,6]=67 then cards[8,5]:=cards[8,5]+1;
   If cards[i,6]=68 then cards[9,5]:=cards[9,5]+1;
   end;
{gotoxy(1,6);
write(cards[6,5]);
write(cards[7,5]);
write(cards[8,5]);
write(cards[9,5]);
gotoxy(1,7);
write(chr(3));
write(chr(4));
write(chr(5));
write(chr(6));}
mast:=65;
max:=cards[6,5];
mast:=cards[6,6];
For i:=7 to 9 Do
   begin
   If cards[i,5]>=max then
      begin
      max:=cards[i,5];
      mast:=cards[i,6];
      end;
   end;
If (cards[6,5]=cards[7,5]) and (cards[6,5]=cards[8,5]) then
      begin
      ksk:=1;
      For j:=1 to 4 Do
         begin
         For i:=1 to 3 Do
            begin
            If cards[i,5]>cards[i+1,5] then
               begin
               buffer:=cards[i,5];
               cards[i,5]:=cards[i+1,5];
               cards[i+1,5]:=buffer;
               buffer:=cards[i,6];
               cards[i,6]:=cards[i+1,6];
               cards[i+1,6]:=buffer;
               end;
            end;
         end;
      mast:=cards[1,6];
      end;
gotoxy(20,9);
write('Мой ход ');
For i:=1 to 4 Do
If cards[i,6]=mast then
   begin
   cards[i,9]:=cards[i,5];
   cards[i,10]:=cards[i,6];
   cards[i,5]:=0;
   cards[i,6]:=0;
   ksk:=ksk+1;
   end;
UD_PUSTO(5);
UD_PUSTO(9);
{gotoxy(1,4);
writeln('ksk=',ksk);
writeln('kbk=',kbk);}
END;

PROCEDURE BYU;
BEGIN
gotoxy(20,9);
write('   Бью  ');
For j:=1 to 4 Do
   begin
   For i:=1 to ksk Do
      begin
      If cards[j,6]=cards[1,8] then If cards[i,7]<cards[j,5] then If cards[i,10]=0 then
         begin
         cards[i,9]:=cards[j,5];
         cards[i,10]:=cards[j,6];
         cards[j,5]:=0;
         cards[j,6]:=0;
         break;
         end;
      If cards[j,6]=kozir then If cards[i,8]<>kozir then If cards[i,10]=0 then
         begin
         cards[i,9]:=cards[j,5];
         cards[i,10]:=cards[j,6];
         cards[j,5]:=0;
         cards[j,6]:=0;
         break;
         end;
      end;
   end;
END;

PROCEDURE SKID;{Комп скидывает}
BEGIN
gotoxy(20,9);
write('Скидываю');
For j:=1 to 4 Do
   begin
   For i:=1 to 3 Do
      begin
      If cards[i+1,5]<>0 then if cards[i,5]>cards[i+1,5] then
         begin
         buffer:=cards[i,5];
         cards[i,5]:=cards[i+1,5];
         cards[i+1,5]:=buffer;
         buffer:=cards[i,6];
         cards[i,6]:=cards[i+1,6];
         cards[i+1,6]:=buffer;
         end;
      end;
   end;
For i:=1 to ksk Do
   begin
   cards[i,9]:=cards[i,5];
   cards[i,10]:=cards[i,6];
   cards[i,5]:=0;
   cards[i,6]:=0;
   end;
END;

PROCEDURE SORT_KOMPA;{Сортируем карты компа перед тем как побить}
BEGIN
For j:=1 to 8 Do
begin
   For i:=1 to 3 Do
      begin
      If cards[i+1,6]=cards[1,8] then
         begin
         buffer:=cards[i,5];
         cards[i,5]:=cards[i+1,5];
         cards[i+1,5]:=buffer;
         buffer:=cards[i,6];
         cards[i,6]:=cards[i+1,6];
         cards[i+1,6]:=buffer;
         end;
         If (cards[i+1,6]=cards[1,8]) then If (cards[i+1,5]>cards[i,5]) then
            begin
         buffer:=cards[i,5];
         cards[i,5]:=cards[i+1,5];
         cards[i+1,5]:=buffer;
         buffer:=cards[i,6];
         cards[i,6]:=cards[i+1,6];
         cards[i+1,6]:=buffer;
            end;
      end;
end;
For j:=1 to 8 Do
begin
   For i:=1 to 3 Do
      begin
         If (cards[i,6]<>kozir) then If (cards[i,6]<>cards[1,8]) then If cards[i+1,6]=kozir then
            begin
         buffer:=cards[i,5];
         cards[i,5]:=cards[i+1,5];
         cards[i+1,5]:=buffer;
         buffer:=cards[i,6];
         cards[i,6]:=cards[i+1,6];
         cards[i+1,6]:=buffer;
            end;
         If (cards[i,6]=kozir) then If (cards[i+1,6]=kozir) then If cards[i+1,5]<cards[i,5] then
            begin
         buffer:=cards[i,5];
         cards[i,5]:=cards[i+1,5];
         cards[i+1,5]:=buffer;
         buffer:=cards[i,6];
         cards[i,6]:=cards[i+1,6];
         cards[i+1,6]:=buffer;
            end;
      end;
end;
END;

PROCEDURE RAZDACHA(first:byte);
BEGIN
If first=1 then
     begin
     For i:=1 to 4 do
          begin
     If cards[i,3]=0 then
             begin
             If ukkart>36 then break;
             cards[i,3]:=cards[ukkart,1];
             cards[i,4]:=cards[ukkart,2];
             ukkart:=ukkart+1;
             If ukkart>36 then break;
             cards[i,5]:=cards[ukkart,1];
             cards[i,6]:=cards[ukkart,2];
             ukkart:=ukkart+1;
             end;
          end;
     end;

If first<>1 then
     begin
     For i:=1 to 4 do
          begin
     If cards[i,5]=0 then
             begin
             If ukkart>36 then break;
             cards[i,5]:=cards[ukkart,1];
             cards[i,6]:=cards[ukkart,2];
             ukkart:=ukkart+1;
             cards[i,3]:=cards[ukkart,1];
             cards[i,4]:=cards[ukkart,2];
             ukkart:=ukkart+1;
             end;
          end;
     end;
VIVOD(1,3,10,10,1,4,0);
VIVOD(1,5,33,10,1,4,1); {1}
END;

{Комп решает бить или скидывать}
PROCEDURE BIT_SKID;
BEGIN
kbk:=0;
For j:=1 to 4 Do
begin
   For i:=1 to ksk Do
      begin
      If cards[i,10]=0 then If cards[j,6]=cards[1,8] then If cards[i,7]<cards[j,5] then
         begin
         kbk:=kbk+1;
         cards[i,9]:=cards[j,5];
         cards[i,10]:=cards[j,6];
         cards[j,5]:=0;
         cards[j,6]:=0;
         break;
         end;
      If cards[i,10]=0 then If cards[j,6]=kozir then If cards[i,8]<>kozir then
         begin
         kbk:=kbk+1;
         cards[i,9]:=cards[j,5];
         cards[i,10]:=cards[j,6];
         cards[j,5]:=0;
         cards[j,6]:=0;
         break;
         end;
      end;
end;
{gotoxy(1,4);
writeln('ksk=',ksk);
writeln('kbk=',kbk);}
END;

PROCEDURE BIT_SKID_I;
BEGIN
kbk:=0;
   For i:=1 to ksk Do
      begin
      If cards[i,8]=cards[i,10] then If cards[i,9]<cards[i,7] then
         begin
         kbk:=kbk+1;
         end;
      If cards[i,8]=kozir then If cards[i,10]<>kozir then
         begin
         kbk:=kbk+1;
         end;
      end;
{gotoxy(1,4);
writeln('ksk=',ksk);
writeln('kbk=',kbk);}
END;

PROCEDURE TUSUEM;
BEGIN
For i:=1 to 36 do
     begin
     card1:=Random(35)+1;
     card2:=Random(35)+1;
     buffer:=cards[card1,1];
     cards[card1,1]:=cards[card2,1];
     cards[card2,1]:=buffer;
     buffer:=cards[card1,2];
     cards[card1,2]:=cards[card2,2];
     cards[card2,2]:=buffer;
     end;
Randomize;
kozir:=trunc(Random(99)/25)+65;
gotoxy(71,1);
write('Козырь');
gotoxy(77,1);
Case kozir of
65:write(chr(3));
66:write(chr(4));
67:write(chr(5));
68:write(chr(6));
end;
END;

FUNCTION SCORE(n:byte):byte;
BEGIN
If (n<59) and (n>=31) then SCORE:=2;
IF (n<31) and (n>0) then SCORE:=4;
IF n=0 then SCORE:=6;
If n=60 then yaytsa:=1;
END;

PROCEDURE FINAL(n,j,i:byte);
BEGIN
If (j=0) and (n=12) then writeln('Поздравляю! Вы - Козёл!');
If (j=0) and (n>=14) then writeln('Поздравляю! Вы - Козёл с хвостом.');
If (j=0) and (yaytsa=1) then writeln('Блин! Да ещё и с яйцами!');
If (j=0) and (i=0) then writeln('Обидно быть Пуховым Козлом!');

If (j=1) and (n=12) then writeln('Поздравляю! Компьютер - Козёл!');
If (j=1) and (n>=14) then writeln('Поздравляю! Компьютер - Козёл с хвостом.');
If (j=1) and (yaytsa=1) then writeln('Блин! Да ещё и с яйцами!');
If (j=1) and (i=0) then writeln('Обидно быть Пуховым Козлом!');
writeln('Нажмите любую клавишу для выхода из игры.');
Repeat
until keypressed=true;
END;

PROCEDURE SCHET(n:byte);
BEGIN
j:=0;
For i:=1 to 36 do
   begin
   If cards[i,n]=57 then j:=j+11;
   If cards[i,n]=56 then j:=j+10;
   If cards[i,n]=55 then j:=j+4;
   If cards[i,n]=54 then j:=j+3;
   If cards[i,n]=53 then j:=j+2;
   end;
If n=11 then scheti:=j;
If n=12 then schetk:=j;
END;

PROCEDURE MALOTKA(n:byte);
BEGIN
For i:=1 to 4 do
   begin
   If cards[1,n]=cards[i,n] then mol:=mol+1;
   end;
If mol<>4 then mol:=0;
END;

PROCEDURE XOD_MALOT(i,j,x1,y1,x2,y2:byte);
BEGIN
gotoxy(20,9);
write('Малотка ');
delay(10000);
For n:=1 to 4 do
   begin
   cards[n,j]:=cards[n,i];
   cards[n,j+1]:=cards[n,i+1];
   cards[n,i]:=0;
   cards[n,i+1]:=0;
   VIVOD(1,i,x1,y1,1,4,0);
   VIVOD(1,j,x2,y2,1,4,0);
   ksk:=4;
   end;
END;

PROCEDURE SORT_STOL;
BEGIN
For j:=1 to ksk do
   begin
   For i:=1 to 4 do
      begin
      If cards[i+1,7]>cards[i,7] then
         begin
         buffer:=cards[i,7];
         cards[i,7]:=cards[i+1,7];
         cards[i+1,7]:=buffer;
         end;
      end;
   end;
VIVOD(1,7,18,12,1,4,0);
VIVOD(1,5,33,10,1,4,1); {1}
END;

                      {Читаем из файла карты и масти}

begin
scorei:=0;
scorek:=0;
yaytsa:=0;
assign(f1,'c:\mywork\cards.dat');
reset(f1);
assign(f2,'c:\mywork\mast.dat');
reset(f2);
                      {Глобальные переменные}
metka6:
clrscr;
ukkart:=1;
ukvzk:=1;
ukvzi:=1;
scheti:=0;
schetk:=0;
cards[6,6]:=65;
cards[7,6]:=66;
cards[8,6]:=67;
cards[9,6]:=68;

i:=1;
While not Eof(f1) do
     begin
     read(f1,cards[i,1]);
     read(f2,cards[i,2]);
     i:=i+1;
     end;

                      {Перемешиваем карты и масти}
TUSUEM;
{VIVOD(1,1,1,1,1,36,0);}


                      {Устанавливаем указатель файла в начало файла}
  {Записываем в файл перетусованную колоду чтобы избежать псевдослучайности}

Seek (f1,0);
Seek (f2,0);
For i:=1 to 36 do
     begin
     write(f1,cards[i,1]);
     write(f2,cards[i,2]);
     end;

RAZDACHA(1);
{If ukkart>36 then if cards[1,3]=0 then if cards[1,5]=0 then goto metka5;}
metka1:
{Проверка малоток}
MALOTKA(4);
If mol=4 then
   begin
   XOD_MALOT(3,7,10,10,18,12);
   goto metka4;
   end;
MALOTKA(6);
If mol=4 then
   begin
   XOD_MALOT(5,9,33,10,18,14);
   goto metka3;
   end;
gotoxy(20,9);
write('Ваш ход ');
repeat
key:=Readkey;
If (key='1') then if (cards[1,4]<>0) then
     if (PR_STOLA(0)=0) or (cards[1,4]=PR_STOLA(0)) then
     begin
     cards[1,7]:=cards[1,3];
     cards[1,8]:=cards[1,4];
     cards[1,3]:=0;cards[1,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     ksk:=ksk+1;
     end;
If (key='1') then if (cards[1,4]=0) then
     begin
     cards[1,3]:=cards[1,7];
     cards[1,4]:=cards[1,8];
     cards[1,7]:=0;cards[1,8]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     ksk:=ksk-1;
     end;
If (key='2') then if (cards[2,4]<>0) then
     if (PR_STOLA(0)=0) or (cards[2,4]=PR_STOLA(0)) then
     begin
     cards[2,7]:=cards[2,3];
     cards[2,8]:=cards[2,4];
     cards[2,3]:=0;cards[2,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     ksk:=ksk+1;
     end;
If (key='2') then if (cards[2,4]=0) then
     begin
     cards[2,3]:=cards[2,7];
     cards[2,4]:=cards[2,8];
     cards[2,7]:=0;cards[2,8]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     ksk:=ksk-1;
     end;
If (key='3') then if (cards[3,4]<>0) then
     if (PR_STOLA(0)=0) or (cards[3,4]=PR_STOLA(0)) then
     begin
     cards[3,7]:=cards[3,3];
     cards[3,8]:=cards[3,4];
     cards[3,3]:=0;cards[3,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     ksk:=ksk+1;
     end;
If (key='3') then if (cards[3,4]=0) then
     begin
     cards[3,3]:=cards[3,7];
     cards[3,4]:=cards[3,8];
     cards[3,7]:=0;cards[3,8]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     ksk:=ksk-1;
     end;
If (key='4') then if (cards[4,4]<>0) then
     if (PR_STOLA(0)=0) or (cards[4,4]=PR_STOLA(0)) then
     begin
     cards[4,7]:=cards[4,3];
     cards[4,8]:=cards[4,4];
     cards[4,3]:=0;cards[4,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     ksk:=ksk+1;
     end;
If (key='4') then if (cards[4,4]=0) then
     begin
     cards[4,3]:=cards[4,7];
     cards[4,4]:=cards[4,8];
     cards[4,7]:=0;cards[4,8]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     ksk:=ksk-1;
     end;
If key=#32 then
   begin
   BACK(3,7);
   VIVOD(1,3,10,10,1,4,0);
   VIVOD(1,7,18,12,1,4,0);
   ksk:=0;
   end;
If key=#27 then goto exit;
until (key=#13) and (ksk>0);
   UD_PUSTO(7);
   VIVOD(1,7,18,12,1,4,0);
metka4:
   SORT_STOL;
   BIT_SKID;
If kbk<>ksk then
   begin
   BACK(5,9);
   SKID;
   VIVOD(1,9,18,14,1,4,1); {1}
   VIVOD(1,5,33,10,1,4,1); {1}
   delay(10000);
   VZ_IGROKA;
   VIVOD(1,7,18,12,1,4,0);
   VIVOD(1,9,18,14,1,4,1); {1}
   delay(10000);
   {VIVOD(1,11,1,19,1,ukvzi,0);}
   UD_PUSTO(3);
   UD_PUSTO(5);
   RAZDACHA(1);
   If ukkart>36 then if cards[1,3]=0 then if cards[1,5]=0 then goto metka5;
   goto metka1;
   end
   else
   begin
   SORT_KOMPA;
   BYU;
   VIVOD(1,9,18,14,1,4,0);
   VIVOD(1,5,33,10,1,4,1); {1}
   delay(10000);
   VZ_KOMPA;
   VIVOD(1,7,18,12,1,4,0);
   VIVOD(1,9,18,14,1,4,0);
   delay(10000);
   {VIVOD(1,12,1,20,1,ukvzk,0);}
   UD_PUSTO(3);
   UD_PUSTO(5);
   RAZDACHA(2);
   If ukkart>36 then if cards[1,3]=0 then if cards[1,5]=0 then goto metka5;
   delay(10000);
   end;

metka2:
MALOTKA(6);
If mol=4 then
   begin
   XOD_MALOT(5,9,33,10,18,14);
   goto metka3;
   end;
MALOTKA(4);
If mol=4 then
   begin
   XOD_MALOT(3,7,10,10,18,12);
   goto metka4;
   end;
   XOD_KOMPA;
   VIVOD(1,9,18,14,1,4,0);
   VIVOD(1,5,33,10,1,4,1); {1}
{}
metka3:
n:=1;
buffer:=0;
repeat
key:=Readkey;
If buffer<>ksk then if (key='1') then if (cards[1,4]<>0) then
     begin
     cards[n,7]:=cards[1,3];
     cards[n,8]:=cards[1,4];
     cards[1,3]:=0;cards[1,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     buffer:=buffer+1;
     n:=n+1;
     end;
If buffer<>ksk then if (key='2') then if (cards[2,4]<>0) then
     begin
     cards[n,7]:=cards[2,3];
     cards[n,8]:=cards[2,4];
     cards[2,3]:=0;cards[2,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     buffer:=buffer+1;
     n:=n+1;
     end;
If buffer<>ksk then If (key='3') then if (cards[3,4]<>0) then
     begin
     cards[n,7]:=cards[3,3];
     cards[n,8]:=cards[3,4];
     cards[3,3]:=0;cards[3,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     buffer:=buffer+1;
     n:=n+1;
     end;
If buffer<>ksk then if (key='4') then if (cards[4,4]<>0) then
     begin
     cards[n,7]:=cards[4,3];
     cards[n,8]:=cards[4,4];
     cards[4,3]:=0;cards[4,4]:=0;
     VIVOD(1,3,10,10,1,4,0);
     VIVOD(1,7,18,12,1,4,0);
     key:='0';
     buffer:=buffer+1;
     n:=n+1;
     end;
If key=#32 then
   begin
   BACK(3,7);
   VIVOD(1,3,10,10,1,4,0);
   VIVOD(1,7,18,12,1,4,0);
   n:=1;
   buffer:=0;
   end;
If key=#27 then goto exit;
until (key=#13) and (buffer=ksk);
UD_PUSTO(7);
VIVOD(1,7,18,12,1,4,0);
BIT_SKID_I;
If ksk<>kbk then
   begin
   kbk:=ksk;
   VZ_KOMPA;
   VIVOD(1,7,18,12,1,4,0);
   VIVOD(1,9,18,14,1,4,0);
   delay(10000);
   {VIVOD(1,12,1,20,1,ukvzk,0);}
   UD_PUSTO(3);
   UD_PUSTO(5);
   RAZDACHA(2);
   If ukkart>36 then if cards[1,3]=0 then if cards[1,5]=0 then goto metka5;
   delay(10000);
   goto metka2;
   end
   else
   begin
   VZ_IGROKA;
   VIVOD(1,7,18,12,1,4,0);
   VIVOD(1,9,18,14,1,4,0);
   delay(10000);
   {VIVOD(1,11,1,19,1,ukvzi,0);}
   UD_PUSTO(3);
   UD_PUSTO(5);
   RAZDACHA(1);
   If ukkart>36 then if cards[1,3]=0 then if cards[1,5]=0 then goto metka5;
   goto metka1;
   end;
metka5:
SCHET(11);
SCHET(12);
clrscr;
gotoxy(1,1);
write('Результаты раунда: ');
gotoxy(1,2);
write('Ваш счёт: ',scheti);
gotoxy(1,3);
write('Счёт компьютера: ',schetk);
{Обнуляем очки}
For i:=1 to 36 do
   begin
   cards[i,11]:=0;
   cards[i,12]:=0;
   end;
If scheti>schetk then
   begin
   n:=schetk;
   scorek:=scorek+SCORE(n);
   end
   else
   begin
   n:=scheti;
   scorei:=scorei+SCORE(n);
   end;
gotoxy(1,4);
writeln('Общий счёт игры: ');
gotoxy(1,5);
writeln('Ваш: ',scorei);
gotoxy(1,6);
writeln('Компьютера: ',scorek);
gotoxy(1,7);
If (scorei>=12) then
   begin
   n:=scorei;
   i:=scorek;
   FINAL(n,0,i);
   goto exit;
   end;
If (scorek>=12) then
   begin
   n:=scorek;
   i:=scorei;
   FINAL(n,1,i);
   goto exit;
   end;
writeln('Нажмите любую клавишу для продолжения.');
Repeat
until keypressed=true;
goto metka6;
exit:
clrscr;
writeln('Спасибо за то что играли в "Козла".');
writeln('Игра написана Баженовым Александром Владимировичем');
writeln('студентом 1-ого курса СПБГУТ им.проф. Бонч-Бруевича факультета ДФП.');
end.