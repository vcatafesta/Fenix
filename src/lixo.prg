#
function snh_adm()
******************
   STT := ' '

   while Empty(STT)
      say := ' '
      tela := SaveScreen()
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

	   Area(oMenu:aDbfs[3])
      loca for senha = SNA
      if eof()
         say := 'X'
         mdsha()
         STT := ' '
         loop
      end
      return
   end

Function ClientesPesquisa()
***************************
      oMenu:Limpa()
      
      
      TT := 0
      cdtr := 'X'
      psqcli()


      PEC := '    '
      do whil PEC = '    '
         say := 'X'
         digt := '4'
         @ 08,03 clea to 22,49
         @ 08,04 say '* Para Editar Cadastro Digite o CODIGO:' get PEC
         @ 09,04 say '  <ENTER> para Sair'
         read
         if PEC = '    '
            restscreen(00,00,23,79,TELA)
            return
         endi
         Z1 := ' '
         stor val(PEC) to reg
         nrpd()
         stor codnum to PEC
         Area(oMenu:aDbfs[5])
         stor SIT to SLT
         loca for codc = PEC
         if eof()
            //unlock
            ////use
            mdcli()
            Z1 := 'N'
            PEC := '    '
            loop
         endi
         store recno()  to regcad
         store cnae     to Ccnae
         store data     to cdata
         store sit      to Csit
         store codc to Ccodc
         store cliente to Ccliente
         store razao to Crazao
         store ender to Cender
         store nroend to Cnroend
         store compl to Ccompl
         store bairro to Cbairro
         store cida to Ccida
         store paiis to Cpais
         store est to Cest
         store cnpj to Ccnpj
         store inscr to Cinscr
         store cpf to Ccpf
         store inscrp to Cinscrp
         store fone1 to Cfone1
         store fone2 to Cfone2
         store prazo to Cprazo
         store prazo2 to Cprazo2
         store obs to Cobs
         store email to Cmail
         store exml to Cexml
         store cep to ccep

         store ender2 to Cender2
         store nroend2 to Cnroend2
         store compl2 to Ccompl2
         store bairro2 to Cbairro2
         store cida2 to Ccida2
         store est2 to Cest2
         store cep2 to ccep2
         store hrrec to Chrrec

         store contato to Ccontato
         store tpdesc to Ctpdesc
         store dscnto to Cdesc
         store tpag to Ctpag
         store ativo to Cativo
         store nf to Cnf
         store prnf to Cprnf
         store pedcli to Cpedcli
         store despacho to Cdespacho
         store linha to Clinha
         store reg_apur to Creg_apur
         store codrp to Ccodrp
         store nrepre to Cnrepre
         store Vmin to Cvmin
         store restric to Crestric
         store justst to CjustST
         store indie to Cindie
         store obssep to Cobssep
         store isest to Cisest
         Rpais = 'BRASIL'
         store recno() to reg5

         if Z1 = 'N'
            loop
         endi
         @ 00,00 clea to 23,79
         bcor()
         @ 00,00 clea to 00,79
         @ 00,30 say TEF
         tcor()
         @ 03,02 say 'Status:'
         @ 03,40 say 'Data Cadastro:'
         @ 04,42 say 'C�digo do Cliente:'
         @ 04,02 say 'Fantasia:'
         @ 05,02 say 'E-mail para XML:'
         @ 06,02 say 'Razao Social:'
         if Csit = 'E'
            @ 07,02 say 'C.N.P.J.:'
            @ 07,42 say 'Inscr.Est.:'
         else
            @ 07,02 say 'CPF:'
            @ 07,42 say 'RG:'
         endi
         @ 08,02 say 'Contato:'
         @ 08,35 say 'Fone:'
         @ 08,56 say 'ou:'
         @ 09,02 say 'E-mail:'
         @ 10,02 say 'Prazo:'
         @ 10,12 say '/'
         @ 10,17 say 'Dias.'
         @ 10,60 say 'Cnae:'
         @ 11,02 say 'Obs.:'
         @ 11,54 say 'Pedido Mínimo:'
         @ 12,02 say 'Tipo de Cobrançaa:'
         if Ctpdesc = 'C'
            @ 12,42 say 'Porcentagem de Desconto:'
            @ 12,73 say '%'
         endi
         @ 13,02 say 'Regime de Apuração:'
         @ 14,02 say 'Tipo Contrbte:'
         @ 13,50 say 'Pagamento:'
         @ 14,39 say 'Representante:'
         @ 14,53 say '-'
         set color to b+/w
         @ 03,25 say Csit
         @ 03,56 say Cdata
         @ 04,61 say Ccodc
         @ 05,20 say Cexml
         if Cativo = 'A'
            @ 03,10 say 'Ativo'
         endi
         If Cativo # 'A'
            @ 03,10 say 'Inativo'
         Endi
         @ 04,12 say ccliente
         @ 06,16 say crazao
         if Csit = 'EMPRESA'
            @ 07,12 say ccnpj
            @ 07,54 say cinscr
         else
            @ 07,07 say CCPF
            @ 07,46 say Cinscrp
         endi
         @ 08,11 say Ccontato
         @ 08,41 say Cfone1
         @ 08,60 say Cfone2
         @ 09,10 say Cmail
         @ 10,09 say Cprazo
         @ 10,13 say Cprazo2
         @ 10,66 say Ccnae
         @ 14,53 say Ccodrp
         @ 14,58 say Cnrepre
         @ 11,08 say Cobs
         @ 11,68 say Cvmin
         if Ctpdesc = 'C'
            @ 12,21 say 'COMUM'
         endi
         if Ctpdesc = 'E'
            @ 12,21 say 'ESPECIAL'
         endi
         if Ctpdesc = 'C'
            @ 12,67 say Cdesc
         endi
         if Creg_apur = ' '
            @ 13,22 say 'NAO CADASTRADO !'
         elseif Creg_apur = '1'
            @ 13,22 say '1-SIMPLES NACIONAL'
         elseif Creg_apur = '2'
            @ 13,22 say '2-OUTROS REGIMES'
         elseif Creg_apur = '3'
            @ 13,22 say '3-ISENTO'
         endi
         if Ctpag = 1
            @ 13,61 say '1-BOLETO'
         elseif Ctpag = 2
            @ 13,61 say '2-DINHEIRO'
         elseif Ctpag = 3
            @ 13,61 say '3-CHEQUE'
         elseif Ctpag = 4
            @ 13,61 say '4-DEP�SITO'
         elseif Ctpag = 5
            @ 13,61 say '5-NENHUM'
         endi
         if Cindie = '1'
            @ 14,17 say '1-Contribuinte ICMS'
         elseif Cindie = '2'
            @ 14,17 say '2-Contribuinte ISENTO'
         elseif Cindie = '9'
            @ 14,17 say '9-N�O Contribuinte'
         endi
         tcor()
         @ 15,00 to 15,79
         @ 17,02 say 'Lagradouro:'
         @ 17,55 say 'N�mero:'
         @ 18,02 say 'Complemento:'
         @ 18,37 say 'Bairro:'
         @ 18,62 say 'CEP:'
         @ 19,02 say 'Pa�s:'
         @ 19,18 say 'Estado:'
         @ 19,39 say 'Cidade:'
         @ 20,02 say 'Linha:'
         @ 20,27 say 'Despacho:'
         @ 21,00 to 21,79
         @ 22,02 say 'Observacao do Pedido:'
         set color to b+/w
         @ 17,14 say Cender
         @ 17,63 say Cnroend
         @ 18,15 say Ccompl
         @ 18,45 say Cbairro
         @ 18,67 say CCEP
         @ 19,08 say Cpais
         @ 19,26 say Cest
         @ 19,47 say Ccida
         @ 20,09 say Clinha
         @ 20,37 say Cdespacho
         @ 22,25 say Cobssep
         tcor()
         if Crestric = 'X'
            save scre to R_cli
            @ 15,02 clea to 23,77
            @ 15,02 to 22,77
            set color to r+/w
            @ 16,20 say 'ATENCAO !!!'
            tcor()
            @ 18,05 say ' CLIENTE COM RESTRICAO DE PAGAMENTO !!!'
            @ 20,06 say '  Somente o Administrador pode liberar com senha.'
            sl :=0
            @ 21,06 prompt 'VOLTAR'
            @ 21,13 say '|'
            @ 21,15 prompt 'DESBLOQUEAR'
            @ 21,27 say '|'
            @ 21,29 prompt 'ALTERAR CADASTRO'
            menu to sl
            if sl = 1 .or. sl = 0
               rest scre from R_cli
               retu
            elseif sl = 2
               @ 18,05 clea to 20,76
               @ 18,05 say ' Se voce desbloquear, sera possivel a venda'
               @ 19,05 say '  para esse cliente INADIMPLENTE!'
               snh_adm()
               if say = 'X'
                  rest scre from R_cli
                  retu
               else
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl restric with ' '
                  //// unlock
                  ////use
                  rest scre from R_cli
                  mdsuces()
               endi
            elseif sl = 3
               snh_adm()
               if say = 'X'
                  rest scre from R_cli
                  retu
               endi
               rest scre from R_cli
            endi
         endi
         MN := 0
         do Whil MN = 0
            set color to w/b*+/z+
            @ 01,00 clea to 01,79
            @ 01,00 prompt '     Cliente      '
            @ 01,20 prompt '     Endere�o     '
            @ 01,37 prompt '  Outras Informacoes  '
            @ 01,61 prompt '  Imprimir Cadastro   '
            menu to MN
            tcor()
            if MN = 0
               rele all like c*
               restscreen(00,00,23,79,TELA)
               retu
            endi
            if MN = 1
               MN_cl := 0
               do whil MN_cl = 0
                  @ 03,02 prompt 'Status:'
                  @ 03,40 say 'Data Cadastro:'
                  @ 04,42 say 'C�digo do Cliente:'
                  @ 04,02 prompt 'Fantasia:'
                  @ 05,02 prompt 'E-mail para XML:'
                  @ 06,02 prompt 'Razao Social:'
                  if Csit = 'EMPRESA'
                     @ 07,02 prompt 'C.N.P.J.:'
                     @ 07,42 prompt 'Inscr.Est.:'
                  else
                     @ 07,02 prompt 'CPF:'
                     @ 07,42 prompt 'RG:'
                  endi
                  @ 08,02 prompt 'Contato:'
                  @ 08,35 prompt 'Fone:'
                  @ 08,56 prompt 'ou:'
                  @ 09,02 prompt 'E-mail:'
                  @ 10,02 prompt 'Prazo:'
                  @ 10,17 say 'Dias.'
                  @ 10,60 prompt 'Cnae:'
                  @ 11,02 prompt 'Obs.:'
                  @ 11,54 prompt 'Pedido M�nimo:'
                  @ 12,02 prompt 'Tipo de Cobran�a:'
                  @ 13,02 prompt 'Regime de Apura��o:'
                  @ 13,50 prompt 'Pagamento:'
                  @ 14,02 prompt 'Tipo Contrbte:'
                  @ 14,39 prompt 'Representante:'
                  @ 15,72 prompt 'VOLTAR'
                  menu to mn_cl
                  if MN_CL = 1
                     TY := 0
                     @ 03,10 prompt 'ATIVO'
                     @ 03,20 prompt 'INATIVO'
                     menu to TY
                     @ 03,10 clea to 03,30
                     snh_adm()
                     if say = 'X'
                        MN_cl := 0
                        loop
                     endi
                     if TY = 1
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl Ativo with 'A'
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 02,10 say 'ATIVO'
                        tcor()
                        MN_cl := 0
                        loop
                     endi
                     if TY = 2
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl Ativo with ' '
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 03,10 say 'INATIVO'
                        tcor()
                        MN_cl := 0
                        loop
                     endi
                  endi
                  if MN_CL = 2
                     @ 04,12 get ccliente pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl cliente with Ccliente
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 04,12 say ccliente
                     tcor()
                     MN_cl := 0
                     loop
                  endi
                  if MN_CL = 3
                     @ 05,20 get Cexml
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl exml with Cexml
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 05,20 say Cexml
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 4
                     @ 06,16 get Crazao pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl razao with Crazao
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 06,16 say Crazao
                     tcor()
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 5
                     if Csit = 'EMPRESA'
                        @ 07,12 get ccnpj pict '99.999.999/9999-99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cnpj with Ccnpj
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 07,12 say Ccnpj
                        tcor()
                     else
                        @ 07,07 get Ccpf pict '999.999.999-99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cpf with Ccpf
                        // unlock
                        // //use
                        set color to b+/w
                        @ 07,07 say Ccpf
                        tcor()
                     endi
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 6
                     if Csit = 'EMPRESA'
                        @ 07,54 get cinscr pict '9999999999999999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl inscr with Cinscr
                        // unlock
                        ////use
                        set color to b+/w
                        @ 07,54 say Cinscr
                        tcor()
                     else
                        @ 07,46 get Cinscrp pict '9999999999999999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl inscrp with Cinscrp
                        // unlock
                        ////use
                        set color to b+/w
                        @ 07,46 say Cinscrp
                        tcor()
                     endi
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 7
                     @ 08,11 get Ccontato pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl contato with Ccontato
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,11 say Ccontato
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 8
                     @ 08,41 get Cfone1 pict '(99)9999-99999'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl fone1 with Cfone1
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,41 say Cfone1
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 9
                     @ 08,60 get Cfone2 pict '(99)9999-99999'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl fone2 with Cfone2
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,60 say Cfone2
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 10
                     @ 09,10 get Cmail
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl email with Cmail
                     // unlock
                     ////use
                     set color to b+/w
                     @ 09,10 say Cmail
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 11
                     do whil MN_CL = 11
                        @ 10,09 get Cprazo pict '999'
                        @ 10,13 get Cprazo2 pict '999'
                        read
                        if Cprazo2 # 0 .and. Cprazo2 <= Cprazo
                           save scre to tl
                           @ 10,09 say '   Prazo Incorreto !  ' get z
                           read
                           rest scre from Tl
                           loop
                        endi
                        exit
                     endd
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl prazo with Cprazo, prazo2 with Cprazo2
                     // unlock
                     ////use
                     set color to b+/w
                     @ 10,09 say Cprazo
                     @ 10,13 say Cprazo2
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if mn_cl = 12
                     @ 10,66 get Ccnae pict '9999-9/99'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl cnae with Ccnae
                     // unlock
                     ////use
                     set color to b+/w
                     @ 10,66 say Ccnae
                     tcor()
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 13
                     @ 11,08 get Cobs pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl obs with Cobs
                     // unlock
                     ////use
                     set color to b+/w
                     @ 11,08 say Cobs
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 14
                     @ 11,69 get Cvmin pict '9,999.99'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl Vmin with Cvmin
                     // unlock
                     ////use
                     set color to b+/w
                     @ 11,69 say Cvmin
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 15
                     DSC = 0
                     set color to w/b+
                     @ 12,20 clea to 13,29
                     @ 12,21 prompt 'COMUM'
                     @ 13,21 prompt 'ESPECIAL'
                     menu to DSC
                     tcor()
                     @ 12,20 clea to 13,29
                     if DSC = 1
                        Ctpdesc := 'C'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl tpdesc with Ctpdesc
                        // unlock
                        ////use
                        set color to b+/w
                        @ 12,21 say 'COMUM'
                        tcor()
                        Ctpdesc := 'C'
                        TPCb := 'COMUM'
                        PD_s := ' '
                        Do whil PD_s = ' '
                           @ 12,42 say 'Porcentagem de Desconto:'
                           @ 12,78 say '%'
                           @ 12,67 get Cdesc pict '999.999999'
                           read
                           if Cdesc > descto
                              save scre to msg
                              @ 12,20 clea to 13,55
                              set color to w/r
                              n := ' '
                              @ 12,02 say 'ESSE DESCONTO EXEDE O LIMITE !!!' get n pict '!'
                              read
                              tcor()
                              rest scre from msg
                              if n # 'P'
                                 PD_s := ' '
                                 loop
                              endi
                           endi
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl dscnto with Cdesc
                           // unlock
                           ////use
                           tcor()
                           @ 12,67 say Cdesc
                           exit
                        endd
                        MN_CL := 0
                        loop
                     endi
                     if DSC = 2
                        @ 12,42 clea to 12,77
                        Ctpdesc := 'E'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl tpdesc with Ctpdesc
                        // unlock
                        ////use
                        set color to b+/w
                        @ 12,21 say 'ESPECIAL'
                        tcor()
                        MN_CL := 0
                        loop
                     endi
                  Endi
                  if MN_CL = 16
                     if Csit = 'PESSOA FISICA'
                        TONE(200,5)
                        ALERT(" ATEN��O !!!;Cliente com CPF �; ISENTO!", , "W+/B")
                        MN_CL := 0
                        loop
                     endi
                     OP_REGAP := 0
                     Do Whil OP_REGAP = 0
                        save scre to regap
                        set color to w/b+
                        @ 13,02 clea to 16,22
                        @ 13,02 prompt '1-SIMPLES NACIONAL'
                        @ 14,02 prompt '2-OUTROS REGIMES'
                        @ 15,02 prompt '3-ISENTO'
                        menu to op_regap
                        If OP_regap = 1
                           desc_REGA := 'SIMPLES NACIONAL'
                        elseif OP_regap = 2
                           desc_REGA := 'OUTROS REGIMES'
                        elseif OP_regap = 3
                           desc_REGA := 'ISENTO'
                        elseif OP_regap = 0
                           TONE(600)
                           If ALERT("Voce deve informar o Regime!;Se opetar em Sair,;O Cadastro nao sera alterado", {"CONTINUAR", "SAIR"} , "B/GR+,r") ==2
                              TONE(200,5)
                              ALERT("DADOS N�O FORAM ALTERADOS ;; VOLTANDO....! ", , "W+/B")
                              rest scre from regap
                              tcor()
                              exit
                           Else
                              OP_REGAP := 0
                              loop
                           endi
                        Endi
                        exit
                     endd
                  endi
                  if OP_regap = 0
                     rest scre from regap
                     MN_CL := 0
                     loop
                  endi
                  stor ltrim(str(op_regap)) to Creg_apur
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl reg_apur with Creg_apur
                  // unlock
                  ////use
                  rest scre from regap
                  set color to b+/w
                  @ 13,22 CLEA TO 13,39
                  @ 13,22 say Creg_apur
                  @ 13,23 say '-'
                  @ 13,24 say desc_rega
                  tcor()
                  MN_CL := 0
                  loop
               endd
               if MN_CL = 17
                  OP_Tpg := 0
                  save scre to tpg
                  set color to w/b+
                  @ 13,61 clea to 17,71
                  @ 13,61 prompt '1-BOLETO'
                  @ 14,61 prompt '2-DINHEIRO'
                  @ 15,61 prompt '3-CHEQUE'
                  @ 16,61 prompt '4-DEP�SITO'
                  @ 17,61 prompt '5-NENHUM'
                  menu to op_tpg
                  If OP_tpg = 1
                     desc_TPG := 'BOLETO'
                  elseif OP_tpg = 2
                     desc_tpg := 'DINHEIRO'
                  elseif OP_tpg = 3
                     desc_tpg := 'CHEQUE'
                  elseif OP_tpg = 4
                     desc_tpg := 'DEP�SITO'
                  elseif OP_tpg = 5
                     desc_tpg := 'NENHUM'
                  elseif OP_tpg = 0
                     rest scre from tpg
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  stor op_tpg to Ctpag
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl Tpag with Ctpag
                  // unlock
                  ////use
                  rest scre from tpg
                  set color to b+/w
                  @ 13,61 CLEA TO 13,71
                  @ 13,61 say Ctpag pict '9'
                  @ 13,62 say '-'
                  @ 13,63 say desc_tpg
                  tcor()
                  MN_CL := 0
                  loop
               endi
               if MN_CL = 18
                  if Csit = 'PESSOA FISICA'
                     TONE(200,5)
                     ALERT(" ATEN��O !!!;Cliente com CPF �;N�O CONTRIBUINTE", , "W+/B")
                     MN_CL := 0
                     loop
                  endi
                  OP_ctb := 0
                  save scre to tpg
                  set color to w/b+
                  @ 14,17 clea to 17,37
                  @ 14,17 prompt '1-Contribuinte ICMS'
                  @ 15,17 prompt '2-Contribuinte ISENTO'
                  @ 16,17 prompt '9-N�O Contribuinte'
                  menu to op_ctb
                  tcor()
                  if OP_ctb = 0
                     rest scre from tpg
                     MN_CL := 0
                     loop
                  endi
                  If OP_ctb = 1
                     desc_ctb := '1-Contribuinte ICMS'
                  elseif OP_ctb = 2
                     desc_ctb := '2-Contribuinte ISENTO'
                  elseif OP_ctb = 3
                     desc_ctb := '9-N�O Contribuinte'
                  Endi
                  stor ltrim(str(op_ctb)) to op_ctb
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl indie with subs(desc_ctb,1,1)
                  // unlock
                  ////use
                  rest scre from tpg
                  set color to b+/w
                  @ 14,17 clea to 14,37
                  @ 14,17 say desc_ctb
                  tcor()
                  MN_CL := 0
                  loop
               endi
               if mn_cl = 19
                  mn_cl11 := 0
                  Do whil mn_cl11 = 0
                     save scre to tl
                     @ 10,44 clea to 10,77
                     cdr := '    '
                     @ 14,53 get cdr pict '!999'
                     read
                     if cdt = '    '
                        exit
                     endi
                     if cdr = '*   '
                        psqrepre()
                        mn_cl11 := 0
                        cdr := '    '
                     endi
                     Area(oMenu:aDbfs[49])
                     loca for codr = cdr
                     if eof()
                        // unlock
                        ////use
                        mddad()
                        mn_cl11 := 0
                        loop
                     endi
                     stor codr to cdr
                     stor nrep to nmrep
                     // unlock
                     ////use
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl codrp with cdr, nrepre with nmrep
                     // unlock
                     ////use
                     rest scre from tl
                     set color to b+/w
                     @ 14,53 say cdr
                     @ 14,58 say nmrep
                     tcor()
                     exit
                  endd
                  MN_CL := 0
                  loop
               endi
               if MN_CL = 20 .or. MN_CL = 0
                  @ 15,72 clea to 15,78
                  MN := 0
                  exit
               endi
            Endi
            if MN = 2
               Sl_Ed :=0
               set color to w/b*+/z+
               @ 16,00 clea to 16,79
               @ 16,02 prompt 'ENDERECO DO CADASTRO '
               @ 16,26 prompt 'ENDERECO PARA ENTREGA'
               menu to Sl_Ed
               tcor()
               if Sl_Ed=1
                  MN_Ed := 0
                  do whil MN_Ed = 0
                     @ 17,02 prompt 'Lagradouro:'
                     @ 17,55 prompt 'N�mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa�s:'
                     @ 19,18 prompt 'Estado:'
                     @ 19,39 prompt 'Cidade:'
                     @ 20,02 prompt 'Linha:'
                     @ 20,27 prompt 'Despacho:'
                     @ 22,02 prompt 'Observacao do Pedido:'
                     @ 23,70 prompt 'VOLTAR'
                     menu to MN_ED
                     if MN_Ed = 1
                        @ 17,14 get Cender pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl ender with Cender
                        // unlock
                        ////use
                        set color to b+/w
                        @ 17,14 say Cender
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 2
                        @ 17,63 get Cnroend pict '!!!!!!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl nroend with Cnroend
                        // unlock
                        ////use
                        set color to b+/w
                        @ 17,63 say Cnroend
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 3
                        @ 18,15 get Ccompl pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl compl with Ccompl
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,15 say Ccompl
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 4
                        @ 18,45 get Cbairro pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl bairro with Cbairro
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,45 say Cbairro
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 5
                        @ 18,67 get Ccep pict '99.999-999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cep with Ccep
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,67 say Ccep
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 6
                        @ 19,08 say Cpais
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl paiis with Cpais
                        // unlock
                        ////use
                        set color to b+/w
                        @ 19,08 say Cpais
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 7
                        ET := '1'
                        RE := ' '
                        do whil RE = ' '
                           @ 19,26 get Cest pict '!!'
                           read
                           if Cest = '  '
                              mdest()
                              RE := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for estd = Cest
                           if eof()
                              // unlock
                              ////use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est to Cest
                              // unlock
                              //use
                              RE := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est with Cest
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,26 say Cest
                           tcor()
                           exit
                        endd
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 8
                        ET := '2'
                        RC := ' '
                        do whil RC = ' '
                           @ 19,47 get Ccida pict '@!'
                           read
                           if Ccida = '    '
                              mdest()
                              RC := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for cidade = Ccida .and. estd = Cest
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida to Ccida
                              // unlock
                              //use
                              RC := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida with Ccida
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,47 say Ccida
                           tcor()
                           exit
                        endd
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 9
                        @ 20,09 get Clinha pict '99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl linha with Clinha
                        // unlock
                        //use
                        set color to b+/w
                        @ 20,09 say Clinha
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 10
                        @ 20,37 get Cdespacho pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl despacho with Cdespacho
                        // unlock
                        //use
                        set color to b+/w
                        @ 20,37 say Cdespacho
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_ED = 11
                        set confirm on
                        @ 22,25 get Cobssep pict '@!S59'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl obssep with Cobssep
                        // unlock
                        //use
                        set confirm off
                        set color to b+/w
                        @ 22,25 say Cobssep
                        tcor()
                        MN_ed := 0
                        loop
                     Endi
                     if MN_Ed = 12 .or. MN_Ed = 0
                        @ 16,00 clea to 16,79
                        @ 23,70 say '      '
                        MN := 0
                        exit
                     endi
                  Endd
               elseif Sl_Ed = 2
                  save scre to MN_end2
                  @ 17,00 clea to 23,79
                  @ 17,02 say 'Lagradouro:'
                  @ 17,55 say 'N�mero:'
                  @ 18,02 say 'Complemento:'
                  @ 18,37 say 'Bairro:'
                  @ 18,62 say 'CEP:'
                  @ 19,02 say 'Pa�s:'
                  @ 19,18 say 'Estado:'
                  @ 19,39 say 'Cidade:'
                  @ 21,02 say 'Recebimento:'
                  set color to b+/w
                  @ 17,14 say Cender2
                  @ 17,63 say Cnroend2
                  @ 18,15 say Ccompl2
                  @ 18,45 say Cbairro2
                  @ 18,67 say CCEP2
                  @ 19,08 say Cpais
                  @ 19,26 say Cest2
                  @ 19,47 say Ccida2
                  @ 21,15 say Chrrec
                  tcor()
                  MN_Ed2 := 0
                  do whil MN_Ed2 = 0
                     @ 17,02 prompt 'Lagradouro:'
                     @ 17,55 prompt 'N�mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa�s:'
                     @ 19,18 prompt 'Estado:'
                     @ 19,39 prompt 'Cidade:'
                     @ 21,02 prompt 'Recebimento:'
                     @ 23,70 prompt 'VOLTAR'
                     menu to MN_ED2
                     if MN_Ed2 = 1
                        @ 17,14 get Cender2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl ender2 with Cender2
                        // unlock
                        //use
                        set color to b+/w
                        @ 17,14 say Cender2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 2
                        @ 17,63 get Cnroend2 pict '!!!!!!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl nroend2 with Cnroend2
                        // unlock
                        //use
                        set color to b+/w
                        @ 17,63 say Cnroend2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 3
                        @ 18,15 get Ccompl2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl compl2 with Ccompl2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,15 say Ccompl2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 4
                        @ 18,45 get Cbairro2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl bairro2 with Cbairro2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,45 say Cbairro2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 5
                        @ 18,67 get Ccep2 pict '99.999-999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cep2 with Ccep2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,67 say Ccep2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 6
                        @ 19,08 say Cpais2
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl paiis2 with Cpais2
                        // unlock
                        //use
                        set color to b+/w
                        @ 19,08 say Cpais2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 7
                        ET2 := '1'
                        RE2 := ' '
                        Do whil RE2 = ' '
                           @ 19,26 get Cest2 pict '!!'
                           read
                           if Cest2 = '  '
                              mdest()
                              RE2 = ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for estd = Cest2
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est2 to Cest2
                              // unlock
                              //use
                              RE2 := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est2 with Cest2
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,26 say Cest2
                           tcor()
                           exit
                        endd
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 8
                        ET2 := '2'
                        RC2 := ' '
                        do whil RC2 = ' '
                           @ 19,47 get Ccida2 pict '@!'
                           read
                           if Ccida2 = '    '
                              mdest()
                              RC2 := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for cidade = Ccida2 .and. estd = Cest2
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida2 to Ccida2
                              // unlock
                              //use
                              RC2 := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida2 with Ccida2
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,47 say Ccida2
                           tcor()
                           exit
                        endd
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_ED2 = 9
                        set confirm on
                        @ 21,15 get Chrrec pict '@!S69'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl hrrec with Chrrec
                        // unlock
                        //use
                        set confirm off
                        set color to b+/w
                        @ 21,15 say Chrrec
                        tcor()
                        MN_ed2 := 0
                        loop
                     Endi
                     if MN_Ed2 = 10 .or. MN_Ed2 = 0
                        @ 23,70 say '      '
                        rest scre from MN_end2
                        @ 16,00 clea to 16,79
                        MN := 0
                        exit
                     endi
                  Endd
               elseif Sl_Ed=0
                  @ 23,70 say '      '
                  @ 16,00 clea to 16,79
                  MN := 0
                  loop
               endi
            Endi
            if MN = 3
               save scre to inf
               MN_inf :=0
               Do whil MN_inf = 0
                  @ 02,00 clea to 23,79
                  @ 07,00 to 19,79 doub
                  bcor()
                  @ 08,21 say 'HABILITA ISENCAO DE S.T. COM BASE LEGAL'
                  tcor()
                  if Cisest = 'S'
                     set color to b+/w
                     @ 10,50 say 'SIM'
                     tcor()
                     @ 11,01 to 11,78
                     @ 12,21 say '- Justificativa para isencao de S.T.'
                     @ 13,21 say '  (essa informacao sai na N.F.)'
                     @ 15,01 say subs(CjustST,1,78)
                     @ 16,01 say subs(CjustST,79,157)
                     @ 17,01 say subs(CjustST,158,234)
                     clea gets
                  endi
                  If Cisest # 'S'
                     set color to b+/w
                     @ 10,50 say 'NAO'
                  Endi
                  tcor()
                  @ 20,16 say CNF
                  @ 20,25 say Cprnf
                  if Cpedcli # 'S'
                     Cpedcli := 'N'
                  endi
                  @ 21,55 say Cpedcli
                  tcor()
                  @ 10,25 prompt 'Cliente Isento de S.T.?:'
                  @ 20,12 prompt 'NF:'
                  @ 20,19 prompt 'PRNF:'
                  @ 20,36 to 21,36 doub
                  @ 22,00 to 22,79 doub
                  @ 20,38 prompt 'CLIENTE EXIGE NRO.PEDIDO COMPRA NA NOTA?'
                  @ 23,00 prompt '                                     VOLTAR                                     '
                  menu to MN_inf
                  if MN_inf = 1
                     save scre to mn_inf
                     TY := 0
                     set color to w/b
                     @ 08,50 clea to 12,65
                     bcor()
                     @ 08,51 say 'ISENCAO DE S.T.'
                     set color to w/b
                     @ 10,56 prompt 'SIM'
                     @ 11,56 prompt 'NAO'
                     menu to TY
                     rest scre from mn_inf
                     snh_adm()
                     if say = 'X'
                        MN_inf := 0
                        loop
                     endi
                     if TY = 1
                        Cisest :='S'
                        set color to b+/w
                        @ 10,50 say 'SIM'
                        tcor()
                        @ 11,01 to 11,78
                        @ 12,21 say '- Justificativa para isencao de S.T.'
                        @ 13,21 say '  (essa informacao sai na N.F.)'
                        A :=spac(78)
                        B :=spac(78)
                        C :=spac(78)
                        @ 15,01 get A pict '@!'
                        @ 16,01 get B pict '@!'
                        @ 17,01 get C pict '@!'
                        read
                        stor a+b+c to CjustST
                        if CjustST = '      '
                           TONE(200,5)
                           ALERT("Atencao !!!;Justificatica nao pode ficar em branco;Operacao nao completada!! ", , "W+/B")
                           Cisest :='N'
                           MN_inf := 0
                           loop
                        endi
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl isest with 'S',justst with Cjustst
                        // unlock
                        //use
                        mdsuces()
                        MN_inf := 0
                        loop
                     endi
                     if TY = 2
                        Cisest :='N'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl isest with ' '
                        // unlock
                        //use
                        @ 10,21 clea to 15,59
                        set color to b+/w
                        @ 10,50 say 'NAO'
                        tcor()
                        MN_inf := 0
                        loop
                     endi
                  endi
                  if MN_inf = 2
                     @ 20,16 get Cnf pict '!' valid (Cnf $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl nf with Cnf
                     // unlock
                     //use
                     set color to b+/w
                     @ 20,16 say Cnf
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 3
                     @ 20,25 get Cprnf pict '!' valid (Cprnf $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl prnf with Cprnf
                     // unlock
                     //use
                     set color to b+/w
                     @ 20,25 say Cprnf
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 4
                     @ 21,55 get Cpedcli pict '!' valid (Cpedcli $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl pedcli with Cpedcli
                     // unlock
                     //use
                     set color to b+/w
                     @ 21,55 say Cpedcli
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 5 .OR. MN_inf = 0
                     MN := 0
                     restscreen(00,00,23,79,TELA)
                     retu
                  endi
               Endd
            endi
            if MN = 4
               IMP_CADC()
               MN := 0
               loop
            endi
         Endd
      endd
      restscreen(00,00,23,79,TELA)
      retu


function imp_cadc( Cpar1 )
**************************
   LOCAL nPrn     := 1
   LOCAL cBMPFile := "C:\hb32\clamar\imagem.bmp"
   LOCAL GetList  := {}
   LOCAL aPrn     

   #ifdef __PLATFORM__WINDOWS
		aPrn     := win_printerList()
	#else	
		aPrn     := cupsGetDests()
	#endif
	
   if Empty( aPrn )
      Alert( "Nao foi localizado nenhuma impressora instalada!!!" )
   else
      while nPrn != 0
         vcTela = savescreen(07, 12, 23, 69)
         @ 08,13 to 22,68
         setcolor("n/w,w+/g")
         @ 09, 14 clear to 21,67
         @ 09, 14 say " Sele‡Æo de impressora                                " color "w+/r"
         @ 21, 14 say " " +chr(24)+chr(25)+": Movimenta | Enter: Seleciona |  ESC: Cancelar    " color "w+/Gr"
         nPrn := AChoice(10,15,20,66,aPrn, .T.,, "myFuncao" )
         IF nPrn != 0
            PrnTest( aPrn[ nPrn ], cBMPFile, iif( HB_ISSTRING( cPar1 ) .AND. Lower( cPar1 ) == "ask", .T., NIL ) )
         endif
         restscreen(07, 12, 23, 69,vcTela)
         exit
      enddo
   endif
   return nil


function psqcli()
*****************
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
      @ 02,51 say "Digite a Fantasia:"
      @ 03,51 GET MNOME PICT "@!"
   elseif TT = 2
      @ 02,51 say "Digite a Raz�o Social:"
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

   Area("cadcli")
   CadCli->(DbGotop())
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
   @ 01,51 say 'C�digo       Cliente        '
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

def nrpd()
***************
	public codnum
	if digt = '10'
   	if reg < 10
      	stor '000000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg >= 10
      	stor '00000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99
      	stor '0000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999
      	stor '000000'+ltrim(str(reg)) to codnum
   	endi
   	if reg > 9999
      	stor '00000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999
      	stor '0000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999
      	stor '000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999999
      	stor '00'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999999
      	stor '0'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999999
      	stor ltrim(str(reg)) to codnum
   	endi
	endi
	if digt = '8'
	   if reg < 10
	      stor '0000000'+ltrim(str(reg)) to codnum
	   endi
	   if reg >= 10
	      stor '000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99
	      stor '00000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999
	      stor '0000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999
      	stor '000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999
	      stor '00'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999
	      stor '0'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999999
	      stor ltrim(str(reg)) to codnum
   	endi
	endi
if digt = '6'
   if reg < 10
      stor '00000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '5'
   if reg < 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '4'
   if reg < 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '2'
   if reg < 10
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor ltrim(str(reg)) to codnum
   endi
endi
