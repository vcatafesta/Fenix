   STT := ' '
   Do whil STT = ' '
      say := ' '
      save scre to tela
      @ 09,20 clea to 13,54
      @ 09,20 to 13,54
      SNA := SPAC(7)
      @ 10,21 say '* DIGITE A SENHA ADMINISTRADOR:'
      set color to w+/n,X
      @ 12,33 get SNA
      read
      tcor()
      rest scree from tela
      if SNA = '      '
         say := 'X'
         retu
      endi
      arq3()
      loca for senha = SNA
      if eof()
         Unlock
         USe
         say := 'X'
         mdsha()
         STT := ' '
         loop
      endi
      Unlock
      Use
      retu
   Endd
