#include "fenix.ch"

function cadasfor()
*******************
   LOCAL GetList := {}
   LOCAL cScreen := SaveScreen()
   LOCAL Opsel   := 0	
   LOCAL aMenu   := {" Pesquisar ", " Cadastrar "}

   while true
		oMenu:Limpa()
   	Opsel := FazMenu( 10, 10, aMenu, "CADASTRO DE FORNECEDORES" )
		Do Case
		Case Opsel = 0
   		return(Restela(cScreen))
		Case Opsel = 1
      	    FornecedorInclusao()
		Case Opsel = 2
 			FornecedorPesquisa()
		Endcase
	enddo


function FornecedorInclusao()
***************************
   LOCAL GetList := {}
   LOCAL cScreen := SaveScreen()
     

   oMenu:Limpa()
   Area(oMenu:aDbfs[4])
   go bott
   cdf := CODf
   Do case
      case val(cdf)+1 < 10
            stor '000'+subs(str(val(cdf)+1),10,1) to cod
      case val(cdf)+1 >9 .and. val(cdf) < 100
            stor '00'+subs(str(val(cdf)+1),9,2) to cod
      case val(cdf)+1 > 99 .and. val(cdf) < 1000
            stor '0'+subs(str(val(cdf)+1),8,3) to cod
      case val(cdf)+1 > 999
            stor subs(str(val(cdf)+1),7,4) to cod
    Endcase
    Tdoc := 0
    FJ := ' '
    while FJ = ' '
       @ 10,04 say '* <P>rodutor ou <E>mpresa:' get FJ pict '!' valid (FJ $ 'PE')
       read
       if FJ = ' '
          return .f.
       endif
       if FJ = "P"
          stor 'PRODUTOR' to FJ
       else
          stor 'EMPRESA' to FJ
       endif
       @ 04,32 get FJ
       clea gets
    Enddo
    if FJ = 'P'
       tdoc := 2
       @ 12,03 to 16,35
       @ 12,04 say 'Cadastro com:'
       @ 14,04 prompt 'CNPJ'
       @ 15,04 prompt 'CPF'
       menu to Tdoc
       if Tdoc = 0
          mdcanc()
          return .f.
       else
          tdoc := 1
       endif 
	endif
    DT := date()
    @ 05,00 clea to 23,79
    Area("cadfor")
    if Cadfor->(Incluiu())
       Cadfor->data := DT
	   Cadfor->codf := COD
	   Cadfor->sit := FJ
    	   *appe blan
            *repl data with DT,codf with COD,sit with FJ
       store recno() to regcad
       store data to rdata
       store sit to Csit
       store nfor to Rnfor
       store razao to Rrazao
       store ender to Render
       store nroend to Rnroend
       store compl to Rcompl
       store bairro to Rbairro
       store cida to Rcida
       store est to Rest
       store paiis to Rpais
       store cnpj to Rcnpj
       store inscr to Rinscr
       store cpf to Rcpf
       store inscrp to Rinscrp
       store fone1 to Rfone1
       store fone2 to Rfone2
       store prz to Rprz
       store obser to Robser
       store CEP to CCEP
       store contato to Rcontato
       store mail to Rmail
       store linha to Rlinha
       store reg_apur to Rreg_apur
       store ctrol to Rctrol
       Rpais = 'BRASIL'
       store recno() to regprim
       Cadfor->(Libera()) 
    endif
		 *unlock
         *use
    @ 00,00 clea to 23,79
    @ 00,00 to 23,79 doub
    @ 01,26 say '* CADASTRO DE FORNECEDORES *'
    @ 02,01 to 14,78    
    @ 02,02 say 'Fornecedor'
    @ 04,02 say 'C¢digo do Fornecedor:' get cod
    @ 04,30 get FJ
    @ 05,02 say 'Data Cadastro:' get date
    clea gets
    @ 04,42 say 'Fantasia:' get Rnfor pict '@!'
    read
    @ 06,02 say 'Razao Social:' get Rrazao pict '@!'
    if Tdoc = 1
       @ 07,02 say 'C.N.P.J.:' get Rcnpj pict '99.999.999/9999-99'
       @ 07,42 say 'Inscr.Est.:' get Rinscr pict '9999999999999999'
    else
       @ 07,02 say 'CPF:' get Rcpf pict '999.999.999-99'
       @ 07,42 say 'RG:' get Rinscrp pict '9999999999999999'
    endif
    @ 08,02 say 'Contato:' get Rcontato pict '@!'
    @ 08,35 say 'Fone:' get Rfone1 pict '(99)9999-99999'
    @ 08,56 say 'ou:' get Rfone2 pict '(99)9999-99999'
    @ 09,02 say 'E-mail:' get Rmail
    @ 10,02 say 'Prazo:' get Rprz pict '999'
    @ 10,13 say 'Dias.'
    @ 11,02 say 'Observacoes:' get Robser pict '@!'
    read
    @ 15,01 to 22,78
    @ 15,02 say 'Endere‡o'
    @ 17,02 say 'Lagradouro:' get Render pict '@!'
    @ 17,55 say 'N£mero:' get Rnroend pict '!!!!!!'
    @ 18,02 say 'Complemento:' get Rcompl pict '@!'
    @ 18,37 say 'Bairro:' get Rbairro pict '!!!!!!!!!!!!!!!!!'
    @ 20,62 say 'CEP:' get CCEP pict '99.999-999'
    @ 19,02 say 'Pa¡s:' 
    @ 19,18 say 'Estado:'
    @ 19,39 say 'Cidade:' 
    read
    @ 19,08 get Rpais pict '@!'
    clea gets
    RE := '  '
    do whil RE = '  '
       ET := '1'
       @ 19,26 get RE pict '!!'
       read
       if RE = '  '
          area(cadfor)
	      go regcad
	      if Cadfor->(travareg())
             Dele
             pack
             Cadfor->(Libera())   
		  endif
			   *unlock
               *use
          mdanul()
          retu
       endif
       Area(Cdade)
       loca for estd = RE
       if eof()   
               *Unlock
               *Use
          Mdest()
          RE := '  '
          loop
       endif
       stor estd to Rest
            *Unlock
            *Use
       @ 19,47 get Rcida pict '@!'
       read
       ET := '2'
       Area("cadfor")
       loca for cidade = Rcida .and. estd = RE
       if eof()
          mdest()
          Rcida := spac(30)
          @ 19,47 clea to 19,77
          RE := '  '
          loop
       endif
       exit
    endd
    cdl := '  '
    do whil cdl = '  '
       @ 20,02 say 'RegiÆo:' get cdl pict '!9'
       @ 21,02 say '<*>'
       read
       if cdl = '  '
          @ 20,02 say 'Digite Algo...' get z
          read
          @ 20,02 say '              '
          cdl := '  '
          loop
       endif
       if cdl = '* '
          psq_lin()
          cdl := '  '
          Area("Regiao")
          loca for codr = cdl
          if eof()
             mddad()
             cdl := '  '
             loop
          endi
          @ 20,02 clea to 21,20
          @ 20,02 say 'RegiÆo:' get cdl
          @ 20,12 say '-'
          @ 20,13 get Regiao
          clea gets
        endif
        SN := ' '
        @ 22,15 say '* Deseja registrar o Cadastro? <S/N>' get SN pict '!' valid (SN $ 'SN')
        read
        if SN # 'S'
           Area("Cadfor")
   	       go regprim
		   if Cadfor->(travareg())
              Dele
              pack
              Cadfor->(Libera())   
           endif
           Area("Cadfor")
           go regcad
           if Cadfor->(travareg())
              Dele
              pack
              Cadfor->(Libera())   
           endif
           mdanul()
           retu
        endif
        Area("Cadfor")
        go regcad
        if Cadfor->(Incluiu())
           Cadfor->nfor := rnfor
		   Cadfor->razao := Rrazao
		   Cadfor->ender := Render
           Cadfor->bairro := Rbairro
		   Cadfor->cida := Rcida
		   Cadfor->est := Rest
           Cadfor->fone1 := Rfone1
		   Cadfor->fone2 := Rfone2
		   Cadfor->prz := Rprz
		   Cadfor->cep := Ccep
		   Cadfor->mail := Rmail
		   Cadfor->obser := Robser
		   Cadfor->contato := Rcontato
		   Cadfor->usuario := logfan
		   Cadfor->nroend := Rnroend
		   Cadfor->compl := Rcompl
		   Cadfor->paiis := Rpais
		   Cadfor->linha := cdl
		   if tdoc = 2
		      Cadfor->sit := "PESSOA FISICA"
		      Cadfor->cpf := Rcpf
		      Cadfor->inscrp := Rinscrp
		   else
		      Cadfor->cnpj := Rcnpj
			  Cadfor->inscr := Rinscr
		   Endif
		 
		 *repl Nfor with rnfor,razao with Rrazao,ender with Render,bairro with Rbairro,cida with Rcida,est with Rest,fone1 with Rfone1,fone2 with Rfone2,prz with Rprz
         *repl CEP with CCEP,mail with Rmail,obser with Robser, contato with Rcontato, usuario with logfan
         *repl nroend with Rnroend, compl with Rcompl, paiis with Rpais, linha with cdl
         *if tdoc = 2
         *   repl SIT with 'PESSOA FISICA',cpf with Rcpf,inscrp with Rinscrp
         *else
         *   repl cnpj with Rcnpj, inscr with Rinscr
         *endi
           Cadfor->(Libera())
		   mdsuces()
           exit
        endif
    enddo
    if CN = 'C'
       retu
    endif
  
function fornecedorpesquisa()
***************************
   TT := 0
   cdtr := 'X'
   psqfor()
   PEC := '    '
   Do whil PEC = '    '
      @ 08,03 clea to 22,49   
      digt := '4'
      @ 08,04 say '* Para Editar Cadastro Digite o CODIGO:' get PEC
      @ 09,04 say '  <ENTER> para Sair'
      read
      if PEC = '    '
         retu
      endif
      Z1 := ' '
      reg := val(pec)
      nrpd()
      pec := codnum
      @ 08,45 get PEC
      clea gets
      Area("cadfor")
      stor SIT to SLT  
      loca for codf = PEC
      if eof()
         mdfor()
         Z1 := 'N'
         PEC := '    '
         loop
      endif
      store recno() to regcad
      store data to cdata
      store sit to Csit
      store codf to Ccodf
      store nfor to Cnfor
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
      store prz to Cprz
      store obser to Cobser
      store mail to Cmail
      store cep to Ccep
      store contato to Ccontato
      store linha to Clinha
      store reg_apur to Creg_apur
      store ctrol to Cctrol
      Rpais = 'BRASIL'
      stor indie to Cindie
      store recno() to reg4
      if Ccpf = ' '
         if Csit # 'PESSOA FISICA'
            Tdoc := 1
         else
            Tdoc := 2
         endif
      else
         Tdoc := 2
      endif
      if Z1 = 'N'
         loop
      endif
   enddo
   @ 00,00 clea to 23,79
   @ 00,00 to 23,79 doub
   @ 01,26 say "* CADASTRO DE FORNECEDOR *"
   @ 02,01 to 14,78
   @ 04,02 say 'C¢digo Fornecedor:'
   @ 05,02 say 'Data Cadastro:' 
   @ 04,42 say 'Fantasia:'
   @ 06,02 say 'Razao Social:'
   if Tdoc = 1
      @ 07,02 say 'C.N.P.J.:'
      @ 07,42 say 'Inscr.Est.:'
   else
      @ 07,02 say 'CPF:' 
      @ 07,42 say 'RG:' 
   endif
   @ 08,02 say 'Contato:'
   @ 08,35 say 'Fone:'
   @ 08,56 say 'ou:'
   @ 09,02 say 'E-mail:'
   @ 10,02 say 'Prazo:'
   @ 10,13 say 'Dias.'
   @ 11,02 say 'Observacoes:'
   @ 13,02 say 'Regime de Apura‡Æo:'
   @ 14,02 say 'Tipo Contrbte:'      
   bcor()
   @ 04,21 say Ccodf
   @ 04,28 say Csit
   @ 05,17 say Cdata
   @ 04,52 say cnfor
   @ 06,16 say crazao 
   if Tdoc = 1
      @ 07,12 say ccnpj 
      @ 07,54 say cinscr 
   else
      @ 07,07 say Ccpf
      @ 07,47 say Cinscrp
   endif
   @ 08,11 say Ccontato
   @ 08,41 say Cfone1 
   @ 08,60 say Cfone2
   @ 09,10 say Cmail
   @ 10,09 say Cprz 
   @ 11,15 say Cobser
   if Creg_apur = ' '
      @ 13,22 say 'NENHUM'
   elseif Creg_apur = '1'
      @ 13,22 say '1-SIMPLES NACIONAL'
   elseif Creg_apur = '2'
      @ 13,22 say '2-LUCRO PRESUMIDO'
   elseif Creg_apur = '3'
      @ 13,22 say '3-LUCRO REAL'
   endif

   if Cindie = '1'
      @ 14,17 say '1-Contribuinte ICMS'
   elseif Cindie = '2'
      @ 14,17 say '2-Contribuinte ISENTO'
   elseif Cindie = '9'
      @ 14,17 say '9-NÇO Contribuinte'
   endif

   @ 15,01 to 22,78
   @ 17,02 say 'Lagradouro:'
   @ 17,55 say 'N£mero:'
   @ 18,02 say 'Complemento:'
   @ 18,37 say 'Bairro:'
   @ 20,62 say 'CEP:'
   @ 19,02 say 'Pa¡s:' 
   @ 19,18 say 'Estado:'
   @ 19,39 say 'Cidade:'
   @ 20,02 say 'RegiÆo:'
         
   @ 17,14 say Cender
   @ 17,63 say Cnroend
   @ 18,15 say Ccompl
   @ 18,45 say Cbairro
   @ 20,67 say CCEP
   @ 19,08 say Cpais
   @ 19,26 say Cest
   @ 19,47 say Ccida 
   Area("Regiao")
   loca for codr = clinha
   rgao := regiao
   @ 20,10 say Clinha+'-'+rgao
   MN := 0
   Do Whil MN = 0
      @ 02,02 prompt 'Fornecedor'
      @ 15,02 prompt 'Endere‡o'
      menu to MN
      if MN = 0
         retu
      elseif MN = 1
         MN_cl := 0
         do whil MN_cl = 0
            @ 04,02 say 'C¢digo Fornecedor:'
            @ 05,02 say 'Data Cadastro:' 
            @ 04,42 prompt 'Fantasia:'
            @ 06,02 prompt 'Razao Social:'
            if Tdoc = 1
               @ 07,02 prompt 'C.N.P.J.:'
               @ 07,42 prompt 'Inscr.Est.:'
            else
               @ 07,02 prompt 'CPF:'
               @ 07,42 prompt 'RG:' 
            endif
            @ 08,02 prompt 'Contato:'
            @ 08,35 prompt 'Fone:'
            @ 08,56 prompt 'ou:'
            @ 09,02 prompt 'E-mail:'
            @ 10,02 prompt 'Prazo:'
            @ 10,13 say 'Dias.'
            @ 11,02 prompt 'Observacoes:'
            @ 13,02 prompt 'Regime de Apura‡Æo:'
            @ 14,02 prompt 'Tipo Contrbte:'      
            @ 13,60 prompt 'VOLTAR'
            menu to mn_cl
            if MN_CL = 1
               @ 04,52 get cnfor pict '@!'
               read
               Area("cadfor")
               go reg4
			   repl nfor with Cnfor
               @ 04,52 say cnfor
               MN_cl := 0
               loop
            endif
            if MN_CL = 2
               @ 06,16 get Crazao pict '@!'
               read
               Area("cadfor")
               go reg4
               repl razao with Crazao
               @ 06,16 say Crazao
               MN_CL := 0
               loop
            endif
            if MN_CL = 3
                  if Tdoc = 1
                     @ 07,12 get ccnpj pict '99.999.999/9999-99'
                     read
                     Area("cadfor")
                     go reg4
                     repl cnpj with Ccnpj
                     set color to b+/w
                     @ 07,12 say Ccnpj
                     tcor()
                  else
                     @ 07,07 get Ccpf pict '999.999.999-99'
                     read
                     Area("cadfor")
                     go reg4
                     repl cpf with Ccpf
                     set color to b+/w
                     @ 07,07 say Ccpf
                     tcor()
                  endif
               MN_CL := 0
               loop
            endif
            if MN_CL = 4
                  if Tdoc = 1
                     @ 07,54 get cinscr pict '9999999999999999'
                     read
                     Area("cadfor")
                     go reg4
                     repl inscr with Cinscr
                     set color to b+/w
                     @ 07,54 say Cinscr
                     tcor()
                  else
                     @ 07,46 get Cinscrp pict '9999999999999999'
                     read
                     Area("cadfor")
                     go reg4
                     repl inscrp with Cinscrp
                     set color to b+/w
                     @ 07,46 say Cinscrp
                     tcor()
                  endif
               MN_CL := 0
               loop
            Endif
            if MN_CL = 5
               @ 08,11 get Ccontato pict '@!'
               read
               Area("cadfor")
               go reg4
               repl contato with Ccontato
               set color to b+/w
               @ 08,11 say Ccontato
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 6
               @ 08,41 get Cfone1 pict '(99)9999-99999'
               read
               Area("cadfor")
               go reg4
               repl fone1 with Cfone1
               set color to b+/w
               @ 08,41 say Cfone1
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 7
               @ 08,60 get Cfone2 pict '(99)9999-99999'
               read
               Area("cadfor")
               go reg4
               repl fone2 with Cfone2
               set color to b+/w
               @ 08,60 say Cfone2
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 8
               @ 09,10 get Cmail
               read
               Area("cadfor")
               go reg4
               repl mail with Cmail
               set color to b+/w
               @ 09,10 say Cmail
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 9
               @ 10,09 get Cprz pict '999'
               read
               Area("cadfor")
               go reg4
               repl prz with Cprz
               set color to b+/w
               @ 10,09 say Cprz
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 10
               @ 11,15 get Cobser pict '@!'
               read
               Area("cadfor")
               go reg4
               repl obser with Cobser
               set color to b+/w
               @ 11,15 say Cobser
               tcor()
               MN_CL := 0
               loop
            Endif
            if MN_CL = 11
               OP_REGAP = 0
               Tela11 := SaveScreen()
               set color to w/b+
               @ 13,02 clea to 16,22
               @ 13,02 prompt '1-SIMPLES NACIONAL'
               @ 14,02 prompt '2-LUCRO PRESUMIDO'
               @ 15,02 prompt '3-LUCRO REAL'
               @ 16,02 prompt 'NENHUM'
               menu to op_regap
               if OP_regap = 1
                  Creg_apur := '1'
                  desc_REGA := 'SIMPLES NACIONAL'
               elseif OP_regap = 2
                  Creg_apur := '2'
                  desc_REGA := 'LUCRO PRESUMIDO'
               elseif OP_regap = 3
                  Creg_apur := '3'
                  desc_REGA := 'LUCRO REAL'
               elseif OP_regap = 4
                  Creg_apur := ' '
                  desc_rega := 'NENHUM'
               endif
               Area("cadfor")
               go reg4
               repl reg_apur with Creg_apur
               rest screen from tela11
               set color to b+/w
               @ 13,22 CLEA TO 13,55
               @ 13,22 say Creg_apur
               @ 13,23 say '-'
               @ 13,24 say desc_rega
               tcor()
               MN_CL := 0
               loop
            endif
            if MN_CL = 12
               OP_ctb := 0
               Tela12 := SaveScreen()
               set color to w/b+
               @ 14,17 clea to 17,37
               @ 14,17 prompt '1-Contribuinte ICMS'
               @ 15,17 prompt '2-Contribuinte ISENTO'
               @ 16,17 prompt '9-NÇO Contribuinte'
               menu to op_ctb
               if OP_ctb = 0
                  rest screen from tela12
                  tcor()
                  MN_CL := 0
                  loop
               endif
               If OP_ctb = 1
                  desc_ctb := '1-Contribuinte ICMS'
                  elseif OP_ctb = 2
                  desc_ctb := '2-Contribuinte ISENTO'
                  elseif OP_ctb = 3
                  desc_ctb := '9-NÇO Contribuinte'
               Endif
               op_ctb := ltrim(str(op_ctb))
               Area("Cadfor")
               go reg4
               repl indie with subs(desc_ctb,1,1)
               rest screen from tela12
               bcor()
               @ 14,17 clea to 14,37
               @ 14,17 say desc_ctb
               tcor()
               MN_CL := 0
               loop
            endif
            if MN_CL = 13 .or. mn_cl = 0
               @ 13,60 clea to 13,77
               MN := 0
               exit
            endif
         Enddo
      elseif MN = 2
         MN_Ed := 0
         Do whil MN_Ed = 0
            @ 17,02 prompt 'Lagradouro:'
            @ 17,55 prompt 'N£mero:'
            @ 18,02 prompt 'Complemento:'
            @ 18,37 prompt 'Bairro:'
            @ 19,02 prompt 'Pa¡s:' 
            @ 19,18 prompt 'Estado:'
            @ 19,39 prompt 'Cidade:'
            @ 20,02 prompt 'RegiÆo:'
            @ 20,62 prompt 'CEP:'
            @ 21,02 prompt 'VOLTAR                                          '
            menu to MN_ED
            if MN_Ed = 1
               @ 17,14 get Cender pict '@!'
               read
               Area("Cadfor")
               go reg4
               repl ender with Cender
               set color to b+/w
               @ 17,14 say Cender
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 2
               @ 17,63 get Cnroend pict '!!!!!!'
               read
               Area("Cadfor")
               go reg4
               repl nroend with Cnroend
               set color to b+/w
               @ 17,63 say Cnroend
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 3
               @ 18,15 get Ccompl pict '@!'
               read
               Area("Cadfor")
               go reg4
               repl compl with Ccompl
               set color to b+/w
               @ 18,15 say Ccompl
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 4
               @ 18,45 get Cbairro pict '@!'
               read
               Area(Cadfor)
               go reg4
               repl bairro with Cbairro
               set color to b+/w
               @ 18,45 say Cbairro
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 5
               @ 19,08 say Cpais
               read
               Area("Cadfor")
               go reg4
               repl paiis with Cpais
               set color to b+/w
               @ 19,08 say Cpais
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 6
               ET := '1'
               RE := ' '
               do whil RE = ' '
                  @ 19,26 get Cest pict '!!'
                  read
                  if Cest = '  '
                     mdest()
                     RE := ' '
                     loop
                  endif
                  Area(oMenu:aDbfs[40])
                  loca for estd = Cest
                  if eof()   
                     mdest()
                     Area(oMenu:aDbfs[4])
                     go reg4
                     stor est to Cest
                     RE := ' '
                     loop
                  endif
                  Area(oMenu:aDbfs[4])
                  go reg4
                  repl est with Cest
                  bcor()
                  @ 19,26 say Cest
                  tcor()
                  exit
               enddo
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 7
               ET := '2'
               RC := ' '
               do whil RC = ' '
                  @ 19,47 get Ccida pict '@!'
                  read
                  if Ccida = '    '
                     mdest()
                     RC := ' '
                     loop
                  endif
                  Area(oMenu:aDbfs[40])
                  loca for cidade = Ccida .and. estd = Cest
                  if eof()
                     mdest()
                     Area(oMenu:aDbfs[4])
                     go reg4
                     stor cida to Ccida
                     RC := ' '
                     loop
                  endif
                  Area(oMenu:aDbfs[4])
                  go reg4
                  repl cida with Ccida
                  set color to b+/w
                  @ 19,47 say Ccida
                  tcor()
                  exit
               enddo
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 8
               do whil .t.
                  @ 20,09 clea to 20,20
                  @ 20,09 get Clinha pict '!9'
                  @ 21,12 say '<*>Pesquisa'
                  read
                  @ 21,12 clea to 21,30
                  if clinha = '  '
                     retu
                  endif
                  if clinha = '* '
                     psq_lin()
                     clinha := '  '
                  endif
                  Area(oMenu:aDbfs[62])
                  loca for codr = clinha
                  if eof()
                     mddad()
                     cdl := '  '
                     loop
                  endif
                  @ 20,02 clea to 21,20
                  @ 20,02 say 'RegiÆo:' get clinha
                  @ 20,11 say '-'
                  rgao := regiao
                  @ 20,12 get Rgao
                  clea gets
                  exit
               enddo
               Area(oMenu:aDbfs[4])
               go reg4
               repl linha with Clinha
               set color to b+/w
               @ 20,09 say Clinha+'-'+Rgao
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 9
               @ 20,67 get Ccep pict '99.999-999'
               read
               Area(oMenu:aDbfs[4])
               go reg4
               repl cep with Ccep
               bcor()
               @ 20,67 say Ccep
               tcor()
               MN_Ed := 0
               loop
            endif
            if MN_Ed = 10
               @ 21,02 clea to 21,77
               MN := 0
               exit
            endif
         Enddo
      Endif
    Enddo
