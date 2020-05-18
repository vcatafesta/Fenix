#include "fenix.ch"

function cadastro()
	LOCAL nChoice := 0	
   LOCAL cScreen := SaveScreen()
	CDT := Space(1)

	Area("desc")
   descto := Desc->desc
	Area("cadcli")
   Qcl := Cadcli->(Lastrec())
	
   while true
		oMenu:Limpa()
	   aMenu := {"Pesquisa", "Cadastrar", "Listagem"}
   	nChoice := FazMenu( 10, 10, aMenu)
		Do Case
		Case nChoice = 0
   		Restela( cScreen )
			return
		Case nChoice = 1
      	ClientesPesquisa()
		Case nChoice = 2
      	ClientesInclusao()
		Case nChoice = 3
   		LstCli()
	   Endcase   
	enddo

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
            //// unlock
            //use
            mdcli()
            Z1 := 'N'
            PEC := '    '
            loop
         endi
         store recno() to regcad
         store cnae to Ccnae
         store data to cdata
         store sit to Csit
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
         //// unlock
         //USE
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
         @ 04,42 say 'C¢digo do Cliente:'
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
         @ 11,54 say 'Pedido M°nimo:'
         @ 12,02 say 'Tipo de Cobranáa:'
         if Ctpdesc = 'C'
            @ 12,42 say 'Porcentagem de Desconto:'
            @ 12,73 say '%'
         endi
         @ 13,02 say 'Regime de Apuraá∆o:'
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
            @ 13,61 say '4-DEP‡SITO'
         elseif Ctpag = 5
            @ 13,61 say '5-NENHUM'
         endi
         if Cindie = '1'
            @ 14,17 say '1-Contribuinte ICMS'
         elseif Cindie = '2'
            @ 14,17 say '2-Contribuinte ISENTO'
         elseif Cindie = '9'
            @ 14,17 say '9-N«O Contribuinte'
         endi
         tcor()
         @ 15,00 to 15,79
         @ 17,02 say 'Lagradouro:'
         @ 17,55 say 'N£mero:'
         @ 18,02 say 'Complemento:'
         @ 18,37 say 'Bairro:'
         @ 18,62 say 'CEP:'
         @ 19,02 say 'Pa°s:' 
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
                  //Use
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
            @ 01,20 prompt '     Endereáo     '
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
                  @ 04,42 say 'C¢digo do Cliente:'
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
                  @ 11,54 prompt 'Pedido M°nimo:'
                  @ 12,02 prompt 'Tipo de Cobranáa:'
                  @ 13,02 prompt 'Regime de Apuraá∆o:'
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
                        //Use
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
                        //Use
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
                     //Use
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
                     //Use
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
                     //Use
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
                        //Use
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
                        Use
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
                        Use
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
                        Use
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
                     Use
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
                     Use
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
                     Use
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
                     Use
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
                     Use
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
                     uSE
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
                     Use
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
                     Use
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
                        Use
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
                           Use
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
                        Use
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
                        ALERT(" ATENÄ«O !!!;Cliente com CPF Ç; ISENTO!", , "W+/B")
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
                              ALERT("DADOS N«O FORAM ALTERADOS ;; VOLTANDO....! ", , "W+/B")
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
                  Use
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
                  @ 16,61 prompt '4-DEP‡SITO'
                  @ 17,61 prompt '5-NENHUM'
                  menu to op_tpg
                  If OP_tpg = 1
                     desc_TPG := 'BOLETO'
                  elseif OP_tpg = 2
                     desc_tpg := 'DINHEIRO'
                  elseif OP_tpg = 3
                     desc_tpg := 'CHEQUE'
                  elseif OP_tpg = 4
                     desc_tpg := 'DEP‡SITO'
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
                  Use
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
                     ALERT(" ATENÄ«O !!!;Cliente com CPF Ç;N«O CONTRIBUINTE", , "W+/B")
                     MN_CL := 0
                     loop
                  endi
                  OP_ctb := 0
                  save scre to tpg
                  set color to w/b+
                  @ 14,17 clea to 17,37
                  @ 14,17 prompt '1-Contribuinte ICMS'
                  @ 15,17 prompt '2-Contribuinte ISENTO'
                  @ 16,17 prompt '9-N«O Contribuinte'
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
                     desc_ctb := '9-N«O Contribuinte'
                  Endi
                  stor ltrim(str(op_ctb)) to op_ctb
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl indie with subs(desc_ctb,1,1)
                  // unlock
                  Use
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
                        Use
                        mddad()
                        mn_cl11 := 0
                        loop
                     endi
                     stor codr to cdr
                     stor nrep to nmrep
                     // unlock
                     Use
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl codrp with cdr, nrepre with nmrep
                     // unlock
                     uSE
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
                     @ 17,55 prompt 'N£mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa°s:' 
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
                        Use
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
                        Use
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
                        Use
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
                        Use
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
                        use
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
                        Use
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
                              Use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est to Cest
                              // unlock
                              Use
                              RE := ' '
                              loop
                           endi
                           // unlock
                           Use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est with Cest
                           // unlock
                           Use
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
                              Use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida to Ccida
                              // unlock
                              Use
                              RC := ' '
                              loop
                           endi
                           // unlock
                           Use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida with Ccida
                           // unlock
                           Use
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
                        Use
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
                        Use
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
                        Use
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
                  @ 17,55 say 'N£mero:'
                  @ 18,02 say 'Complemento:'
                  @ 18,37 say 'Bairro:'
                  @ 18,62 say 'CEP:'
                  @ 19,02 say 'Pa°s:' 
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
                     @ 17,55 prompt 'N£mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa°s:' 
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
                        Use
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
                        Use
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
                        Use
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
                        Use
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
                        use
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
                        Use
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
                              Use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est2 to Cest2
                              // unlock
                              Use
                              RE2 := ' '
                              loop
                           endi
                           // unlock
                           Use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est2 with Cest2
                           // unlock
                           Use
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
                              Use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida2 to Ccida2
                              // unlock
                              Use
                              RC2 := ' '
                              loop
                           endi
                           // unlock
                           Use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida2 with Ccida2
                           // unlock
                           Use
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
                        Use
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
                        Use
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
                        Use
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
                     Use
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
                     Use
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
                     Use
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
    
   
Function ClientesInclusao()
***************************
      oMenu:Limpa()
      FJ := ' '
      do whil FJ = ' '
         @ 10,04 say '* <P>essoa Fisica ou <E>mpresa:' get FJ pict '!' valid (FJ $ 'PE')
         read
         if FJ = ' '
            restscreen(00,00,23,79,TELA)
            retu
         endi
         if FJ = "P"
            stor 'PESSOA FISICA' to FJ
         else
            stor 'EMPRESA' to FJ
         endi
         @ 04,32 get FJ
         clea gets
      endd
      DT := date()
      @ 05,00 clea to 23,79
      rdata:=date
      rativo:=spac(1)
      Csit:=spac(13)
      Rcliente:=spac(22)
      Rrazao:=spac(40)
      Render:=spac(40)
      Rnroend:=spac(6)
      Rcompl:=spac(20)
      Rbairro:=spac(16)
      Rcida:=spac(30)
      Rest:=spac(2)
      Rcnpj:=spac(18)
      Rinscr:=spac(15)
      Rcpf:=spac(14)
      Rinscrp:=spac(16)
      Rfone1:=spac(14)
      Rfone2:=spac(14)
      Rprazo:=0
      Rprazo2:=0
      Robs:=spac(45)
      CCEP:=spac(10)
      Rcontato:=spac(20)
      Rvmin := 0
      Rcnae:=spac(9)
      If FJ = 'E'
         Rindie := ' '
      else
         Rindie := '9'
      endi
      Rmail:=spac(60)
      Rexml:=spac(43)
      Rtpdesc:=spac(1)
      Rdesc:=0
      Rtpag:=0
      Rlinha:=spac(2)
      Rhrrec:=spac(62)
      Rnf := 'S'
      Rprnf := 'S'
      Rreg_apur:=spac(1)
      Rpais := 'BRASIL'
      Rdespacho := SPAC(40)
      Robssep:=spac(62)
      @ 00,00 clea to 23,79
      bcor()
      @ 00,00 clea to 00,79
      @ 00,30 say TEF
      tcor()
      set confirm on
      @ 02,00 to 02,79
      @ 02,02 say 'Cliente'
      @ 04,02 say 'C¢digo do Cliente:' 
      @ 04,28 get FJ
      @ 05,02 say 'Data Cadastro:' get date
      clea gets
      Do whil .t.
         @ 04,42 say 'Fantasia:' get Rcliente pict '@!'
         read
         @ 05,30 say 'XML:' get Rexml
         @ 06,02 say 'Razao Social:' get Rrazao pict '@!'
         if FJ = 'E'
            @ 07,02 say 'C.N.P.J.:' get Rcnpj pict '99.999.999/9999-99'
            @ 07,42 say 'Inscr.Est.:' get Rinscr pict '9999999999999999'
         else
            @ 07,02 say 'CPF:' get RCPF pict '999.999.999-99'
            @ 07,42 say 'RG:' get Rinscrp pict '9999999999999999'
         endi
         @ 08,02 say 'Contato:' get Rcontato pict '@!'
         @ 08,35 say 'Fone:' get Rfone1 pict '(99)9999-99999'
         @ 08,56 say 'ou:' get Rfone2 pict '(99)9999-99999'
         @ 09,02 say 'E-mail:' get Rmail
         @ 10,02 say 'Prazo:' get Rprazo pict '999'
         @ 10,12 say '/'
         @ 10,13 get Rprazo2 pict '999'
         @ 10,17 say 'Dias.'
         @ 10,50 say 'Cnae:' get Rcnae pict '9999-9/99'
         @ 11,02 say 'Obs.:' get Robs pict '@!'
         @ 11,54 say 'Pedido M°nimo:' get Rvmin pict '9,999.99'
         @ 12,02 say 'Tipo de Cobranáa:'
         @ 13,02 say 'Regime de Apuraá∆o:'
         @ 13,23 say '-'
         @ 13,50 say 'Pagamento:'
         @ 14,02 say 'Tipo Contrbte:'      
         @ 14,39 say 'Representante:'
         @ 14,57 say '-'
         read
         if Rprazo2 # 0 .and. Rprazo2 <= Rprazo
            save scre to Tprz
            @ 09,13 clea to 11,40
            @ 09,13 to 11,40
            @ 10,16 say ' Prazo Incorreto !' get z
            read
            rest scre from Tprz
            Rprazo:=0
            Rprazo2:=0
            loop
         endi
         if Rrazao = '   '
            TONE(200,5)
            If ALERT("Raz∆o Social em Branco !!!;Preencha!;", {"CONTINUA", "SAIR"} , "W+/B") ==1
               LOOP
            else
               set confirm off
               restscreen(00,00,23,79,TELA)
               RETU
            endi
         elseif Rcliente = '   '
            TONE(200,5)
            If ALERT("Nome Fantasia em Branco !!!;Preencha!;", {"CONTINUA", "SAIR"} , "W+/B") ==1
               LOOP
            else
               set confirm off
               restscreen(00,00,23,79,TELA)
               RETU
            endi
         endi
         DSC := 0
         set color to w/b+
         @ 12,20 clea to 13,29
         @ 12,21 prompt 'COMUM'
         @ 13,21 prompt 'ESPECIAL'
         menu to DSC
         tcor()
         @ 12,20 clea to 13,29
         if DSC = 0
            mdanul()
            set confirm off
            restscreen(00,00,23,79,TELA)
            retu
         endi
         if DSC = 1
            Rtpdesc := 'C'
            TPCb := 'COMUM'
            @ 12,21 get TPCb
            clea gets
            PD_s := ' '
            do whil PD_s = ' '
               @ 12,42 say 'Porcentagem de Desconto:' get Rdesc pict '999.9999'
               @ 12,70 say '%'
               read
               if Rdesc > descto
                  save scre to msg
                  @ 12,20 clea to 13,55 
                  set color to w/r
                  n := ' '
                  @ 12,02 say 'ESSE DESCONTO EXEDE O LIMITE !!!' get n pict '!'
                  read
                  tcor()
                  if PD_S # 'P'
                     rest scre from msg
                     PD_s := ' '
                     loop
                  endi
               endi
               exit
            endd
         Endi
         if DSC = 2
            TPCb := 'ESPECIAL'
            Rtpdesc := 'E'
            @ 12,21 get TPCb
            clea gets
         endi
         if FJ = 'P'
            OP_REGAP := 3
            desc_REGA := 'ISENTO'
            Creg_apur :='3'
         else
            OP_regap := 0
            Do whil OP_REGAP = 0
               save scre to regap
               set color to w/b+
               @ 15,02 clea to 20,22
               @ 15,02 say 'Regime de Apuraá∆o'
               @ 16,02 to 16,22
               @ 17,02 prompt '1-SIMPLES NACIONAL'
               @ 18,02 prompt '2-OUTROS REGIMES'
               @ 19,02 prompt '3-ISENTO'
               menu to op_regap
               tcor()
               If OP_regap = 1
                  desc_REGA := 'SIMPLES NACIONAL'
               elseif OP_regap = 2
                  desc_REGA := 'OUTROS REGIMES'
               elseif OP_regap = 3
                  desc_REGA := 'ISENTO'
               elseif OP_regap = 0
                  TONE(600)
                  If ALERT("Voce deve informar o Regime!;Se optar em Sair,;o Cadastro sera Anulado", {"CONTINUAR", "SAIR"} , "B/GR+,r") ==2
                     mdanul()
                     restscreen(00,00,23,79,TELA)
                     retu
                  Endi
                  OP_REGAP := 0
                  loop
               Endi
               exit
            endd
            stor ltrim(str(op_regap)) to Creg_apur
            rest scre from regap
            @ 13,22 get Creg_apur
            @ 13,24 get desc_rega
            clea gets
***************************************************
            OP_Tpg := 0
            save scre to tpg
            set color to w/b+
            @ 13,61 clea to 17,81
            @ 13,61 prompt '1-BOLETO'
            @ 14,61 prompt '2-DINHEIRO'
            @ 15,61 prompt '3-CHEQUE'
            @ 16,61 prompt '4-DEP‡SITO'
            @ 17,61 prompt '5-NENHUM'
            menu to op_tpg
            tcor()
            If OP_tpg = 1
               desc_TPG := 'BOLETO'
            elseif OP_tpg = 2
               desc_tpg := 'DINHEIRO'
            elseif OP_tpg = 3
               desc_tpg := 'CHEQUE'
            elseif OP_tpg = 4
               desc_tpg := 'DEP‡SITO'
            elseif OP_tpg = 5 .or. OP_tpg = 0
               desc_tpg := 'NENHUM'
            Endi
            stor op_tpg to Rtpag
            rest scre from tpg
            @ 13,61 CLEA TO 13,81
            @ 13,61 get Rtpag pict '9'
            @ 13,62 say '-'
            @ 13,63 get desc_tpg
            clea gets
***********************************************
            if FJ = 'PESSOA FISICA'
               op_ctb := '9'
               desc_ctb := '9-N«O Contribuinte'
            else
               OP_ctb := 0
               save scre to tpg
               bcor()
               @ 15,17 clea to 19,37
               @ 15,17 say 'Tipo de Contribuinte'
               @ 16,17 to 16,37
               @ 17,17 prompt '1-Contribuinte ICMS'
               @ 18,17 prompt '2-Contribuinte ISENTO'
               @ 19,17 prompt '9-N«O Contribuinte'
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
                  desc_ctb := '9-N«O Contribuinte'
               Endi
               stor ltrim(str(op_ctb)) to op_ctb
            endi
            rest scre from tpg
            @ 14,17 get desc_ctb
            clea gets
********************************************************
            rps :=0
            Do whil rps =0
               save scre to tl
               @ 10,44 clea to 10,77
               cdr := '    '
               @ 14,53 get cdr pict '!999'
               @ 15,53 say '<*>Pesquisa'
               read
               if cdr = '    '
                  nmrep :=''
               else
                  if cdr = '*   '
                     psqrepre()
                     rps :=0
                     cdr := '    '
                  endi
                  Area(oMenu:aDbfs[49])
                  loca for codr = cdr
                  if eof()
                     // unlock
                     Use
                     mddad()
                     rps := 0
                     loop
                  endi
                  stor codr to cdr
                  stor nrep to nmrep
                  // unlock
                  use
                  rest scre from tl
                  @ 14,53 get cdr
                  @ 14,58 get nmrep
                  clea gets
               endi
               exit
            endd
            if Rcliente = '       '
               @ 17,01 say ' Favor preencher o NOME FANTASIA !' get z
               read
               @ 17,01 clea to 17,40
               loop
            endi
********************************************************
            Area(oMenu:aDbfs[5])
            if FJ = 'E'
               loca for cnpj = Rcnpj
            else
               loca for cpf = Rcpf
            endi
            if eof()
            else
               // unlock
               Use
               TONE(200,5)
               If ALERT("Ja Existe Cadastro com Esse CNPJ;Voce nao pode continuar !;", {"ALTERAR", "SAIR"} , "B/GR+,r") ==2
                  restscreen(00,00,23,79,TELA)
                  retu
               else
                  loop
               endi
            endi
            // unlock
            Use
            exit
         endi
         @ 15,00 to 15,79
         @ 16,02 say 'Endereáo'
         @ 18,02 say 'Lagradouro:' get Render pict '@!'
         @ 18,55 say 'N£mero:' get Rnroend pict '!!!!!!'
         @ 19,02 say 'Complemento:' get Rcompl pict '@!'
         @ 19,37 say 'Bairro:' get Rbairro pict '@!'
         @ 19,62 say 'CEP:' get CCEP pict '99.999-999'
         @ 20,02 say 'Pa°s:' 
         @ 20,18 say 'Estado:'
         @ 20,39 say 'Cidade:' 
         read
         @ 20,08 get Rpais pict '@!'
         clea gets
         RE := '  '
         do whil RE = '  '
            ET := '1'
            @ 20,26 get RE pict '!!'
            read
            if RE = '  '
               mdanul()
               rele all like r*
               set confirm off
               restscreen(00,00,23,79,TELA)
               retu
            endi
            Area(oMenu:aDbfs[40])
            loca for estd = RE
            if eof()   
               // unlock
               Use
               mdest()
               RE := '  '
               loop
            endi
            stor estd to Rest
            // unlock
            Use
            @ 20,47 get Rcida pict '@!'
            read
            ET := '2'
            Area(oMenu:aDbfs[40])
            loca for cidade = Rcida .and. estd = RE
            if eof()
               // unlock
               Use
               mdest()
               Rcida := spac(30)
               @ 20,47 clea to 21,77
               RE := '  '
               loop
            endi
            // unlock
            Use
            exit
         endd
         @ 21,12 say 'NF:' get RNF 
         @ 21,19 say 'PRNF:' get Rprnf 
         clea gets
         @ 21,02 say 'Linha:' get Rlinha
         @ 21,27 say 'Despacho:' get Rdespacho pict '@!'
         @ 22,02 say 'Recebimento:' get Rhrrec 
         @ 23,02 say 'Observacao do Pedido:' get Robssep
         read
         set confirm off
         TONE(600)
         If ALERT("Deseja Registrar o Cadastro?;;", {"SIM", "N«O"} , "B/GR+,r") ==2
            showtime()
            mdanul()
            restscreen(00,00,23,79,TELA)
            retu
         Endi
         Area(oMenu:aDbfs[5])
         go bott
         stor CODC to cdc
         // unlock
         Use
         do case
            case val(cdc)+1 < 10
               stor '000'+subs(str(val(cdc)+1),10,1) to cod
            case val(cdc)+1 >9 .and. val(cdc) < 100
               stor '00'+subs(str(val(cdc)+1),9,2) to cod
            case val(cdc)+1 > 99 .and. val(cdc) < 1000
               stor '0'+subs(str(val(cdc)+1),8,3) to cod
            case val(cdc)+1 > 999
               stor subs(str(val(cdc)+1),7,4) to cod
         endcase
         @ 04,20 get cod
         clea gets
         Area(oMenu:aDbfs[5])
         appe blan
         repl cliente with rcliente,razao with Rrazao,ender with Render,bairro with Rbairro,cida with Rcida,est with Rest,cnpj with Rcnpj,cpf with Rcpf,inscr with Rinscr,inscrp with Rinscrp,fone1 with Rfone1,fone2 with Rfone2,prazo with Rprazo
         repl CEP with CCEP,email with Rmail,obs with Robs, dscnto with Rdesc, tpdesc with Rtpdesc, contato with Rcontato,cliente with Rcliente, prazo2 with Rprazo2
         repl Ativo with 'A', nroend with Rnroend, compl with Rcompl, paiis with Rpais, linha with Rlinha,exml with Rexml, usuario with logfan, indie with Rindie
         repl nf with Rnf, prnf with Rprnf, hrrec with Rhrrec, data with DT, sit with FJ, codc with cod, tpag with Rtpag, Vmin with Rvmin, despacho with Rdespacho
         repl reg_apur with Creg_apur, indie with subs(desc_ctb,1,1), cnae with Rcnae, codrp with cdr, nrepre with nmrep,obssep with Robssep
         // unlock
         use
         mdsuces()
         restscreen(00,00,23,79,TELA)
         retu
      endd


