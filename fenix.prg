#include "fenix.ch"
request SIXCDX
REQUEST HB_CODEPAGE_PT850
REQUEST HB_CODEPAGE_PTISO
REQUEST HB_CODEPAGE_PT860
REQUEST HB_CODEPAGE_UTF8
REQUEST HB_LANG_EN
REQUEST HB_LANG_PT
static s_hMutex

function main()
********************
   LOCAL oPull

   Public Logfan	:= spac(4)
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

	hb_langSelect( "pt" ) 	
	oMenu:Limpa()
  	SetaAmbiente()
	//altd()
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
	//VerArquivo()
	UsaArquivo()
	//Abrearea()
   oMenu:Limpa()
	
	login()
	
	oMenu:StatusSup := "Fenix for Windows v1.0"
	oMenu:StatusInf += AllTrim(oMenu:Comp)
	oMenu:StatusInf += "|"
	oMenu:StatusInf += AllTrim(oMenu:Unidade)
   
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
   
	oMenu:Limpa()
   oPull := Monta_Menu()
	while MenuModal( oPull, 01, 00, MaxCol(), MaxCol(), "w+/b" ) != 999 ;  enddo
   return( nil )

function Monta_Menu()
   local oTopBar, oPopUp, oPopUp1, oPopUp2, oPopUp3, oItem, oItem1, oItem2
   local cCorBar  := "b*/w,w+/bg,b*/w,w+/bg,b*/w,b*/w"
   local cCorItem := "w+/bg,b*/w,w+/bg,b*/w,w/bg,w+/bg"
	local nResult  := 0


   oTopBar := TopBar( 01,00 , MaxCol())
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

	
	// Ambiente
	oPopUp := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem( MenuItem ( "&Ambiente", oPopUp, ,) )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Cor fundo", {|| SetaCorFundo() })
      oPopUp:AddItem( oItem )

      oPopUp2 := PopUp()
      oPopUp2 :ColorSpec:= cCorItem
      oItem := MenuItem( "&Pano Fundo", {|| xSetaPano() })
      oPopUp:AddItem( oItem )
	   	
*----------
*SAIR
*----------
	oPopUp  := PopUp()
   oPopUp :ColorSpec:= cCorItem
   oTopBar:AddItem(MenuItem( "&Sair", {|| Encerra(@nResult) } , K_ALT_F4,, 999))
   //Rodape()
   return ( oTopBar )
	
Function xSetaPano()
********************
	oMenu:SetaPano()
	SalvaMem()
	return nil	

function Rodape()
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


function SetaCorFundo()
***********************
	oMenu:Limpa()
	oMenu:Setacor(3)
	SalvaMem()
	oMenu:Limpa()
	return nil

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


function SetaAmbiente()
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

function login()
****************
	LOCAL cScreen   := SaveScreen()
	LOCAL R         := Space(1)
	LOCAL cLogin    := Space(15)
	LOCAL cPassword := Space(6)
	LOCAL SNA       := "168935"
	
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
	end

function UsuarioErrado( cNome )
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

	def SenhaErrada(cLogin, cPassWord)
		LOCAL cSenha  := Usuario->( AllTrim( Senha ))
		LOCAL Passe   := cPassword
		
		IF !Empty( Passe) .AND. cSenha == Passe
			return true
		EndIF
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
