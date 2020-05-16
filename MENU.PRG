#include "fenix.ch"


function main()
********************
   LOCAL oMenu
	LOCAL unidade  := "C"   // verificar essa variavel
	LOCAL terminal
	LOCAL Comp
	
	public aDbfs := {	"comp",;
					"cadmerc",;
					"cadadm",;
					"cadfor",;
					"cadcli",;
					"compras",;
					"baixacom",;
					"gastos",;
					"desc",;
					"arq_emb",;
					"cadprod",;
					"embals",;
					"entrada",;
					"estoque",;
					"vendas",;
					"baixaven",;
					"dad_nfen",;
					"clmntdet",;
					"imposto",;
					"bcdesc",;
					"clafisc",;
					"chec",;
					"usuario",;
					"frete",;
					"ftmto",;
					"bcntacom",;
					"cadicms",;
					"cfop",;
					"bancnota",;
					"cadclas",;
					"cadfun",;
					"cheq",;
					"percmer",;
					"pgfun",;
					"hora",;
					"demovi",;
					"dpcarg",;
					"cadlin",;
					"crealin",;
					"cdade",;
					"sit_trib",;
					"cadcons",;
					"data_sem",;
					"dialet",;
					"justific",;
					"controld",;
					"opflh",;
					"despesa",;
					"represen",;
					"venrepre",;
					"cadesp",;
					"cadhis",;
					"lembre",;
					"orcmto",;
					"ctr_ent",;
					"nfat",;
					"vazil",;
					"sldvaz",;
					"ctrvaz",;
					"comcx",;
					"comvz",;
					"regiao",;
					"cmda",;
					"estq_c",;
					"pgfat",;
					"bco",;
					"abcprod",;
					"ocor",;
					"rgvaz",;
					"ven_m",;
					"abc_cli",;
					"relcom",;
					"devoluc",;
					"etq_dv",;
					"estorno",;
					"frota",;
					"ivt",;
					"nfcomp",;
					"cpom",;
					"tblp",;
					"cadfrete",;
					"status",;
					"",;
					"",;
					"",;
					"cbo",;
					"cest",;
					"log",;
					"reajuste",;
					"agplote",;
					"imprped",;
					"etiqueta",;
					"etqenv",;
					"etqpre"}

	
   Public Logfan	:= spac(4)
   Public NMuser
   Public CT_cli 	:= ' '
   Public cdtr 	:= ' '
   Public rcb_V 	:= ' '
   Public psb 		:= ' '
   Public l9 		:= ' '
   Public rt 		:= ' '
   Public saibx 	:= ' '
   Public cbc 		:= ' '
   Public gerbol 	:= ' '
   Public z 		:= ' '
	Public fat 		:= ' '

	arq1()
   stor unidade to DRT
   stor terminal to CODTER
   stor comp to Ncomp
	DbCloseAll()
   Use

	if logfan = Space(4)
		login()
		*Logfan := 'LOGFAN'
		*NMuser := 'NMUSER/...'
   end

   Ctr_User()

   Area(aDbfs[17])
   locate for X = ' '
   if eof()
      @ 40,01 say '                                                   '
   else
      @ 40,01 say 'Exite contra-nota pendente para serem emitidas !!!'
   endi   
   unlock
   use


   if Ncomp = 'SERVIDOR'
      Area(aDbfs[3])
      Repl DATASIS with date()
      Unlock
      use
   else
      Area(aDbfs[3])
      loca for date() = datasis
      if eof()
         Unlock
         Use
         TONE(200,5)
         ALERT("ATENCAO !!!;Data do Sistema Incorreta !;Voce nao pode acessar.", , "W+/B")
         quit
      else
         Unlock
         Use
      endi
   endi
   set key -41 to
   public DRT
   SET BELL OFF
   SET SAFE OFF
   SET DATE BRIT
   SET TALK OFF
   SET CENT ON
   SET EXCL ON
   stor date() to DATE
   DTF = date
   SET( _SET_EVENTMASK, INKEY_ALL )
   SetBlink(.f.)
   mSetCursor(.T.)
   SetMode(25,80)
   setColor( "w+/b" )
   scroll()    
   oMenu := Monta_Menu()
   
	while MenuModal( oMenu, 00, 00, 79, 79, "w+/b" ) != 999 ;  enddo
   return( nil )


function Monta_Menu()
   local oTopBar, oPopUp, oPopUp1, oPopUp2, oPopUp3, oItem, oItem1, oItem2
   
   local cCorBar  := "b*/w,w+/bg,b*/w,w+/bg,b*/w,b*/w"
   local cCorItem := "w+/bg,b*/w,w+/bg,b*/w,w/bg,w+/bg"


   oTopBar := TopBar( 0,0,131)
   oTopBar:ColorSpec := cCorBar

   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Cadastros", oPopUp, ,) )


   oItem := MenuItem( "Cadastro de &Clientes" , {|| cadastro() } ,101)
   oPopUp:AddItem( oItem )
   if Yclicad = 'B'   
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Cadastro de &Fornecedores" ,{|| cadastro() })
   oPopUp:AddItem( oItem )
   if Yforcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Cadastro de &Merc./Suprimento" ,{|| Alert("merc.suprim...()") })
   oPopUp:AddItem( oItem )
   if Ymercad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Cadastro de &Produtos" ,{|| Alert("Produtos()") })
   oPopUp:AddItem( oItem )
   if Yprocad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

   oItem :=MenuItem( "Representantes", {|| Alert("representantes()") })
   oPopUp:AddItem( oItem )
   if Yrepcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Transportadoras", {|| Alert("Transportadoras()") })
   oPopUp:AddItem( oItem )
   if Ytracad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

   oItem :=MenuItem( "Municipios", {|| Alert("municipios()") })
   oPopUp:AddItem( oItem )
   if Ymuncad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Cfop" ,{|| Alert("CFOP()") })
   oPopUp:AddItem( oItem )
   if Ycfocad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Estado/ICMS", {|| Alert("estado icms()") })
   oPopUp:AddItem( oItem )
   if Yestcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "CEST", {|| Alert("cest()") })
   oPopUp:AddItem( oItem )
   if Ycescad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

   oItem :=MenuItem( "Codigo de Barras", {|| Alert("CODB BAR()") })
   oPopUp:AddItem( oItem )
   if Ycdbcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi


   oItem :=MenuItem( "Clas.Suprimentos", {|| Alert("suprimentos()") })
   oPopUp:AddItem( oItem )
   if Yclacad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "Embalagens", {|| Alert("Embalgens()") })
   oPopUp:AddItem( oItem )
   if Yembcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

*----------
*VENDAS
*----------
   oPopUp           := PopUp()
   oPopUp:ColorSpec := cCorItem
   oTopBar:AddItem( MenuItem ( "&Vendas", oPopUp, ,) )

	oPopUp1 := PopUp()
	oPopUp1 :ColorSpec:= cCorItem
	oItem := MenuItem( "&Registrar Saida", {|| Alert("vendas()") })
      oPopUp:AddItem( oItem )
      if Yvenda = 'B'
         oItem:Enabled := .f.
      else
         oItem:Enabled := .t.
      endi

      oItem :=MenuItem( "&Baixa", {|| Alert("baixa()") })
      oPopUp:AddItem( oItem )
       
      oItem :=MenuItem( "&Corrige", {|| Alert("edita()") })
      oPopUp:AddItem( oItem )


      oPopUp_E := PopUp()
      oPopUp_E :ColorSpec:= cCorItem
      oItem := MenuItem( "Estoque",oPopUp_E )
      oPopUp:AddItem( oItem )

           oItem_E1 := MenuItem( "&Todo Estoque", {|| Alert("estoque()") })
           oPopUp_E:AddItem( oItem_E1 )

           oItem_E2 := MenuItem( "&Por Produto", {|| Alert("por produto()") })
           oPopUp_E:AddItem( oItem_E2 )

           oItem_E3 := MenuItem( "&Sistema Kanban", {|| Alert("Kanban()") })
           oPopUp_E:AddItem( oItem_E3 )

           oPopUp_M := PopUp()
           oPopUp_M :ColorSpec:= cCorItem
           oItem_E4 := MenuItem( "&Manipular",oPopUp_M)
           oPopUp_E:AddItem( oItem_E4 )

              oItem_M1 := MenuItem( "&Gerar Pre-Lote", {|| Alert("prelote()") })
              oPopUp_M:AddItem( oItem_M1 )
              
              oItem_M2 := MenuItem( "&Concluir Estoque", {|| Alert("concluir estoque()") })
              oPopUp_M:AddItem( oItem_M2 )

              oPopUp_M:AddItem( MenuItem( MENU_SEPARATOR ) )

              oItem_M3 := MenuItem( "&Baixar Amostras", {|| Alert("bx amostra()") })
              oPopUp_M:AddItem( oItem_M3 )

              oItem_M4 := MenuItem( "Controle de &Perdas", {|| Alert("perdas()") })
              oPopUp_M:AddItem( oItem_M4 )

      oPopUp_L := PopUp()
      oPopUp_L :ColorSpec:= cCorItem
      oItem :=MenuItem( "&Listagem", oPopUp_L)
      oPopUp:AddItem( oItem )
 
           oItem_L1 := MenuItem( "&Listagem ctas a Receber", {|| Alert("ctas receber()") })
           oPopUp_L:AddItem( oItem_L1 )

           oItem_L2 := MenuItem( "&Pedidos", {|| Alert("Pedidos()") })
           oPopUp_L:AddItem( oItem_L2 )

           oItem_L3 := MenuItem( "&Representantes", {|| Alert("Representantes()") })
           oPopUp_L:AddItem( oItem_L3 )

           oItem_L4 := MenuItem( "&Estoque Representantes", {|| Alert("Estoque Repres...()") })
           oPopUp_L:AddItem( oItem_L4 )

           oItem_L5 := MenuItem( "P&rotestos", {|| Alert("Protestos...()") })
           oPopUp_L:AddItem( oItem_L5 )

      oItem :=MenuItem( "&Pesquisa", {|| Alert("Pesquisa()") })
      oPopUp:AddItem( oItem )

      oItem :=MenuItem( "&Faturamento", {|| Alert("faturamento()") })
      oPopUp:AddItem( oItem )

      oItem :=MenuItem( "&Devolucoes", {|| Alert("Devolucoes()") })
      oPopUp:AddItem( oItem )

      oItem :=MenuItem( "Le&mbretes", {|| Alert("Lembretes()") })
      oPopUp:AddItem( oItem )
*----------
*COMPRAS
*----------
   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "Compras", oPopUp, ,) )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Registrar Entrada", {|| Alert("compras()") })
      oPopUp:AddItem( oItem )
      if Ycompra = 'B'   
      else
      endi      


      oItem :=MenuItem( "&Baixa", {|| Alert("baixa()") })
      oPopUp:AddItem( oItem )
       
      oItem :=MenuItem( "&Corrige", {|| Alert("edita()") })
      oPopUp:AddItem( oItem )

      oPopUp_LC := PopUp()
      oPopUp_LC :ColorSpec:= cCorItem
      oItem :=MenuItem( "&Listagem", oPopUp_LC)
      oPopUp:AddItem( oItem )
 
           oItem_LC1 := MenuItem( "&Listagem ctas a Pagar", {|| Alert("ctas pagar()") })
           oPopUp_LC:AddItem( oItem_LC1 )

           oItem_LC2 := MenuItem( "&Pedidos", {|| Alert("Pedidos()") })
           oPopUp_LC:AddItem( oItem_LC2 )

      oItem :=MenuItem( "&Pesquisa", {|| Alert("Pesquisa()") })
      oPopUp:AddItem( oItem )

      oItem :=MenuItem( "&Faturamento", {|| Alert("faturamento()") })
      oPopUp:AddItem( oItem )

      oItem :=MenuItem( "&Registra Vazilhames", {|| Alert("vazilhames()") })
      oPopUp:AddItem( oItem )
*----------
*SAIR
*----------
   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem(MenuItem( "&Sair", {||.t.} , K_ALT_F4, , 999))
****

****

   stor date() to DATE
   DTF := date
   set color to b*/w,w+/bg,b*/w,w+/bg,b*/w,b*/w
   @ 24,00 clea to 42,131
   @ 24,00 say logfan+'-'+trim(nmuser)
   @ 24,20 say '|'
   @ 24,22 say DATE()
   @ 24,33 say '|'
   SHOWTIME(24,35,.F.,"b*/w",.F.,.F.)
   @ 24,44 say '|'
   @ 24,46 say 'Terminal:'
   @ 24,56 say CODTER
   @ 24,60 say '|'
   @ 24,62 say ''+NCOMP+''
   @ 24,75 say '|'
   @ 24,77 say drt

   return ( oTopBar )


