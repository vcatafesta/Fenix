#include "fenix.ch"

REQUEST SIXCDX
REQUEST HB_CODEPAGE_PT850
REQUEST HB_CODEPAGE_PTISO
REQUEST HB_CODEPAGE_PT860
REQUEST HB_CODEPAGE_UTF8
REQUEST HB_LANG_EN
REQUEST HB_LANG_PT
static s_hMutex
public XNOMEFIR
public SISTEM_NA2

init def Main(...)
******************
   LOCAL oPull
   Public Logfan		:= spac(4)
   Public CT_cli 	   := ' '
   Public cdtr 	   := ' '
   Public rcb_V 	   := ' '
   Public psb 		   := ' '
   Public l9 		   := ' '
   Public rt 		   := ' '
   Public saibx 	   := ' '
   Public cbc 		   := ' '
   Public gerbol 	   := ' '
   Public z 			:= ' '
   Public fat 			:= ' '
	public oAmbiente	:= TAmbiente():New()
	public oMenu     	:= oAmbiente
	public oIni		  	:= TIniNew("fenix.ini")
	public oIndice	  	:= TIndiceNew()
   public oPrinter   := TPrinterNew()
   
	hb_langSelect( "pt" )
	oMenu:Limpa()
  	SetaAmbiente()
   RddSetDefault( RDDNAME )
	ArrayBancoDeDados()
   CriaArquivo()
	if !VerIndice()
		Alert("ERRO Tente mais tarde.")
		FChDir( oAmbiente:xBase )
		SalvaMem()
		SetMode(oAmbiente:AlturaFonteDefaultWindows, oAmbiente:LarguraFonteDefaultWindows)
		Cls
		Quit
	endif
	oMenu:Limpa()
	UsaArquivo()
	//Abrearea()
   oMenu:Limpa()
	login()
	SetaIni()
	oMenu:StatusSup 	:= "Fenix for Windows v1.0"
	oMenu:StatusInf 	+= AllTrim(oMenu:Comp)
	oMenu:StatusInf 	+= "|"
	oMenu:StatusInf 	+= AllTrim(oMenu:Unidade)
	XNOMEFIR 		 	:= oMenu:Nomefirma	
	SISTEM_NA2			:= oMenu:StatusSup

	Area("dad_nfen")
   locate for dad_nfen->X = Space(1)
   if dad_nfen->(!eof())
      Alerta('Existe contra-nota pendente para serem emitidas')
   end

	Area("cadadm")
   if oMenu:Comp = "SERVIDOR"
   	if CadAdm->(Travareg())
			CadAdm->DataSis := Date()
			CadAdm->(Libera())
		end
   else
      locate for date() = datasis
      if eof()
         TONE(200,5)
         ALERT("ATENCAO !!!;Data do Sistema Incorreta !;Voce nao pode acessar.", , "W+/B")
         quit
      end
   end
   Date := Date()
   Dif  := Date()
   SetColor("")
	oPull := Monta_Menu()
	while true
		BEGIN Sequence
			oMenu:Limpa()
			while MenuModal( oPull, 01, 00, MaxCol(), MaxCol(), "w+/b" ) != 999 ;  enddo			
		Recover
			oPull := Monta_Menu()
			//FechaTudo()
		FINALLY
	enddo	
	Encerra()
endef

def Monta_Menu()
   local oTopBar, oPopUp, oPopUp1, oPopUp2, oPopUp3, oItem, oItem1, oItem2
   local cCorBar  := "b*/w,w+/bg,b*/w,w+/bg,b*/w,b*/w"
   local cCorItem := "w+/bg,b*/w,w+/bg,b*/w,w/bg,w+/bg"
	local nResult  := 0

   oTopBar           := TopBar( 01,00 , MaxCol())
   oTopBar:ColorSpec := cCorBar

*----------
*SAIR
*----------	
	oPopUp            := PopUp()
   oPopUp :ColorSpec := cCorItem
   oTopBar:AddItem(MenuItem( "&Sair", oPopUp,,))
	   oPopUp2           := PopUp()
      oPopUp2:ColorSpec := cCorItem
      oItem             := MenuItem( "&Encerrar execucao do sistema", {|| Encerra(@nResult) } , K_ALT_F4,, 999)
      oPopUp:AddItem( oItem )

*=============================================================================================================================*
* CADASTROS
*=============================================================================================================================*

   oPopUp           := PopUp()
   oPopUp:ColorSpec := cCorItem
   oTopBar:AddItem( MenuItem ( "&Cadastros", oPopUp, ,) )

   oItem := MenuItem( "&Clientes" , {|| ClientesInclusao() } ,101)
   oPopUp:AddItem( oItem )
   if Yclicad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Fornecedores" ,{|| nil })
   oPopUp:AddItem( oItem )
   if Yforcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Merc./Suprimento" ,{|| Alert("merc.suprim...()") })
   oPopUp:AddItem( oItem )
   if Ymercad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Produtos" ,{|| Alert("Produtos()") })
   oPopUp:AddItem( oItem )
   if Yprocad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

	oItem :=MenuItem( "Representantes", {|| RepresentanteInclusao() })
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

   oItem :=MenuItem( "&Estado/ICMS", {|| UfInclusao() })
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
	
	oItem :=MenuItem( "Cep", {|| CepInclusao() })
   oPopUp:AddItem( oItem )
   if Yembcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endif

*=============================================================================================================================*
* ALTERACAO
*=============================================================================================================================*

   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Alteracao", oPopUp, ,) )

   oItem := MenuItem( "&Clientes" , {|| ClientesDbedit() } ,101)
   oPopUp:AddItem( oItem )
   if Yclicad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Fornecedores" ,{|| nil })
   oPopUp:AddItem( oItem )
   if Yforcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Merc./Suprimento" ,{|| Alert("merc.suprim...()") })
   oPopUp:AddItem( oItem )
   if Ymercad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Produtos" ,{|| Alert("Produtos()") })
   oPopUp:AddItem( oItem )
   if Yprocad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

   oItem :=MenuItem( "Representantes", {|| RepresentanteInclusao(true) })
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

   oItem :=MenuItem( "&Estado/ICMS", {|| UfDbEdit() })
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
   endif
	
	oItem :=MenuItem( "Cep", {|| CepInclusao(true) })
   oPopUp:AddItem( oItem )
   if Yembcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endif	

*=============================================================================================================================*
* CONSULTA
*=============================================================================================================================*

   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Consulta", oPopUp, ,) )

   oItem := MenuItem( "&Clientes" , {|| ClientesDbedit() } ,101)
   oPopUp:AddItem( oItem )
   if Yclicad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Fornecedores" ,{|| nil })
   oPopUp:AddItem( oItem )
   if Yforcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Merc./Suprimento" ,{|| Alert("merc.suprim...()") })
   oPopUp:AddItem( oItem )
   if Ymercad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Produtos" ,{|| Alert("Produtos()") })
   oPopUp:AddItem( oItem )
   if Yprocad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )

   oItem :=MenuItem( "Representantes", {|| RepresentanteInclusao(true) })
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

   oItem :=MenuItem( "&Estado/ICMS", {|| UfDbEdit() })
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

*=============================================================================================================================*
* IMPRESSAO
*=============================================================================================================================*

   oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Impressao", oPopUp, ,) )

   oItem := MenuItem( "&Clientes" , {|| LstCli() } ,101)
   oPopUp:AddItem( oItem )
   if Yclicad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Fornecedores" ,{|| nil })
   oPopUp:AddItem( oItem )
   if Yforcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Merc./Suprimento" ,{|| Alert("merc.suprim...()") })
   oPopUp:AddItem( oItem )
   if Ymercad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endi

   oItem :=MenuItem( "&Produtos" ,{|| Alert("Produtos()") })
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

   oItem :=MenuItem( "&Estado/ICMS", {|| UfDbEdit() })
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
   endif
	
	oItem :=MenuItem( "Cep", {|| CepPrint() })
   oPopUp:AddItem( oItem )
   if Yembcad = 'B'
      oItem:Enabled := .f.
   else
      oItem:Enabled := .T.
   endif


// VENDAS

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

           oItem_L4 := MenuItem( "&Estoque Representantes", {|| RepresentanteInclusao() })
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


	// Ambiente
	oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Ambiente", oPopUp, ,) )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Cor fundo", {|| SetaCor(3) })
      oPopUp:AddItem( oItem )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Pano Fundo", {||xSetaPano()})
      oPopUp:AddItem( oItem )
		
		oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Cor Alerta", {|| SetaCor(8) })
      oPopUp:AddItem( oItem )
		
		oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Cor Cabecalho", {|| SetaCor(2) })
      oPopUp:AddItem( oItem )

// Manutencao
	oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Manutencao", oPopUp, ,) )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Reindexar banco de dados", {|| xReindexar()})
      oPopUp:AddItem( oItem )

*----------
*SOBRE
*----------	
	oPopUp  := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem(MenuItem( "&Sobre", oPopUp,,))
	
	   oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Sobre o sistema", {|| xInfo() })
      oPopUp:AddItem( oItem )
	
	
   return ( oTopBar )
endef

def xReindexar()
	LOCAL cScreen := SaveScreen()
	oMenu:Limpa()
	if MenuIndice()
		CriaIndice()
		UsaArquivo()
	endif
	return(restela(cScreen))	
endef	

def SetaCor(nCor)
*****************
	oMenu:Limpa()
	oMenu:Setacor(nCor)
	SalvaMem()
	oMenu:Limpa()
	break
endef

def xSetaPano()
********************
	oMenu:Limpa()
	oMenu:SetaPano()
	SalvaMem()
	oMenu:Limpa()
	break
endef

def Rodape()
*****************
	Date := Date()
   DTF  := Date()
   nRow := MaxRow()

   nSetColor(31)
	Write(nRow, 00, Space(MaxCol()),31)
   Write(nRow,00, logfan + ':' + Alltrim(oMenu:Usuario ))
   Write(nRow,20, "|")
   Write(nRow,22, Date())
   Write(nRow,33, '|')
   Showtime(nRow, 35, false, "w+/b", false, false )
   Write(nRow,44, '|')
   Write(nRow,46, 'Terminal:' + oMenu:Terminal)
   Write(nRow,60, '|')
   Write(nRow,62, oMenu:Comp)
   Write(nRow,75, '|')
   Write(nRow,77, oMenu:Unidade)
   return nil


def Encerra(nResult)
	ErrorBeep()
	nResult := 999
	FechaTudo()
	FChDir( oAmbiente:xBase )
	SalvaMem()

	oIni:Close()
	//oSci:Close()

	F_Fim( "Fenix for Windows" + " " + "v1.0" )
	SetMode(oAmbiente:AlturaFonteDefaultWindows, oAmbiente:LarguraFonteDefaultWindows)
	Cls
	DevPos( 24, 0 )
	return( __Quit())
endef


def F_Fim( Texto )
***********************
	LOCAL cMicrobras := oAmbiente:xProgramador
				  Texto := Iif( Texto = NIL, "MICROBRAS", Texto )

	SetColor("")
	Cls
	Alert( Texto + ";;Copyright (C)1992," + Str(Year(Date()),4) + ";" + cMicrobras + ";;Todos Direitos;Reservados", "W+/G")
	return
endef


def SetaIni()
	oMenu:Frame 				 := oIni:ReadString( oAmbiente:xUsuario,  'frame',         oAmbiente:Frame )
	oMenu:PanoFundo			 := oIni:ReadString( oAmbiente:xUsuario,  'panofundo',     oAmbiente:PanoFundo )
	oMenu:CorMenu				 := oIni:ReadInteger( oAmbiente:xUsuario, 'cormenu',       oAmbiente:CorMenu )
   oMenu:CorBarraMenu	    := oIni:ReadInteger( oAmbiente:xUsuario, 'corbarramenu',  oAmbiente:CorBarraMenu )
	oMenu:CorMsg				 := oIni:ReadInteger( oAmbiente:xUsuario, 'cormsg',        oAmbiente:CorMsg )
	oMenu:CorFundo 			 := oIni:ReadInteger( oAmbiente:xUsuario, 'corfundo',      oAmbiente:Corfundo )
	oMenu:CorCabec 			 := oIni:ReadInteger( oAmbiente:xUsuario, 'corcabec',      oAmbiente:CorCabec )
	oMenu:CorDesativada		 := oIni:ReadInteger( oAmbiente:xUsuario, 'cordesativada', oAmbiente:CorDesativada )
	oMenu:CorBox				 := oIni:ReadInteger( oAmbiente:xUsuario, 'corbox',        oAmbiente:CorBox )
	oMenu:CorCima				 := oIni:ReadInteger( oAmbiente:xUsuario, 'corcima',       oAmbiente:CorCima )
	oMenu:Selecionado 		 := oIni:ReadInteger( oAmbiente:xUsuario, 'selecionado',   oAmbiente:Selecionado )
	oMenu:CorAntiga			 := oIni:ReadInteger( oAmbiente:xUsuario, 'corantiga',     oAmbiente:CorAntiga )
	oMenu:CorBorda 			 := oIni:ReadInteger( oAmbiente:xUsuario, 'corborda',      oAmbiente:CorBorda )
	oMenu:CorAlerta			 := oIni:ReadInteger( oAmbiente:xUsuario, 'coralerta',     oAmbiente:CorAlerta )
	oMenu:Fonte 				 := oIni:ReadInteger( oAmbiente:xUsuario, 'fonte',         oAmbiente:Fonte )
	oMenu:FonteManualAltura  := oIni:ReadInteger( oAmbiente:xUsuario, 'FonteManualAltura', oAmbiente:FonteManualAltura )
	oMenu:FonteManualLargura := oIni:ReadInteger( oAmbiente:xUsuario, 'FonteManualLargura', oAmbiente:FonteManualLargura )
	oMenu:Sombra		 		 := oIni:ReadBool( oAmbiente:xUsuario,	  'sombra',        oAmbiente:Sombra )
   oMenu:lManterPosicaoMenuVertical := oIni:ReadBool('sistema','manterposicaomenuvertical')
	oMenu:CorLightBar        := oIni:ReadInteger( oAmbiente:xUsuario, 'CorLightBar',   oAmbiente:CorLightBar )
	oMenu:CorHotKey          := oIni:ReadInteger( oAmbiente:xUsuario, 'CorHotKey',     oAmbiente:CorHotKey )
	oMenu:CorHKLightBar      := oIni:ReadInteger( oAmbiente:xUsuario, 'CorHKLightBar', oAmbiente:CorHKLightBar)
	oMenu:SetaSombra()

	oAmbiente:Get_Ativo           := oIni:ReadBool( oAmbiente:xUsuario,    'get_ativo',     oAmbiente:Get_Ativo )
	oAmbiente:Mostrar_Desativados := oIni:ReadBool( "sistema",'Mostrar_Desativados', oAmbiente:Mostrar_Desativados )
	oAmbiente:Mostrar_Recibo      := oIni:ReadBool( "sistema",'Mostrar_Recibo', oAmbiente:Mostrar_Recibo )
	oAmbiente:Frame               := oMenu:Frame
	oAmbiente:PanoFundo     		:= oMenu:PanoFundo
	oAmbiente:CorMenu 	      	:= oMenu:CorMenu
   oAmbiente:CorBarraMenu 	     	:= oMenu:CorBarraMenu
	oAmbiente:CorLightBar         := oMenu:CorLightBar
	oAmbiente:CorHotKey           := oMenu:CorHotKey
	oAmbiente:CorHKLightBar       := oMenu:CorHKLightBar
	oAmbiente:CorMsg			      := oMenu:CorMsg
	oAmbiente:CorFundo		      := oMenu:CorFundo
	oAmbiente:CorCabec		      := oMenu:CorCabec
	oAmbiente:CorDesativada       := oMenu:CorDesativada
	oAmbiente:CorBox			      := oMenu:CorBox
	oAmbiente:CorCima 		      := oMenu:CorCima
	oAmbiente:Selecionado	      := oMenu:Selecionado
	oAmbiente:CorAntiga		      := oMenu:CorAntiga
	oAmbiente:CorBorda		      := oMenu:CorBorda
	oAmbiente:CorAlerta		      := oMenu:CorAlerta
	oAmbiente:Fonte			      := oMenu:Fonte
	oAmbiente:FonteManualAltura   := oMenu:FonteManualAltura
	oAmbiente:FonteManualLargura  := oMenu:FonteManualLargura
	oAmbiente:Sombra			      := oMenu:Sombra
   oAmbiente:lManterPosicaoMenuVertical := oMenu:lManterPosicaoMenuVertical
	IF oAmbiente:Fonte > 1
		Eval( oAmbiente:TabelaFonte[ oAmbiente:Fonte] )
	EndIF
	return( NIL)
endef

def SalvaMem()
	oIni:WriteString(  oAmbiente:xUsuario,	'frame',         oMenu:Frame )
	oIni:WriteString(  oAmbiente:xUsuario,	'panofundo',     oMenu:PanoFundo )
	oIni:WriteInteger( oAmbiente:xUsuario, 'selecionado',   oMenu:Selecionado )
	oIni:WriteInteger( oAmbiente:xUsuario, 'cormenu',       oMenu:CorMenu )
   oIni:WriteInteger( oAmbiente:xUsuario, 'corbarramenu',  oMenu:CorBarraMenu )
	oIni:WriteInteger( oAmbiente:xUsuario, 'CorLightBar',   oMenu:CorLightBar )
	oIni:WriteInteger( oAmbiente:xUsuario, 'CorHotKey',     oMenu:CorHotKey )
	oIni:WriteInteger( oAmbiente:xUsuario, 'CorHKLightBar', oMenu:CorHKLightBar)
	oIni:WriteInteger( oAmbiente:xUsuario, 'corfundo',      oMenu:Corfundo )
	oIni:WriteInteger( oAmbiente:xUsuario, 'corcabec',      oMenu:CorCabec )
	oIni:WriteInteger( oAmbiente:xUsuario, 'cordesativada', oMenu:CorDesativada )
	oIni:WriteInteger( oAmbiente:xUsuario, 'corbox',        oMenu:CorBox )
	oIni:WriteInteger( oAmbiente:xUsuario, 'corcima',       oMenu:CorCima )
	oIni:WriteInteger( oAmbiente:xUsuario, 'corantiga',     oMenu:CorAntiga )
	oIni:WriteInteger( oAmbiente:xUsuario, 'corborda',      oMenu:CorBorda )
	oIni:WriteInteger( oAmbiente:xUsuario, 'fonte',         oMenu:Fonte )
	oIni:WriteInteger( oAmbiente:xUsuario, 'fonte',         oMenu:Fonte )
	oIni:WriteInteger( oAmbiente:xUsuario, 'FonteManualAltura', oMenu:FonteManualAltura )
	oIni:WriteInteger( oAmbiente:xUsuario, 'FonteManualLargura', oMenu:FonteManualLargura )
	oIni:WriteInteger( oAmbiente:xUsuario, 'coralerta',     oAmbiente:CorAlerta )
	oIni:WriteInteger( oAmbiente:xUsuario, 'cormsg',        oAmbiente:CorMsg )
	oIni:WriteBool(    oAmbiente:xUsuario, 'sombra',        oMenu:Sombra )
	oIni:WriteBool(    oAmbiente:xUsuario, 'get_ativo',     oAmbiente:Get_Ativo )
	//oAmbiente:ShowVar(true, nil, true)
	SetaIni()
	return NIL
endef

def SetaAmbiente()
	set key -41 to
   SET CENT ON
   SET( _SET_EVENTMASK, INKEY_ALL )
   SetBlink(.f.)
   mSetCursor(.T.)
	Set Conf Off
	Set Bell On
	Set Scor Off
	Set Wrap On
	Set Dele On
	Set Date Brit
	Set Deci To 2
	Set Print To
	Set Fixed On
	SetCancel( .F. )
	//SetMode(28,132)
	return nil
endef

def login()
***********
	LOCAL cScreen   := SaveScreen()
	LOCAL R         := Space(1)
	LOCAL cLogin    := Space(15)
	LOCAL cPassword := Space(6)
	LOCAL SNA       := "168935"
	memvar cLpt1
	memvar cLpt2
	memvar cLpt3
	memvar cLpd1
	memvar cLpd2
	memvar cLpd3
	memvar cLpd4
	memvar cLpd5
	memvar cLpd6
	memvar cLpd7
	memvar cLpd8
	memvar cLpd9


	Area("usuario")
	while true
		MaBox(09, 21, 14, 50, "LOGIN")
		@ 11,23 say 'Usuario..:' get cLogin    pict "@!" valid UsuarioErrado( @cLogin )
		@ 12,23 say 'Senha....:' get cPassword pict "@S" valid SenhaErrada( cLogin, cPassword )
		read
		if lastkey() = ESC
			ErrorBeep()
			if conf("Pergunta: Deseja encerrar?")
				Encerra()
			end
			loop
		end
      Log           			:= cLogin
      Sha          		 	:= Sna
		LogFan        			:= Usuario->CodUsu
		nMuser        			:= Usuario->Fantazia
		oMenu:Usuario 			:= Usuario->Fantazia
		oAmbiente:xUsuario	:= Usuario->Fantazia
      cLpt1 := "06"
      cLpt2 := "06"
      cLpt3 := "06"
      cLpd1 := "06"
      cLpd2 := "06"
      cLpd3 := "06"
      cLpd4 := "06"
      cLpd5 := "06"
      cLpd6 := "06"
      cLpd7 := "06"
      cLpd8 := "06"
      cLpd9 := "06"
		Ctr_User()

		Area("desc")
		Descto := Desc

		Area("cadprod") // oMenu:aDbfs[11])
		CadProd->(DbGoTop())

		if CadProd->(TravaArq())
			Mensagem("Aguarde, Atualizando valores")
         while Cadprod->(!Eof())
				desc_t         := 0
				des_prc        := 0
				vpreco         := 0
				desc_t         := 100-descto
				des_prc        := desc_t/100
				vpreco         := precopl/des_prc
				CadProd->Preco := vPreco
				CadProd->(DbSkip(1))
			end
		end
		CadProd->(Libera())
		ResTela( cScreen )
		return nil
	enddo
endef	

def UsuarioErrado( cNome )
******************************
	LOCAL aRotinaInclusao  := {{||CadUser() }}
	LOCAL aRotinaAlteracao := NIL // {{||AltSenha() }}
	LOCAL cScreen	        := SaveScreen()
	LOCAL Arq_Ant          := Alias()
	LOCAL Ind_Ant          := IndexOrd()

	Area("usuario")
	( Usuario->(Order( USUARIO_FANTAZIA )), Usuario->(DbGoTop()))
	IF Usuario->(Eof()) .OR. Usuario->(!DbSeek("ADMIN"))
		GravaSenhaAdmin(OK)
	Else
		IF Empty(Usuario->Senha)
			GravaSenhaAdmin(FALSO)
		EndIF
	EndIF

	IF Usuario->(!DbSeek( cNome ))
		Usuario->(Escolhe( 00, 00, MaxRow(), "Fantazia", "USUARIO", aRotinaInclusao, NIL, aRotinaAlteracao, NIL, NIL, NIL ))
		cNome := Usuario->Fantazia
	EndIF

	AreaAnt( Arq_Ant, Ind_Ant )
	return( OK )
endef

def SenhaErrada(cLogin, cPassWord)
	LOCAL cSenha  := Usuario->( AllTrim( Senha ))
	LOCAL Passe   := cPassword

	if !Empty( Passe) .AND. cSenha == Passe
		return true
	endif
	cPassword := Space(6)
	ErrorBeep()
	Alert("ERRO: Senha nao confere.")
	return false
endef

def GravaSenhaAdmin(lIncluirOuAlterar)
	LOCAL Arq_Ant := Alias()
	LOCAL Ind_Ant := IndexOrd()
	LOCAL lDone   := FALSO
	LOCAL cPasse
	LOCAL cSim

	Area("Usuario")
	(Usuario->(Order( USUARIO_NOME )), Usuario->(DbGoTop()))

	if lIncluirOuAlterar              // Incluir
		lDone := Usuario->(Incluiu())
	else
		lDone := Usuario->(TravaReg())
	endif

	while lDone
		cPasse			 	:= MSEncrypt("280966")
		cSim				 	:= MSEncrypt("S")
		Usuario->CodUsu   := StrZero(Usuario->Id, 4)
		Usuario->Fantazia := "ADMIN"
		Usuario->Senha  	:= cPasse
		Usuario->DtCad  	:= Date()
		lDone 				:= FALSO
	EndDo
	Usuario->(Libera())
	AreaAnt( Arq_Ant, Ind_Ant )
	return lDone
endef

def UsuarioCerto( cNome )
	LOCAL Arq_Ant := Alias()
	LOCAL Ind_Ant := IndexOrd()

	Area("usuario")
	Usuario->(Order( USUARIO_NOME ))
	Usuario->(DbGoTop())
	IF Usuario->(Eof())
		GravaSenhaAdmin(OK)
	EndIF
	Return( OK )
endef

def AbreUsuario()
	Return( UsaArquivo("usuario") )
endef

def ErrorSys()
*--------------*
	Private ErrorSys := 9876543210
	ErrorBlock( {|Erro| MacroErro(Erro)} )
	return
endef 

def MacroErro(e)
*********************
	LOCAL cScreen	 := SaveScreen()
	LOCAL cPrograma := ms_swap_extensao("fenix", ".err")
   LOCAL cDbf
	LOCAL cmens
	LOCAL i
	LOCAL cmessage
	LOCAL aoptions
	LOCAL nchoice
	LOCAL errodos
	LOCAL ab
	LOCAL abdes
	LOCAL abexp
	LOCAL abacao
	LOCAL abacao1
	LOCAL adbf
	LOCAL adbfdes
	LOCAL adbfexp
	LOCAL adbfacao
	LOCAL adbfacao1

	cmens 	 := ""
	errodos	 := {}
	ab 		 := {}
	abdes 	 := {}
	abexp 	 := {}
	abacao	 := {}
	abacao1	 := {}
	adbf		 := {}
	adbfdes	 := {}
	adbfexp	 := {}
	adbfacao  := {}
	adbfacao1 := {}

	if (e:gencode() == 5)
		return 0
	endif
	if (e:gencode() == 21 .AND. e:oscode() == 32 .AND. e:candefault())
		neterr( true )
		return false
	EndIf
	if (e:gencode() == 40 .AND. e:candefault())
		neterr( true )
		return false
	endif

	AAdd(ab, 1002)
	AAdd(abdes, "ALIAS NAO EXISTE.")
	AAdd(abexp, "O ALIAS ESPECIFICADO NAO ASSOCIADO COM A AREA DE TRABALHO ATUAL.")
	AAdd(abacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(abacao1, "")
	AAdd(ab, 1003)
	AAdd(abdes, "VARIAVEL NAO EXISTE.")
	AAdd(abexp, "A VARIAVEL ESPECIFICADA NAO EXISTE OU NAO E VISIVEL.")
	AAdd(abacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(abacao1, "")
	AAdd(ab, 1004)
	AAdd(abdes, "VARIAVEL NAO EXISTE.")
	AAdd(abexp, "A VARIAVEL ESPECIFICADA NAO EXISTE OU NAO E VISIVEL.")
	AAdd(abacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(abacao1, "")
	AAdd(ab, 2006)
	AAdd(abdes,   "ERRO DE GRAVACAO/CRIACAO DE ARQUIVO.")
	AAdd(abexp,   "O ARQUIVO ESPECIFICADO NAO PODE SER GRAVADO/CRIADO.")
	AAdd(abacao,  "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(abacao1, "EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(ab, 5300)
	AAdd(abdes, "MEMORIA BAIXA.")
	AAdd(abexp, "MEMORIA DISPONIVEL INSUFICIENTE PARA RODAR O APLICATIVO.")
	AAdd(abacao, "LIBERE MAIS MEMORIA CONVENCIONAL VERIFICANDO OS ARQUIVOS")
	AAdd(abacao1, "CONFIG.SYS E AUTOEXEC.BAT.")

	AAdd(adbf, 1001)
	AAdd(adbfdes, "ERRO DE ABERTURA DO ARQUIVO ESPECIFICADO.")
	AAdd(adbfexp, "O ARQUIVO ESPECIFICADO NAO PODE SER ABERTO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(adbfacao1, "EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(adbf, 1003)
	AAdd(adbfdes, "ERRO DE ABERTURA DO ARQUIVO ESPECIFICADO.")
	AAdd(adbfexp, "O ARQUIVO ESPECIFICADO NAO PODE SER ABERTO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(adbfacao1, "EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(adbf, 1004)
	AAdd(adbfdes, "ERRO DE CRIACAO DE ARQUIVO.")
	AAdd(adbfexp, "O ARQUIVO ESPECIFICADO NAO PODE SER CRIADO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(adbfacao1, "EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(adbf, 1006)
	AAdd(adbfdes, "ERRO DE CRIACAO DE ARQUIVO.")
	AAdd(adbfexp, "O ARQUIVO ESPECIFICADO NAO PODE SER CRIADO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(adbfacao1,"EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(adbf, 1010)
	AAdd(adbfdes, "ERRO DE LEITURA DE ARQUIVO.")
	AAdd(adbfexp, "UM ERRO DE LEITURA OCORREU NO ARQUIVO ESPECIFICADO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE, OU SE")
	AAdd(adbfacao1, "O ARQUIVO NAO ESTA TRUNCADO.")
	AAdd(adbf, 1011)
	AAdd(adbfdes, "ERRO DE GRAVACAO DE ARQUIVO.")
	AAdd(adbfexp, "UM ERRO DE GRAVACAO OCORREU NO ARQUIVO ESPECIFICADO.")
	AAdd(adbfacao, "VERIFIQUE SEUS DIREITOS EM AMBIENTE DE REDE. ESPACO")
	AAdd(adbfacao1, "EM DISCO, OU SE O ARQUIVO ESTA ATRIBUIDO PARA SOMENTE LEITURA.")
	AAdd(adbf, 1012)
	AAdd(adbfdes, "CORRUPCAO DE ARQUIVOS DETECTADA.")
	AAdd(adbfexp, "OS ARQUIVOS DE DADOS .DBF E/OU INDICES .NTX ESTAO CORROMPIDOS.")
	AAdd(adbfacao, "APAGUE OS ARQUIVOS COM EXTENSAO .NTX E TENTE NOVAMENTE.")
	AAdd(adbfacao1, "")
	AAdd(adbf, 1020)
	AAdd(adbfdes, "ERRO DE TIPO DE DADO.")
	AAdd(adbfexp, "OS TIPOS DE DADOS SAO IMCOMPATIVEIS.")
	AAdd(adbfacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(adbfacao1, "")
	AAdd(adbf, 1021)
	AAdd(adbfdes, "ERRO DE TAMANHO DE DADO.")
	AAdd(adbfexp, "O TAMANHO DE DADO EH MAIOR QUE O CAMPO.")
	AAdd(adbfacao, "VERIFIQUE DATAS DE VCTO, EMISSAO E OU CALCULOS MUITO ")
	AAdd(adbfacao1, "GRANDES.")
	AAdd(adbf, 1022)
	AAdd(adbfdes, "TRAVAMENTO DE ARQUIVO REQUERIDO.")
	AAdd(adbfexp, "TENTATIVA DE ALTERAR UM REGISTRO SEM PRIMEIRO OBTER TRAVAMENTO.")
	AAdd(adbfacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(adbfacao1, "")
	AAdd(adbf, 1023)
	AAdd(adbfdes, "O ARQUIVO REQUER ABERTURA EXCLUSIVA")
	AAdd(adbfexp, "O INICIO DA OPERACAO REQUER ABERTURA DE ARQUIVO EXCLUSIVA.")
	AAdd(adbfacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(adbfacao1, "")
	AAdd(adbf, 1027)
	AAdd(adbfdes, "LIMITE EXCEDIDO.")
	AAdd(adbfexp, "MUITOS ARQUIVOS DE INDICES ESTAO ABERTOS NA AREA CORRENTE.")
	AAdd(adbfacao, "ENTRE EM CONTATO COM O SUPORTE TECNICO.")
	AAdd(adbfacao1, "")

	nsubcode    := e:subcode()
	csystem	   := e:subsystem()
	cexplanacao := ""
	cacao 	   := ""
	cacao1	   := ""
	nPos		   := 0

	If (csystem = "BASE")
		npos:= ascan(ab, nsubcode)
		If (npos != 0)
			e:description := abdes[npos]
			cExplanacao   := abexp[npos]
			cAcao 		  := abacao[npos]
			cAcao1		  := abacao1[npos]
		EndIf
	ElseIf (csystem = "DBFNTX")
		npos:= ascan(adbf, nsubcode)
		If (npos != 0)
			e:description := adbfdes[npos]
			cExplanacao   := adbfexp[npos]
			cAcao 		  := adbfacao[npos]
			cAcao1		  := adbfacao1[npos]
		EndIf
	ElseIf (csystem = "SIXNSX")
		npos:= ascan(adbf, nsubcode)
		If (npos != 0)
			e:description := adbfdes[npos]
			cExplanacao   := adbfexp[npos]
			cAcao 		  := adbfacao[npos]
			cAcao1		  := adbfacao1[npos]
		EndIf
   ElseIf (csystem = "SIXCDX")
		npos:= ascan(adbf, nsubcode)
		If (npos != 0)
			e:description := adbfdes[npos]
			cExplanacao   := adbfexp[npos]
			cAcao 		  := adbfacao[npos]
			cAcao1		  := adbfacao1[npos]
		EndIf
	ElseIf ( csystem = "TERM")
		if e:oscode() != 3
			IF LptOk()
				Return( OK )
			EndIF
			Set Devi To Screen
			Set Prin Off
			Set Cons On
			Set Print to
			Break
		endif
	EndIf

	If (e:oscode() = 4)
		e:description := "IMPOSSIVEL ABRIR MAIS ARQUIVOS."
		cExplanacao   := "O LIMITE DE ABERTURA DE ARQUIVOS FOI EXCEDIDO."
		cAcao 		  := "INCREMENTE FILES NO CONFIG.SYS OU FILE HANDLES"
		cAcao1		  := "NO ARQUIVO SHELL.CFG SE EM AMBIENTE DE REDE."
	EndIf
	IF nPos = 0
		cExplanacao := "ERRO NAO DOCUMENTADO."
		cAcao 	   := "IMPRIMA ESTA TELA. E ENTRE EM CONTATO COM O"
		cAcao1	   := "SUPORTE TECNICO ATRAVES DO TEL (69)3451.3085 ou VCATAFESTA@GMAIL.COM"
	EndIF

   /*
	if nSubCode = 1003
		FChDir( oAmbiente:xRoot )

		Set Date British
		Set Console Off
		FClose( cPrograma )
      if !ms_swap_File( cPrograma )
			cHandle := Fcreate( cPrograma, FC_NORMAL )
			FClose( cHandle )
		endif
		cHandle := FOpen( cPrograma, FO_READWRITE + FO_SHARED )
		IF ( Ferror() != 0 )
			FClose( cHandle )
			SetColor("")
			Cls
			Alert( "Erro #3: Erro de Abertura " + cPrograma + ". Erro DOS " + Str( Ferror(),3))
			Break(e)
			//FlReset()
			Quit
		EndIF
		FBot( cHandle )
		FWriteLine( cHandle, Replicate("=", 80))
		FWriteLine( cHandle, "Usuario   : " + oAmbiente:xUsuario )
		FWriteLine( cHandle, "Data      : " + DToC(Date()))
		FWriteLine( cHandle, "Horas     : " + Time())
		FWriteLine( cHandle, "SubSystem : " + csystem )
		FWriteLine( cHandle, "SubCode   : " + Str(nsubcode, 4))
		FWriteLine( cHandle, "Variavel  : " + e:operation )
		FWriteLine( cHandle, "Arquivo   : " + e:filename )
		FWriteLine( cHandle, "Area      : " + Alias())
		FWriteLine( cHandle, "Indice    : " + IndexKey( IndexOrd()))
		FWriteLine( cHandle, "Descricao : " + e:description )
		FWriteLine( cHandle, "Explanacao: " + cexplanacao )
		FWriteLine( cHandle, "Acao      : " + cAcao )
		FWriteLine( cHandle, "Acao      : " + cAcao1 )
		FWriteLine( cHandle, Replicate("-", 80))
		FWriteLine( cHandle, "PILHA DE CARGA" )
		nCol := 0
		i	  := 2
		nX   := 0
		Do While (!Empty(ProcName(i)))
			nCol++
			nX++
			FWriteLine( cHandle, Space(16) + "Linha : " + strzero(procline(i), 6) + "    Proc : " + ProcName(i))
			i++
		EndDo
		FWriteLine( cHandle, Replicate("=", 80))
		Fclose( cHandle )
		Set Console On
		FChDir( oAmbiente:xRoot )
		// Break(e)
	EndIF
   */

	SetColor("")
	Cls
	if nSubCode = 1012
      cDbf := e:FileName()
		if !Empty(cDbf)
			ErrorBeep()
			if Conf("O arquivo " + AllTrim(cDbf) + " corrompeu. Criar um novo ?")
				cTemp := StrTran( cDbf, ".dbf") + ".old"
				Ferase( cTemp )
				if msrename(cDbf, cTemp) == 0
					if CriaArquivo(ms_remove_path(cDbf))
						Ferase(ms_remove_path(cDbf) + CEXT)
						Cls
						ErrorBeep()
						Mensagem("Informa: Arquivo " + cDbf + " criado com sucesso.;-; Encerrando... Execute novamente o Sistema.")
						FChDir( oAmbiente:xRoot )
                  SetColor("")
                  SetPos(maxrow(),0)
                  ? "Macrosoft for Linux terminate!"
						Break( e )
						Quit
					endif
				else
					AlertaPy("Erro: Impossivel consertar o arquivo.; Erro# " + StrTrim(Ferror()))
				endif
			else
            FChDir( oAmbiente:xRoot )
            Encerra()
         endif
		endif
	endif

	Set Devi To Screen
	Set Prin Off
	Set Cons On
	Set Print to
	Set Color To Gr+/b
	@ 0, 0 Clear To  9, MaxCol()
	@ 0, 0 To	9, MaxCol() Color "Gr+/b"
	@ 1, 1  Say "SubSystem : "
	@ 1, 35 Say "SubCode : "
	@ 2, 1  Say "OsCode    : "
	@ 2, 35 Say "GenCode : "
	@ 3, 1  Say "Variavel  : "
	@ 3, 35 Say "Arquivo : "
	@ 4, 1  Say "Area      : "
	@ 4, 35 Say "Indice  : "

	@ 5, 1 Say "Descri‡ao : "
	@ 6, 1 Say "Explana‡ao: "
	@ 7, 1 Say "A‡ao      : "

	@ 1, 14 Say csystem             				Color "W+/B"
	@ 1, 45 Say Str(nsubcode, 4)    				Color "W+/B"

	@ 2, 14 Say Alltrim(Str(e:oscode(), 4)) 	Color "W+/B"
	@ 2, 45 Say AllTrim(Str(e:gencode(), 4)) 	Color "W+/B"

	@ 3, 14 Say e:operation()       				Color "W+/B"
	@ 3, 45 Say Upper(e:filename()) 				Color "W+/B"

	@ 4, 14 Say Alias()             				Color "W+/B"
	@ 4, 45 Say Upper(IndexKey(IndexOrd())) 	Color "W+/B"

	@ 5, 14 Say e:description 						Color "W+/B"
	@ 6, 14 Say cexplanacao 						Color "W+/B"
	@ 7, 14 Say cacao 								Color "R/B"
	@ 8, 14 Say cacao1 								Color "R/B"

	ncol := 16
	Set Color To Gr+/b
	@ ncol, 0 Clear To 23, MaxCol()
	@ ncol, 0		 To 23, MaxCol() Color "Gr+/b"
	@ ncol, 12 Say "PILHA DE CARGA" Color "W+/B"

	i	:= 2
	nx := 0
	ncol ++
	nRow := 00
	Do While (!Empty( ProcName(i)))
		nx++
		@ ncol, nRow+01 Say "[" + StrZero( i, 2 )   + "]:"        Color "W+/B"
		@ ncol, nRow+06 Say "[" + strzero(procline(i), 6) + "]:"  Color "GR+/B"
		@ ncol, nRow+16 Say ProcName(i)								    Color "W+/B"
		i++
		nCol++
		IF nCol >= 23
			nCol := 17
			nRow += 40
		EndIF
	EndDo

	cmessage := "Escolha uma opcao abaixo."
	aoptions := {"Encerrar"}
	If (e:canretry())
		AAdd(aoptions, "Tentar")
	EndIf
	If (e:candefault())
		AAdd(aoptions, "Default")
	EndIf

	nchoice:= 0
	Do While (nchoice == 0)
		nchoice:= alert(cmessage, aoptions)
		If (!Empty(nchoice))
			If (aoptions[nchoice] == "Encerrar")
				nopcao:= alert("Pergunta: Imprimir resultado para ?", {"Nenhum", "Impressora"})
				if (nopcao == 2)
					If (instru80() .AND. lptok())
						printon()
						setprc(0, 0)
						Qout(Replicate("=", 80))
						@	02,  01 Say "SubSystem : " + csystem
						@	03,  01 Say "SubCode   : " + Str(nsubcode, 4)
						@	04,  01 Say "Variavel  : " + e:operation()
						@	05,  01 Say "Arquivo   : " + e:filename()
						@	06,  01 Say "Area      : " + Alias()
						@	07,  01 Say "Descricao : " + e:description
						@	08,  01 Say "Explanacao: " + cexplanacao
						@	09,  01 Say "Acao      : " + cacao
						@	10,  13 Say cacao1
						Qout( Replicate("-", 80))
						ncol := 12
						@ ncol,	6 Say "[Pilha de Carga]"
						i := 2
						nx := 0
						Do While (!Empty(ProcName(i)))
							nCol++
							nX++
							@ nCol, 01 Say StrZero(nX, 2) +")Proc:"
							@ nCol, 09 Say ProcName(i) Color "W+/B"
							@ nCol, 20 Say "Linha:"
							@ nCol, 26 Say strzero(procline(i), 6) Color "W+/B"
							i++
						EndDo
						Qout(Replicate("=", 80))
						Eject
						PrintOff()
					EndIf
				EndIF
				FChDir( oAmbiente:xRoot )
				Set Date British
				Set Console Off
				FClose( cPrograma )
            if !ms_swap_File( cPrograma )
					cHandle := Fcreate( cPrograma, FC_NORMAL )
					FClose( cHandle )
				EndIF
				cHandle := FOpen( cPrograma, FO_READWRITE + FO_SHARED )
				IF ( Ferror() != 0 )
					FClose( cHandle )
					SetColor("")
					Cls
					Alert( "Erro #3: Erro de Abertura " + cPrograma + ". Erro DOS " + Str( Ferror(),3))
					Break(e)
					//FlReset()
					Quit
				EndIF
				FBot( cHandle )
				FWriteLine( cHandle, Replicate("=", 80))
				FWriteLine( cHandle, "Usuario  1: " + oAmbiente:xUsuario )
				FWriteLine( cHandle, "Data      : " + DToC(Date()))
				FWriteLine( cHandle, "Horas     : " + Time())
				FWriteLine( cHandle, "SubSystem : " + csystem )
				FWriteLine( cHandle, "SubCode   : " + Str(nsubcode, 4))
				FWriteLine( cHandle, "Variavel  : " + e:operation )
				FWriteLine( cHandle, "Arquivo   : " + e:filename )
				FWriteLine( cHandle, "Area      : " + Alias())
				FWriteLine( cHandle, "Indice    : " + IndexKey( IndexOrd()))
				FWriteLine( cHandle, "Descricao : " + e:description )
				FWriteLine( cHandle, "Explanacao: " + cexplanacao )
				FWriteLine( cHandle, "Acao      : " + cAcao )
				FWriteLine( cHandle, "Acao      : " + cAcao1 )
				FWriteLine( cHandle, Replicate("-", 80))
				FWriteLine( cHandle, "PILHA DE CARGA" )
				i	:= 2
				nX := 0
				Do While (!Empty(ProcName(i)))
					nCol++
					nX++
					FWriteLine( cHandle, Space(16) + "Linha : " + strzero(procline(i), 6) + "    Proc : " + ProcName(i))
					i++
				EndDo
				FWriteLine( cHandle, Replicate("=", 80))
				Fclose( cHandle )
				Set Console On
				SetColor("")
				Cls
				FChDir( oAmbiente:xRoot )
				Break(e)
				//FlReset()
				Quit
			ElseIf (aoptions[nchoice] == "Tentar")
				ResTela( cScreen )
				Return .T.
			ElseIf (aoptions[nchoice] == "Default")
				ResTela( cScreen )
				Return .F.
			EndIf
		EndIf
	EndDo
	Set Device To Screen
	Set Printer Off
	Break
	Return .T.
endef

def xinfo()
	oMenu:Limpa()
	oMenu:CorCabec := Roloc( oMenu:CorCabec )
	Info(2)
endef
	
def Info(nRow, lInkey)
*----------------------*
	LOCAL cScreen	  := SaveScreen( )
	LOCAL Drive 	  := Curdrive()
	LOCAL cDiretorio := FCurdir()
	LOCAL nMaxRow	  := MaxRow()
	LOCAL nMaxCol	  := MaxCol()-3
	LOCAL cSistema   := StrTran( oMenu:StatusSup, "MENU PRINCIPAL-","")
	LOCAL nRamLivre  := Memory(0)
   LOCAL aPrinter   := cupsGetDests()   
   LOCAL aMenu      := {}
   LOCAL nPr
	LOCAL nColor
	LOCAL Handle
	LOCAL xMicrobras
	LOCAL xEndereco
	LOCAL xTelefone
	LOCAL xCidade

	IfNil(nRow, 2)
	FChDir( oAmbiente:xRoot )	
	
	xMicrobras := ""
	xEndereco  := ""
	xTelefone  := ""
	xCidade	  := ""
	CenturyOn()

   oMenu:Limpa()
	oAmbiente:xProgramador := xMicrobras
	nRow                   := (nMaxRow-20)/2
	nSetColor( oMenu:CorMenu )

	MaBox( nRow,	 02, nRow+24, (nMaxCol+1))   
	Print( nRow+01, 03, "") ; printf(Padc(cSistema,   nMaxCol-2), AscanCor(clBrightGreen))
	Print( nRow+02, 03, "") ; printf(Padc(xMicrobras, nMaxCol-2), AscanCor(clBrightRed))
	Print( nRow+03, 03, "") ; printf(Padc(xEndereco,  nMaxCol-2), AscanCor(clBrightBlue))
	Print( nRow+04, 03, "") ; printf(Padc(xTelefone,  nMaxCol-2), AscanCor(clBrightCyan))
	
	aHost := GetIp()
	Print( nRow+06, 03, "S. Operacional : ") ; printf(Os(), AscanCor(clBrightYellow))
	Print( nRow+07, 03, "  Data Sistema : ") ; printf(Date(), AscanCor(clBrightGreen))
	Print( nRow+08, 03, "     Diretorio : ") ; printf(AllTrim(oAmbiente:xRoot), AscanCor(clBrightGreen))      
	Print( nRow+09, 03, "  Espaco Total : ") ; printf(AllTrim(Tran( FT_DskSize(Drive)/1024/1024/1024, "999,999")), AscanCor(clBrightCyan)) ; printf( " GB", AscanCor(clBrightGreen))
	Print( nRow+10, 03, "   Memoria RAM : ") ; printf(hb_ntos(Memory(HB_MEM_BLOCK)/1024), AscanCor(clBrightCyan)) ; printf( " GB", AscanCor(clBrightGreen))
	Print( nRow+11, 03, "   Mem Virtual : ") ; printf(hb_ntos(Memory(HB_MEM_VM)/1024),     AscanCor(clBrightCyan)) ; printf( " GB", AscanCor(clBrightGreen))
	Print( nRow+12, 03, "  Max Used Mem : ") ; printf(hb_ntos(Memory(HB_MEM_USEDMAX)/1024),     AscanCor(clBrightCyan)) ; printf( " KB", AscanCor(clBrightGreen))
	Print( nRow+13, 03, "  Arqs Abertos : ") //; printf(AllTrim(Str(NextHandle()-6,3)), AscanCor(clBrightGreen))
	Print( nRow+14, 03, "      Ano 2000 : ") ; printf(IF( oAmbiente:Ano2000, "Habilitado", "Desabilitado"), AscanCor(IF( oAmbiente:Ano2000,   clBrightGreen,clBrightRed)))
	//Print( nRow+15, 03, "    Base Dados : ") ; printf(IF( oProtege:Protegido,"Protegida",  "DesProtegida"), AscanCor(IF( oProtege:Protegido, clBrightGreen,clBrightRed))) 
	//Print( nRow+16, 03, " Print Spooler : " /*+ IF( IsQueue(), "Sim","Nao")*/)
	Print( nRow+17, 03, "Versao Harbour : ") ; printf(hb_Version(HB_VERSION_HARBOUR ), AscanCor(clBrightCyan))
	Print( nRow+18, 03, "  Compiler C++ : ") ; printf(hb_Version(HB_VERSION_COMPILER), AscanCor(clBrightCyan))
	//Print( nRow+19, 03, "   Versao Leto : ") ; printf(LETO_GETSERVERVERSION(), AscanCor(clBrightCyan))
	//Print( nRow+20, 03, "       Leto IP : ") ; printf(LETO_GETCURRENTCONNECTION(), AscanCor(clBrightCyan))
	Print( nRow+21, 03, "      IP Local : ") ; printf(StrGetIp(), AscanCor(clBrightCyan))
	
	Print( nRow+06, ((nMaxCol/2)-2), "   Nome Estacao : ") ; printf(AllTrim(Left(NetName(),20)), AscanCor(clBrightYellow))
	Print( nRow+07, ((nMaxCol/2)-2), "  Horas Sistema : " + Time())	
   Print( nRow+08, ((nMaxCol/2)-2), " Drive Corrente : ") ; printf(AllTrim(Drive), AscanCor(clBrightGreen))   	
	Print( nRow+09, ((nMaxCol/2)-2), "  Espaco Livre  : ") ; printf(AllTrim(Tran(ft_DskFree()/1024/1024/1024, "999,999")), AscanCor(clBrightCyan)) ; printf( " GB", AscanCor(clBrightGreen))
	Print( nRow+10, ((nMaxCol/2)-2), "  Mem RAM Livre : " + AllTrim(Str(nRamLivre/1024) + " GB"))
	IF nRamLivre < 100 // Pouca memoria
	Print( nRow+10, ((nMaxCol/2)-2), "  Mem RAM Livre : " + AllTrim(Str(nRamLivre/1024) + " GB"), Roloc(Cor()))
	EndIF
	Print( nRow+11, ((nMaxCol/2)-2), "  Memoria usada : " + hb_ntos(Memory(HB_MEM_USED)) + " KB")
	Print( nRow+12, ((nMaxCol/2)-2), "  Path Corrente : " + AllTrim( oAmbiente:xBase ))
	Print( nRow+13, ((nMaxCol/2)-2), "  Limite Acesso : ") ; printf( oAmbiente:xDataCodigo, AscanCor(clBrightRed))
	Print( nRow+14, ((nMaxCol/2)-2), "   MultiUsuario : ") ; printf(IF( MULTI, "Habilitado", "Desabilitado"), AscanCor(IF( MULTI, clBrightGreen,clBrightRed)))
	Print( nRow+15, ((nMaxCol/2)-2), "     Portas LPT : " + IF( FisPrinter("LPT1"), "#1 ","NIL,") + IF( FisPrinter("LPT2"), "#2 ","NIL,") + IF( FisPrinter("LPT3"), "#3 ","NIL,"))
	Print( nRow+16, ((nMaxCol/2)-2), "     Portas COM : " + IF( FisPrinter("COM1"), "#1 ","NIL,") + IF( FisPrinter("COM2"), "#2 ","NIL,") + IF( FisPrinter("COM3"), "#3 ","NIL,"))

   nRow1 := 16   
   /*
	FOR EACH nPr IN aPrinter
      nRow1++            
      Print( nRow+nRow1, ((nMaxCol/2)-2), "  Porta Cups #" + TrimStr(nPr:__enumIndex()) + " : " + nPr)
   NEXT                         
   */
   
	IF oAmbiente:Visual
	  Print( nRow+22, 03, Padc( "Software Licenciado para", nMaxCol-7), AscanCor(clBrightGreen))
	  Print( nRow+23, 03, Padc( XNOMEFIR, nMaxCol-7 ), AscanCor(clBrightRed))
	Else
	  Print( nRow+22, 03, Padc( "Software Licenciado para" , nMaxCol-2), AscanCor(clBrightGreen))
	  Print( nRow+23, 03, Padc( XNOMEFIR, nMaxCol-2 ), AscanCor(clBrightRed))
	EndIF	
		
	Print( ++nRow, (nMaxCol-30), "< Memoria >", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_CHAR       : ") ; printf(hb_ntos(Memory(HB_MEM_CHAR       )/1024) + " GB", AscanCor(clBrightRed))
	Print( ++nRow, (nMaxCol-30), "  MEM_BLOCK      : ") ; printf(hb_ntos(Memory(HB_MEM_BLOCK      )/1024) + " GB", AscanCor(clBrightRed))
	Print( ++nRow, (nMaxCol-30), "  MEM_RUN        : ") ; printf(hb_ntos(Memory(HB_MEM_RUN        )/1024) + " GB", AscanCor(clBrightRed))
	++nRow                                                                                 
	Print( ++nRow, (nMaxCol-30), "  MEM_VM         : ") ; printf(hb_ntos(Memory(HB_MEM_VM         )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_EMS        : ") ; printf(hb_ntos(Memory(HB_MEM_EMS        )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_FM         : ") ; printf(hb_ntos(Memory(HB_MEM_FM         )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_FMSEGS     : ") ; printf(hb_ntos(Memory(HB_MEM_FMSEGS     )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_SWAP       : ") ; printf(hb_ntos(Memory(HB_MEM_SWAP       )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_CONV       : ") ; printf(hb_ntos(Memory(HB_MEM_CONV       )/1024) + " GB", AscanCor(clBrightCyan))
	Print( ++nRow, (nMaxCol-30), "  MEM_EMSUSED    : ") ; printf(hb_ntos(Memory(HB_MEM_EMSUSED    )/1024) + " GB", AscanCor(clBrightCyan))
	++nRow
	Print( ++nRow, (nMaxCol-30), "  MEM_USED       : ") ; printf(hb_ntos(Memory(HB_MEM_USED       )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_USEDMAX    : ") ; printf(hb_ntos(Memory(HB_MEM_USEDMAX    )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_STACKITEMS : ") ; printf(hb_ntos(Memory(HB_MEM_STACKITEMS )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_STACK      : ") ; printf(hb_ntos(Memory(HB_MEM_STACK      )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_STACK_TOP  : ") ; printf(hb_ntos(Memory(HB_MEM_STACK_TOP  )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_BLOCKS     : ") ; printf(hb_ntos(Memory(HB_MEM_BLOCKS     )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_STATISTICS : ") ; printf(hb_ntos(Memory(HB_MEM_STATISTICS )) + " B", AscanCor(clBrightGreen))
	Print( ++nRow, (nMaxCol-30), "  MEM_CANLIMIT   : ") ; printf(hb_ntos(Memory(HB_MEM_CANLIMIT   )) + " B", AscanCor(clBrightGreen))
	CenturyOff()
	IF lInkey = NIL
		SetCursor(0)
		WaitKey(0)
	EndIF
	FChDir( cDiretorio )
	break
endef

function StrGetIp()
*--------------*
	LOCAL cString 	:= ""
	LOCAL aHost 	:= GetIp()
	LOCAL nLen     := Len(aHost)
	LOCAL c
	
	for each c IN aHost
		cString += c
		if nLen >= 2		
			cString += ', '
		endif
	next
	return cString
	