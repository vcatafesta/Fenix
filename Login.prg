save scre to login
R := ' '
do whil .t.
   cls
*   LOG := spac(15)
   LOG := "GABRIEL"
   @ 09,21 to 14,50
   @ 10,23 say 'Usu rio:' get LOG pict '!!!!!!!!!!!!!!!'
   read
   if LOG = '      '
     quit
   endi
*   SNA := SPAC(6)
   SNA := "168935"
   @ 12,23 say 'Senha..:'
   set color to w+/n,X
   @ 12,32 get SNA
   read
   arq23()
   loca for fantazia = LOG .and. senha = SNA
   if eof()
      Unlock
      Use
      @ 20,22 say '* Usu rio NÆo Cadastrado !!!' get R
      read
      arq3()
      go top
      do whil .not. eof()
         if cadbloq = 'B'   
            Unlock
            Use
            R := 'X'
            exit
         else
            @ 20,22 say '* Cadastrar Usu rio? <S/N>' get R pict '!'
            read
            if R # 'S'
               Unlock
               Use
               quit
            endi
            stor SNA to SHA
            stor LOG to LOGFan
            Unlock
            Use
            caduser()
         endi
      endd
      if R = 'X'
         R = ' '
         loop
      endi
   endi
   stor SNA to SHA
   stor codusu to LOGFan
   stor fantazia to NMuser
   Unlock
   Use
   ARQ9()
   stor desc to descto
   Unlock
   Arq11()
   go top
   do whil .not. eof()
      desc_t=0
      des_prc=0
      vpreco=0
      stor 100-descto to desc_t
      stor desc_t/100 to des_prc
      stor precopl/des_prc to vpreco
      repl preco with Vpreco
      skip
   endd
   Unlock
   Use
   retu

endd
