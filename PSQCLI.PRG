t:=0
do whil t = 0
   CCPF := spac(14)
   CNP := spac(18)
   RZ := spac(40)
   MNOME:=SPACE(15)
   Ccde:=spac(15)
   Cender:=spac(40)
   if cdtr = 'X'
      @ 09,04 prompt 'NOME FANTASIA'
      @ 10,04 prompt 'RAZAO SOCIAL'
      @ 11,04 prompt 'CNPJ'
      @ 12,04 prompt 'CPF'
      @ 13,04 prompt 'CIDADE'
      @ 14,04 prompt 'ENDERECO'
      menu to TT
   else
      TT := 1
   endi
   @ 01,50 to 23,79
   if TT = 1
      @ 02,51 say "Digite o Nome do Cliente:"
      @ 03,51 GET MNOME PICT "@!"
   elseif TT = 2
      @ 02,51 say "Digite a RazÆo Social:"
      @ 03,51 GET RZ PICT "!!!!!!!!!!!!!!!!!!!!"
   elseif TT = 3
      @ 02,51 say "Digite o CNPJ:"
      @ 03,51 GET CNP PICT "99.999.999/9999-99"
   elseif TT = 4
      @ 02,51 say "Digite o CPF:"
      @ 03,51 GET CCPF PICT "999.999.999-99"
   elseif TT = 5
      @ 02,51 say "Digite a Cidade:"
      @ 03,51 GET Ccde PICT "@!"
   elseif TT = 6
      @ 02,51 say "Digite Endereco:"
      @ 03,51 GET Cender PICT "@!"
   endi
   READ
   if TT = 0
*      rest scre from tela
      retu
   endi
   if TT = 1 .and. Mnome = '     '
*      rest scre from tela
      retu
   elseif TT = 2 .and. RZ = '    '
*      rest scre from tela
      retu
   elseif TT = 3 .and. CNP = '  '
*      rest scre from tela
      retu
   elseif TT = 4 .and. CCPF = '   '
*      rest scre from tela
      retu
   elseif TT = 5 .and. Ccde = '   '
*      rest scre from tela
      retu
   endi
   arq5()
   DBGOTOP()
   if TT = 1
      LOCATE FOR ALLTRIM(MNOME)$CLIENTE
   elseif TT = 2
      LOCATE FOR ALLTRIM(RZ)$RAZAO
   elseif TT = 3
      LOCATE FOR ALLTRIM(CNP)$CNPJ
   elseif TT = 4
      LOCATE FOR ALLTRIM(CCPF)$CPF
   elseif TT = 5
      LOCATE FOR ALLTRIM(CCDE)$CIDA
   elseif TT = 6
      LOCATE FOR ALLTRIM(Cender)$ender
   endi
   IF EOF()
       mdcli()
       if cdtr = 'X'
*          rest scre from tela
       endi   
       t:=0
       loop
   ENDIF
   CONTA:=0
   ln := 3
   @ 01,51 clea to 22,78
   bcor()
   @ 01,51 say 'C¢digo       Cliente        '
   tcor()
   DO WHIL .T.
      CONTA++ 
      if ativo # 'A'
         icor()
      endi
      @ ln,51 SAY codc
      @ ln,58 SAY subs(cliente,1,20)
      if TT # 1
         @ ln+1,51 say subs(razao,1,25)
         if sit = 'EMPRESA'
            @ ln+2,51 say cnpj
            else
            @ ln+2,51 say cpf
         endi
      endi
      tcor()
      if TT = 1
         ln := ln + 1
      else
         ln := ln + 4
      endi
      if ln > 20
         @ 22,51 say 'Tecle algo...'
         inkey(10)
*         @ 03,51 clea to 22,78
         ln := 3
      endi
      IF EOF()
         Unlock
         Use
         @ 22,51 SAY "Fim da Busca !"
         inkey(10)
*         rest scre from tela
         retu
      ENDIF
      CONTINUE
*      rest scre from tela
      retu
   ENDD
*   rest scre from tela
   retu
   cdtr := ' '
endd

