#include "fenix.ch"
request SIXCDX

function main()
********************
   LOCAL oPull

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
	public oMenu   := TMenuNew()
	oMenu:aDbfs    := {"comp",;
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
					"perdas",;
					"prlt",;
					"carsal",;
					"cbo",;
					"cest",;
					"log",;
					"reajuste",;
					"agplote",;
					"imprped",;
					"etiqueta",;
					"etqenv",;
					"etqpre"}	
	


	oMenu:Limpa()
  	SetaAmbiente()
	//altd()
	VerArquivo()
	UsaArquivo()
   oMenu:Limpa()

	//arq1()
   Drt    := oMenu:Unidade
	//CodTer := oMenu:Terminal
	nComp  := oMenu:Comp

	if logfan = Space(4)
		login()
		*Logfan := 'LOGFAN'
		*NMuser := 'NMUSER/...'
   end

   Ctr_User()

   Area(oMenu:aDbfs[17])
   locate for X = ' '
   if eof()
      @ 40,01 say '                                                   '
   else
      @ 40,01 say 'Existe contra-nota pendente para serem emitidas !!!'
   endi   
   unlock
   use

	Area("cadadm")
   if oMenu:Comp = "SERVIDOR"
   	if CadAdm->(Travareg())
			CadAdm->DataSis := Date()
			CadAdm->(Libera())
		end
   else
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
      end
   end
   public DRT
   Date := Date()
   Dif  := Date()
   SET( _SET_EVENTMASK, INKEY_ALL )
   SetBlink(.f.)
   mSetCursor(.T.)
   //SetMode(25,80)
   SetColor("")
   oMenu:Limpa()
   oPull := Monta_Menu()
   
	while MenuModal( oPull, 00, 00, MaxCol(), MaxCol(), "w+/b" ) != 999 ;  enddo
   return( nil )

function Monta_Menu()
   local oTopBar, oPopUp, oPopUp1, oPopUp2, oPopUp3, oItem, oItem1, oItem2
   local cCorBar  := "b*/w,w+/bg,b*/w,w+/bg,b*/w,b*/w"
   local cCorItem := "w+/bg,b*/w,w+/bg,b*/w,w/bg,w+/bg"
	local nResult  := 0
   

   oTopBar := TopBar( 0,0, MaxCol())
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
	oPopUp  := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem(MenuItem( "&Sair", {|| Encerra(@nResult) } , K_ALT_F4,, 999))
   Rodape()
   return ( oTopBar )
   
function Rodape()
*****************   
	Date := Date()
   DTF  := Date()
   nRow := MaxRow()
   
   nSetColor(31)
	Write(nRow, 00, Space(MaxCol()),31)
   inkey(0)
   Write(nRow,00, logfan+'-'+trim(nmuser))
   Write(nRow,20, "|")
   Write(nRow,22, Date())
   Write(nRow,33, '|')
   Write(nRow,33, '|')
   Showtime(nRow, 35, false, "b*/w", false, false )
   Write(nRow,44, '|')
   Write(nRow,46, 'Terminal:' + oMenu:Terminal)
   Write(nRow,60, '|')
   Write(nRow,62, ''+NCOMP+'')
   Write(nRow,75, '|')
   Write(nRow,77, oMenu:Unidade)
   return nil
   
Function Encerra(nResult)
*************************
	ErrorBeep()
	if conf("Pergunta: Deseja encerrar a execucao do sistema?")
		nResult := 999
      return 
	end	
	return

function SetaAmbiente()
	set key -41 to
   SET BELL OFF
   SET SAFE OFF
   SET DATE BRIT
   SET TALK OFF
   SET CENT ON
   SET EXCL ON
	SET DELE ON
   SET( _SET_EVENTMASK, INKEY_ALL )
   SetBlink(.f.)
   mSetCursor(.T.)
   //SetMode(25,80)
   setColor( "w+/b" )
return nil
   
