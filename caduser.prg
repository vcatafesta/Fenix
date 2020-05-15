save scre to caduser
               DDA := ' '
               do whil DDA := ' '
                  lp := ' '
                  cls
                  CAD := '* CADASTRO DE USUµRIO *'
                  set color to w/r+
                  @ 00,25 say CAD
                  tcor()
                  @ 01,00 to 01,79
                  @ 04,02 clea to 07,77
                  @ 04,02 to 07,77
                  set color to r+
                  @ 02,03 say '* Confirme os Dados *'
                  tcor()
                  @ 05,04 say 'Usu rio:' get LOGfan pict '!!!!!!!!!!!!!!!'
                  read
                  if LOGfan = '      '
                     quit
                  endi
                  @ 05,40 say 'Senha..:'
                  set color to w+/n,X
                  @ 05,49 get SHA
                  read
                  tcor()
                  if SHA = '      '
                     save scre to msg   
                     @ 09,20 clea to 12,50
                     set color to b+
                     @ 09,20 to 12,50
                     set color to G+/r+
                     F := ' '
                     @ 10,21 say '      SENHA INVµLIDA !       '
                     @ 11,21 say '        Redigite !!!         '
                     set color to w/w/w/w
                     @ 00,60 GET F
                     read   
                     tcor()
                     rest scre from msg
                     DDA = ' '
                     loop
                  endi
                  SHA2 := SPAC(6)
                  @ 06,40 say 'Confirme a Senha:' 
                  set color to w+/n,X
                  @ 06,58 get SHA2
                  read
                  tcor()
                  if SHA # SHA2
                     save scre to msg
                     @ 09,20 clea to 12,50
                     set color to b+
                     @ 09,20 to 12,50
                     set color to G+/r+
                     F := ' '
                     @ 10,21 say '    A SENHA NÇO CONFERE      '
                     @ 11,21 say '        Redigite !!!         '
                     set color to w/w/w/w
                     @ 00,60 GET F
                     read   
                     tcor()
                     rest scre from msg
                     @ 04,02 clea to 07,77
                     @ 04,02 to 07,77    
                     DDA = ' '
                     loop
                  endi
                  set color to b+
                  @ 05,40 clea to 06,75
                  set color to G+/r+
                  @ 05,42 say 'Senha Cadastrada Com Sucesso !!!'
                  tcor()
                  arq23()
                  loca for fantazia = logfan
                  if eof()
                     CD := ' '
                     do whil CD := ' '
                        CODUS := '    '
                        @ 10,03 say 'Digite o seu C¢digo do Cadastro:' get CODUS
                        read
                        if CODUS = '    '
                           exit
                        endi
                        arq31()
                        loca for codfun = CODUS
                        if eof()
                           Unlock
                           Use
                           mdfunc()
                           CD = ' '
                           loop
                        endi
                        stor nfunc to NME
                        stor bairro to brro
                        stor cdde to cdad
                        stor uf to estd
                        stor endrco to ender
                        stor date() to dt
                        Unlock
                        Use
                        @ 10,03 clea to 12,76
                        @ 10,03 say 'C¢digo do Cadastro:' get Codus
                        @ 12,03 say 'Nome Completo.....:' get NME
                        @ 14,03 say 'Endere‡o..........:' get ender
                        @ 16,03 say 'Bairro............:' get brro
                        @ 18,03 say 'Cidade............:' get cdad
                        @ 18,50 say 'Estado:' get estd pict '!!'
                        @ 20,03 say 'Data do Cadastro..:' get dt
                        clea gets
                        @ 22,03 say '* Confirma os Dados acima para cadastramento? <S/N>' get R pict '!' valid (R $ 'SN')
                        read 
                        BLQ = 'B'
                        if R # 'S'
                           lp := 'x'
                           exit
                        endi
                        arq23()
                        loca for codusu = CODUS
                        if eof()
                           Unlock
                           Use
                           arq23()
                           appe blan
                           repl codusu with codus, fantazia with logfan, senha with SHA, dtcad with dt
                           repl cadastro with BLQ, venda with BLQ, regv with BLQ, bxv with BLQ, edtv with BLQ, estqv with BLQ
                           repl lstv with BLQ, psqv with BLQ, nfv with BLQ, compra with BLQ
                           repl regc with BLQ, bxc with BLQ, edtc with BLQ, lstc with BLQ
                           repl estqc with BLQ, psqc with BLQ, nfc with BLQ, etqc with BLQ
         
                           repl estoque with BLQ, plne with BLQ, cnce with BLQ, edte with BLQ,pere with BLQ
                           repl rgpe with BLQ, cheq with BLQ, dpe with BLQ, lja with BLQ, fna with BLQ
                           repl etqed with BLQ, ftv with BLQ, nfe with BLQ, nfsa with BLQ, nfen with BLQ, dvv with BLQ 

                           repl clicad with BLQ, forcad with BLQ, mercad with BLQ, procad with BLQ, cfocad with BLQ
                           repl cdbcad with BLQ, estcad with BLQ, clacad with BLQ, muncad with BLQ, repcad with BLQ
                           repl tracad with BLQ, cescad with BLQ, embcad with BLQ

                           Unlock
                           Use
                           mdsuces()
                           @ 10,03 clea to 22,78
                           @ 11,04 say 'Agora o sistema ser  fechado automaticamente.'
                           @ 12,04 say ' - Logue com os dados cadastrados !' get DDA
                           read
                           quit
                        else
                           @ 10,03 clea to 22,78
                           EXISCAD()
                           CD = ' '
                           loop
                           Unlock
                           Use
                        endi
                     endd
                  endi
                  if lp # 'x'
                     @ 10,03 clea to 22,78
                     exiscad()
                     DDA = ' '
                     loop
                  endi
               endd
rest scre from caduser
