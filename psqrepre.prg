save scre to tela
NMC := spac(15)
do whil NMC = spac(15)
   @ 00,50 clea to 17,79
   @ 00,50 to 17,79
   @ 02,51 say 'Digite o Nome Representante:'
   @ 04,51 get NMC pict '!!!!!!!!!!!!!!!'
   read
   if NMC = '     '
      rest scre from tela
      retu
   endi
   arq49()
   DBGOTOP()
   LOCATE FOR ALLTRIM(NMC)$NREP
   IF EOF()
      TONE(200,5)
      ALERT(" ATEN€ÇO !!!;;REPRESENTANTE NÇO LOCALIZADO ", , "W+/B")
       if cdtr = 'X'
          rest scre from tela
       endi   
       NMC := spac(15)
       loop
   ENDIF
   CONTA:=0
   @ 01,51 clea to 16,78
   set color to w/r+
   @ 01,51 say 'Codigo  Representante       '
   set color to c/w/r+
   ln := 3
   do whil .t.
      conta++
      @ ln,51 say codr
      @ ln,59 say nrep
      skip
      ln := ln + 1
      if ln > 14
         stor recno() to reg49
         Unlock
         Use
         @ 16,53 say ' Tecle Algo:' get z
         read
         @ 01,51 clea to 16,77
         ln := 3
         arq49()
         set index to c49
         go reg49
         loop
      endi
      IF EOF()
         Unlock
         Use
         @ 16,53 SAY "Fim da Busca !"
         inkey(0)
         rest scre from tela
         retu
      ENDI
      CONTINUE
   endd
   Unlock
   Use
   z := ' '
endd
rest scre from tela




