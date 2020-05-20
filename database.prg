#include "fenix.ch"

function ArrayBancoDeDados()
****************************	
	oMenu:aDbfs := {"comp",;
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
	return nil

function VerArquivo()
*********************
	LOCAL nTam := Len(oMenu:aDbfs)
	LOCAL nX
	LOCAL cDbf

   Mensagem("Aguarde, verificando arquivos")
	rddsetdefault("SIXCDX")
	for nX := 1 to nTam
		cDatabase := oMenu:aDbfs[nX]
		cDbf      := oMenu:aDbfs[nX] + ".dbf"
		if !file( cDbf )
			ErrorBeep()
			mensagem("Erro: Arquivo " + upper(cDbf) + " nao existe")
			//quit
		end
	
		if cDatabase = "usuario"
			Ferase("usuario.cdx")
			use usuario exclusive new
			if !Neterr()
				index on Usuario->Fantazia Tag Fantazia to Usuario
				Usuario->(DbCloseArea())
				return true
			else
				alert("erro")
				return false
			endif
		end
	next
	oMenu:Limpa()	
	return true

function UsaArquivo(cDbf)
*************************
	LOCAL nTam := Len(oMenu:aDbfs)
	LOCAL nX
	
	rddsetdefault("SIXCDX")
	if cDbf = nil
		for nX := 1 to nTam
			cDatabase := oMenu:aDbfs[nX]
			if cDatabase = "usuario"
				use usuario shared new
				if !Neterr()
					DbSetIndex("Usuario")
					return true
				else
					alert("erro")
					return false
				endif
			end
			use &cDatabase shared new
			if Neterr()
				Alerta("Erro de abertura do arquivo: " + cDatabase )
				return false
			endif	
			//DBSetIndex( &cDatabase )
		next	
		oMenu:Limpa()	
		return true
	else
		use &cDatabase shared new
		if Neterr()
			Alerta("Erro de abertura do arquivo: " + cDatabase )
			return false
		endif	
		//DBSetIndex( &cDatabase )
	endif
	return true

*==================================================================================================*	
	
def Area( cArea)
****************
	DbSelectArea( cArea )
	return NIl
	
*==================================================================================================*		

def AbreArquivo( cArquivo )
	LOCAL cTela  := Mensagem("Aguarde... Verificando Arquivos.")
	LOCAL nQt
	LOCAL nPos
	LOCAL nQtArquivos
	LOCAL aArquivos

	// FechaTudo()
	aArquivos := ArrayArquivos()
	if cArquivo != NIL
      cArquivo := lower(cArquivo)
	   CriaArquivo(cArquivo)		
		//CriaIndice(cArquivo)		
		nPos := Ascan( aArquivos,{ |oBloco|oBloco[1] = cArquivo })
		if nPos != 0
			cArquivo := aArquivos[nPos,1]
			cTela := mensagem("Aguarde... Verificando Arquivo ;-;;#" + AllTrim(Str(nPos)) + ' ' + cArquivo )					
			if !NetUse( cArquivo, MONO )			
				ResTela( cTela )
				return(FALSO)
			endif
			return( OK )
		endif
		return( FALSO )
	endif

	nQtArquivos := Len( aArquivos )
	For nQt := 1 To nQtArquivos
		cArquivo := aArquivos[nQt,1]
		cTela := mensagem("Aguarde... Verificando Arquivo ;-;;#" + AllTrim(Str(nQt)) + ' ' + cArquivo)
		if !NetUse( cArquivo, MONO )
			ResTela( cTela )
			return(FALSO)
		endif
	Next
	ResTela( cTela )
	return( OK )

*==================================================================================================*	

def ArrayArquivos()
	LOCAL aArquivos := {}
	Aadd( aArquivos, { "usuario.dbf",;
	   	{{'CODUSU', 'C', 4, 0 },;
          {'FANTAZIA', 'C', 15, 0 },;
          {'SENHA', 'C', 6, 0 },;
          {'DTCAD', 'D', 8, 0 },;
          {'CADASTRO', 'C', 1, 0 },;
          {'CLICAD', 'C', 1, 0 },;
          {'FORCAD', 'C', 1, 0 },;
          {'MERCAD', 'C', 1, 0 },;
          {'PROCAD', 'C', 1, 0 },;
          {'CFOCAD', 'C', 1, 0 },;
          {'CDBCAD', 'C', 1, 0 },;
          {'ESTCAD', 'C', 1, 0 },;
          {'CLACAD', 'C', 1, 0 },;
          {'EMBCAD', 'C', 1, 0 },;
          {'MUNCAD', 'C', 1, 0 },;
          {'REPCAD', 'C', 1, 0 },;
          {'TRACAD', 'C', 1, 0 },;
          {'CESCAD', 'C', 1, 0 },;
          {'VENDA', 'C', 1, 0 },;
          {'REGV', 'C', 1, 0 },;
          {'BXV', 'C', 1, 0 },;
          {'EDTV', 'C', 1, 0 },;
          {'ESTQV', 'C', 1, 0 },;
          {'ETQED', 'C', 1, 0 },;
          {'LSTV', 'C', 1, 0 },;
          {'PSQV', 'C', 1, 0 },;
          {'FTV', 'C', 1, 0 },;
          {'DVV', 'C', 1, 0 },;
          {'NFV', 'C', 1, 0 },;
          {'COMPRA', 'C', 1, 0 },;
          {'REGC', 'C', 1, 0 },;
          {'BXC', 'C', 1, 0 },;
          {'EDTC', 'C', 1, 0 },;
          {'LSTC', 'C', 1, 0 },;
          {'ESTQC', 'C', 1, 0 },;
          {'PSQC', 'C', 1, 0 },;
          {'NFE', 'C', 1, 0 },;
          {'NFSA', 'C', 1, 0 },;
          {'NFEN', 'C', 1, 0 },;
          {'NFC', 'C', 1, 0 },;
          {'ETQC', 'C', 1, 0 },;
          {'ESTOQUE', 'C', 1, 0 },;
          {'PLNE', 'C', 1, 0 },;
          {'CNCE', 'C', 1, 0 },;
          {'EDTE', 'C', 1, 0 },;
          {'RGPE', 'C', 1, 0 },;
          {'PERE', 'C', 1, 0 },;
          {'CHEQ', 'C', 1, 0 },;
          {'DPE', 'C', 1, 0 },;
          {'LJA', 'C', 1, 0 },;
          {'FNA', 'C', 1, 0 }}})
			 
Aadd( aArquivos, {"abcprod.dbf",; 
          {;
          {'GERADO', 'D', 8, 0 },;
          {'DTI1', 'D', 8, 0 },;
          {'DTF2', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PROD', 'C', 30, 0 },;
          {'EMB', 'C', 15, 0 },;
          {'QUANT', 'N', 12, 2 },;
          {'VLR', 'N', 15, 2 },;
          {'CONT', 'C', 12, 0 };
          }})
			 
 Aadd( aArquivos, {"arq_emb.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NRDAR', 'C', 5, 0 },;
          {'EMBAL', 'C', 15, 0 };
          }})


 Aadd( aArquivos, {"arq_cod.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NRDAR', 'C', 5, 0 },;
          {'CODPROD', 'C', 5, 0 },;
          {'PRODUTO', 'C', 20, 0 };
          }})
			 
 Aadd( aArquivos, {"agplote.dbf",; 
          {;
          {'CONTROLE', 'C', 10, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'PRELOTE', 'C', 9, 0 },;
          {'QDE', 'N', 10, 3 },;
          {'DATA', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})			 
			 
 Aadd( aArquivos, {"abc_cli.dbf",; 
          {;
          {'DTI1', 'D', 8, 0 },;
          {'DTF2', 'D', 8, 0 },;
          {'CODC', 'C', 5, 0 },;
          {'CLTE', 'C', 20, 0 },;
          {'VLR', 'N', 15, 2 },;
          {'CONT', 'C', 12, 0 };
          }})			 

 Aadd( aArquivos, {"baixacom.dbf",; 
          {;
          {'NROBX', 'C', 12, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'DATAI', 'D', 8, 0 },;
          {'DATAF', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 15, 0 },;
          {'VALOR', 'N', 8, 2 },;
          {'ACRES', 'N', 8, 2 },;
          {'DESC', 'N', 8, 2 },;
          {'USUARIO', 'C', 15, 0 },;
          {'CDTERM', 'C', 2, 0 },;
          {'SIT', 'C', 9, 0 };
          }})
 Aadd( aArquivos, {"baixaven.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'DATAI', 'D', 8, 0 },;
          {'DATAF', 'D', 8, 0 },;
          {'DATAPG', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 15, 0 },;
          {'VALOR', 'N', 9, 2 },;
          {'DSCTO', 'N', 9, 2 },;
          {'ACREC', 'N', 9, 2 },;
          {'VLPAGO', 'N', 9, 2 },;
          {'CTRBX', 'C', 12, 0 },;
          {'NROBX', 'C', 12, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'CDTERM', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"bancnota.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'TP', 'C', 1, 0 },;
          {'NNTA', 'N', 9, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NNTAD1', 'C', 6, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'VLPRD', 'N', 11, 2 },;
          {'VLBSST', 'N', 9, 2 },;
          {'FRETE', 'N', 9, 2 },;
          {'SEGURO', 'N', 9, 2 },;
          {'DESP', 'N', 9, 2 },;
          {'DESCONTO', 'N', 9, 2 },;
          {'VLNTA', 'N', 11, 2 },;
          {'PG', 'C', 1, 0 },;
          {'NPED', 'C', 10, 0 },;
          {'PEDCLI', 'N', 10, 0 },;
          {'CDCFOP', 'C', 5, 0 },;
          {'NTRZA', 'C', 50, 0 },;
          {'VLST', 'N', 9, 4 },;
          {'VLALQ', 'N', 9, 4 },;
          {'TPNT', 'C', 9, 0 },;
          {'DATATPT', 'D', 8, 0 },;
          {'CODT', 'C', 4, 0 },;
          {'TRANSPORTE', 'C', 25, 0 },;
          {'CNPJTRA', 'C', 18, 0 },;
          {'QUEMPG', 'C', 1, 0 },;
          {'PLACA', 'C', 8, 0 },;
          {'QD_VOL', 'N', 7, 0 },;
          {'ESPEC', 'C', 10, 0 },;
          {'NM_MARCA', 'C', 10, 0 },;
          {'NROCAO', 'C', 10, 0 },;
          {'PSOBRT', 'N', 8, 2 },;
          {'PSOLIQ', 'N', 8, 2 },;
          {'OB', 'C', 20, 0 },;
          {'OBS1', 'C', 37, 0 },;
          {'OBS2', 'C', 37, 0 },;
          {'OBS3', 'C', 37, 0 },;
          {'OBS4', 'C', 37, 0 },;
          {'STATUS', 'C', 11, 0 },;
          {'MTVO', 'C', 40, 0 },;
          {'TRANSM', 'C', 1, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 6, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'EMIT', 'C', 5, 0 },;
          {'CTCOLETA', 'C', 4, 0 },;
          {'CNPJD', 'C', 18, 0 },;
          {'CPFD', 'C', 14, 0 };
          }})
 Aadd( aArquivos, {"bcdesc.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'VLPED', 'N', 9, 2 },;
          {'VLDCO', 'N', 9, 2 },;
          {'VALOR', 'N', 9, 2 };
          }})
 Aadd( aArquivos, {"bcntacom.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NNTA', 'C', 6, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'FORN', 'C', 20, 0 },;
          {'VLPRD', 'N', 9, 2 },;
          {'VLNTA', 'N', 9, 2 },;
          {'NPED', 'C', 10, 0 },;
          {'NTRZA', 'C', 20, 0 },;
          {'STATUS', 'C', 20, 0 };
          }})
 Aadd( aArquivos, {"bco.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NRBC', 'N', 3, 0 },;
          {'BCO', 'C', 30, 0 },;
          {'TCONTA', 'C', 10, 0 },;
          {'REF', 'C', 40, 0 },;
          {'VL', 'N', 9, 2 };
          }})
 Aadd( aArquivos, {"bctab.dbf",; 
          {;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 20, 0 },;
          {'PLIQ', 'C', 4, 0 },;
          {'PDRE', 'C', 4, 0 },;
          {'VL', 'N', 10, 7 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QCX', 'N', 2, 0 },;
          {'NCM', 'C', 10, 0 },;
          {'CODBAR', 'C', 13, 0 };
          }})			 
 Aadd( aArquivos, {"cadadm.dbf",; 
          {;
          {'SENHA', 'C', 7, 0 },;
          {'FANT', 'C', 30, 0 },;
          {'RAZAO', 'C', 60, 0 },;
          {'END', 'C', 40, 0 },;
          {'NRO', 'C', 5, 0 },;
          {'CPLMTO', 'C', 20, 0 },;
          {'BRRO', 'C', 25, 0 },;
          {'CDCIDA', 'C', 7, 0 },;
          {'CDADE', 'C', 40, 0 },;
          {'EST', 'C', 2, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'PAIS', 'C', 6, 0 },;
          {'CNPJ', 'C', 18, 0 },;
          {'IE', 'C', 15, 0 },;
          {'IM', 'C', 7, 0 },;
          {'CNAE', 'C', 9, 0 },;
          {'FONE1', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'FONE3', 'C', 14, 0 },;
          {'FONE4', 'C', 14, 0 },;
          {'FONE5', 'C', 14, 0 },;
          {'FONE6', 'C', 14, 0 },;
          {'EMAIL', 'C', 60, 0 },;
          {'SITE', 'C', 60, 0 },;
          {'CADBLOQ', 'C', 1, 0 },;
          {'TOL_MINFUN', 'N', 5, 0 },;
          {'REG_TRIBT', 'C', 1, 0 },;
          {'VERSNFE', 'C', 7, 0 },;
          {'MINBOL', 'N', 6, 2 },;
          {'MODNF', 'C', 10, 0 },;
          {'MPROT', 'C', 1, 0 },;
          {'FUSO', 'C', 6, 0 },;
          {'DATASIS', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"CADCLAS.dbf",; 
          {;
          {'CODS', 'C', 2, 0 },;
          {'NSUPR', 'C', 15, 0 },;
          {'BLOQ', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"cadcli.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'SIT', 'C', 13, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 22, 0 },;
          {'RAZAO', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 16, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'ENDER2', 'C', 40, 0 },;
          {'NROEND2', 'C', 6, 0 },;
          {'COMPL2', 'C', 20, 0 },;
          {'BAIRRO2', 'C', 16, 0 },;
          {'CIDA2', 'C', 30, 0 },;
          {'EST2', 'C', 2, 0 },;
          {'CEP2', 'C', 10, 0 },;
          {'CNPJ', 'C', 18, 0 },;
          {'INSCR', 'C', 15, 0 },;
          {'CPF', 'C', 14, 0 },;
          {'INSCRP', 'C', 16, 0 },;
          {'FONE1', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'PRAZO', 'N', 3, 0 },;
          {'PRAZO2', 'N', 3, 0 },;
          {'EMAIL', 'C', 60, 0 },;
          {'EXML', 'C', 43, 0 },;
          {'INDIE', 'C', 1, 0 },;
          {'VMIN', 'N', 9, 2 },;
          {'ISEST', 'C', 1, 0 },;
          {'JUSTST', 'C', 234, 0 },;
          {'OBS', 'C', 45, 0 },;
          {'TPDESC', 'C', 1, 0 },;
          {'DSCNTO', 'N', 10, 6 },;
          {'TPAG', 'N', 1, 0 },;
          {'ATIVO', 'C', 1, 0 },;
          {'LINHA', 'C', 2, 0 },;
          {'CONTATO', 'C', 20, 0 },;
          {'NF', 'C', 1, 0 },;
          {'PRNF', 'C', 1, 0 },;
          {'PEDCLI', 'C', 1, 0 },;
          {'DESPACHO', 'C', 40, 0 },;
          {'REG_APUR', 'C', 1, 0 },;
          {'CNAE', 'C', 9, 0 },;
          {'CODRP', 'C', 4, 0 },;
          {'NREPRE', 'C', 20, 0 },;
          {'HRREC', 'C', 150, 0 },;
          {'OBSSEP', 'C', 81, 0 },;
          {'RESTRIC', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"CADCONS.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 25, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'CPF', 'C', 14, 0 },;
          {'FONE1', 'C', 13, 0 },;
          {'EMAIL', 'C', 60, 0 },;
          {'OBS', 'C', 45, 0 },;
          {'TPDESC', 'C', 1, 0 },;
          {'DSCNTO', 'N', 5, 2 },;
          {'CONTATO', 'C', 20, 0 },;
          {'NF', 'C', 1, 0 },;
          {'PRNF', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"CADESP.dbf",; 
          {;
          {'COD', 'C', 3, 0 },;
          {'NME', 'C', 15, 0 };
          }})
 Aadd( aArquivos, {"cadfor.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'SIT', 'C', 13, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'RAZAO', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 30, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CNPJ', 'C', 18, 0 },;
          {'INSCRP', 'C', 18, 0 },;
          {'CPF', 'C', 18, 0 },;
          {'INSCR', 'C', 18, 0 },;
          {'FONE1', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'PRZ', 'N', 3, 0 },;
          {'OBSER', 'C', 60, 0 },;
          {'MAIL', 'C', 68, 0 },;
          {'CONTATO', 'C', 20, 0 },;
          {'LINHA', 'C', 2, 0 },;
          {'REG_APUR', 'C', 1, 0 },;
          {'CTROL', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'INDIE', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"CADFRETE.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'SIT', 'C', 13, 0 },;
          {'CODT', 'C', 4, 0 },;
          {'NTRA', 'C', 20, 0 },;
          {'RAZAO', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 30, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CNPJ', 'C', 18, 0 },;
          {'INSCR', 'C', 18, 0 },;
          {'CPF', 'C', 18, 0 },;
          {'RG', 'C', 18, 0 },;
          {'FONE1', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'PRZ', 'N', 3, 0 },;
          {'OBSER', 'C', 60, 0 },;
          {'MAIL', 'C', 68, 0 },;
          {'CONTATO', 'C', 20, 0 },;
          {'LINHA', 'C', 2, 0 },;
          {'REG_APUR', 'C', 1, 0 },;
          {'CTROL', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'INDIE', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"cadfun.dbf",; 
          {;
          {'DTAADM', 'D', 8, 0 },;
          {'DTADM', 'D', 8, 0 },;
          {'DTANAC', 'D', 8, 0 },;
          {'LIVRO', 'N', 4, 0 },;
          {'CODLIVRO', 'N', 4, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 35, 0 },;
          {'CARGO', 'C', 45, 0 },;
          {'SETOR', 'C', 15, 0 },;
          {'FUNCAO', 'C', 15, 0 },;
          {'SEXO', 'C', 9, 0 },;
          {'ENDRCO', 'C', 40, 0 },;
          {'BAIRRO', 'C', 25, 0 },;
          {'CDDE', 'C', 25, 0 },;
          {'UF', 'C', 2, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'FONE', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'ESCODADE', 'C', 20, 0 },;
          {'ESTCIV', 'C', 15, 0 },;
          {'CPF', 'C', 14, 0 },;
          {'RG', 'C', 12, 0 },;
          {'AMRIO', 'N', 2, 0 },;
          {'EMAL', 'C', 40, 0 },;
          {'OBSV', 'C', 45, 0 },;
          {'VTRANSP', 'C', 3, 0 },;
          {'AGENCIA', 'C', 4, 0 },;
          {'DIGAG', 'C', 1, 0 },;
          {'CONTA', 'C', 10, 0 },;
          {'TPCTA', 'C', 9, 0 },;
          {'DIGCO', 'C', 1, 0 },;
          {'BANCO', 'C', 25, 0 },;
          {'OPER', 'C', 3, 0 },;
          {'NOMETIT', 'C', 25, 0 },;
          {'STATUS', 'C', 8, 0 },;
          {'NROPIS', 'C', 11, 0 },;
          {'CART', 'C', 13, 0 },;
          {'EXP1', 'N', 3, 0 },;
          {'EXP2', 'N', 3, 0 };
          }})
 Aadd( aArquivos, {"CADHIS.dbf",; 
          {;
          {'COD', 'C', 3, 0 },;
          {'NME', 'C', 15, 0 };
          }})
 Aadd( aArquivos, {"CADICMS.dbf",; 
          {;
          {'NOMECID', 'C', 20, 0 },;
          {'ABRCID', 'C', 2, 0 },;
          {'ICMS', 'N', 5, 2 },;
          {'CREDES', 'N', 5, 2 },;
          {'ALQAD', 'N', 5, 2 },;
          {'ALQINTER', 'N', 5, 2 },;
          {'ST', 'C', 1, 0 },;
          {'STRIB', 'C', 3, 0 },;
          {'NRO_REF', 'C', 1, 0 },;
          {'LTRA_EST', 'C', 1, 0 },;
          {'MSG', 'C', 120, 0 };
          }})
 Aadd( aArquivos, {"CADLIN.dbf",; 
          {;
          {'CODL', 'C', 4, 0 },;
          {'LINHA', 'C', 40, 0 },;
          {'SETOR', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"cadmerc.dbf",; 
          {;
          {'CODM', 'C', 2, 0 },;
          {'CDTP', 'C', 3, 0 },;
          {'MERCAD', 'C', 28, 0 },;
          {'CODBAL', 'C', 4, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'PRECO', 'N', 8, 4 },;
          {'OP_SAID', 'C', 11, 0 },;
          {'ATIVO', 'C', 1, 0 },;
          {'PESOL', 'C', 4, 0 },;
          {'PESOD', 'C', 4, 0 },;
          {'PESOCXL', 'N', 9, 3 },;
          {'PESOCXB', 'N', 9, 3 },;
          {'QDECX', 'N', 8, 3 },;
          {'CLASIF', 'C', 2, 0 },;
          {'NCLAS', 'C', 15, 0 },;
          {'CLASF', 'C', 10, 0 },;
          {'CD_ORIG', 'C', 1, 0 },;
          {'ALQ', 'N', 5, 2 },;
          {'IPI', 'C', 2, 0 },;
          {'CDENQIPI', 'N', 3, 0 },;
          {'PIS', 'C', 2, 0 },;
          {'BSC_PIS', 'N', 5, 2 },;
          {'ALQ_PIS', 'N', 5, 2 },;
          {'FIN_PIS', 'N', 5, 2 },;
          {'COFINS', 'C', 2, 0 },;
          {'BSC_COFINS', 'N', 5, 2 },;
          {'ALQ_COFINS', 'N', 5, 2 },;
          {'FIN_COFINS', 'N', 5, 2 },;
          {'CODBPRO', 'C', 15, 0 },;
          {'ESTQMIN', 'N', 6, 2 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"cadprod.dbf",; 
          {;
          {'CODP', 'C', 2, 0 },;
          {'CDTP', 'C', 3, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'OP_SAID', 'C', 20, 0 },;
          {'CD_ST', 'C', 1, 0 },;
          {'CODBAL', 'C', 4, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'PRECOPL', 'N', 10, 7 },;
          {'T', 'C', 2, 0 },;
          {'PRECO', 'N', 10, 7 },;
          {'PRLJ', 'N', 7, 2 },;
          {'ATIVO', 'C', 1, 0 },;
          {'PESOL', 'C', 4, 0 },;
          {'PESOD', 'C', 4, 0 },;
          {'PESOCXL', 'N', 9, 3 },;
          {'PESOCXB', 'N', 9, 3 },;
          {'UND', 'C', 2, 0 },;
          {'UNDCOM', 'C', 5, 0 },;
          {'QDECX', 'N', 2, 0 },;
          {'PRZVAL', 'N', 3, 0 },;
          {'CLASF', 'C', 10, 0 },;
          {'CD_ORIG', 'C', 1, 0 },;
          {'ALQ', 'N', 5, 2 },;
          {'IPI', 'C', 2, 0 },;
          {'CDENQIPI', 'N', 3, 0 },;
          {'PIS', 'C', 2, 0 },;
          {'COFINS', 'C', 2, 0 },;
          {'MO', 'N', 6, 2 },;
          {'COMISSAO', 'N', 5, 2 },;
          {'MARG', 'N', 5, 2 },;
          {'CODBPRO', 'C', 15, 0 },;
          {'CODBCX', 'C', 18, 0 },;
          {'ESTQMIN', 'N', 6, 2 },;
          {'TBPRC', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'CADATV', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"CARSAL.dbf",; 
          {;
          {'CODG', 'C', 4, 0 },;
          {'CARGO', 'C', 30, 0 },;
          {'CBO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"CBO.dbf",; 
          {;
          {'CBO', 'N', 8, 0 },;
          {'DESCRICAO', 'C', 200, 0 };
          }})
 Aadd( aArquivos, {"CDADE.dbf",; 
          {;
          {'CODCIDA', 'C', 7, 0 },;
          {'CIDADE', 'C', 30, 0 },;
          {'ESTD', 'C', 2, 0 },;
          {'PAIS', 'C', 6, 0 };
          }})
 Aadd( aArquivos, {"CEST.dbf",; 
          {;
          {'CEST', 'C', 9, 0 },;
          {'NCM', 'C', 10, 0 },;
          {'DATACAD', 'D', 8, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"CFOP.dbf",; 
          {;
          {'COD', 'C', 4, 0 },;
          {'NTREZA', 'C', 50, 0 },;
          {'NCFOP', 'C', 5, 0 },;
          {'OPER', 'C', 7, 0 },;
          {'TPSAI', 'C', 1, 0 },;
          {'ESTVEND', 'C', 2, 0 },;
          {'SUBT', 'C', 1, 0 },;
          {'SITTRB', 'C', 3, 0 },;
          {'SITPG', 'C', 1, 0 },;
          {'LTRA_EST', 'C', 1, 0 },;
          {'NRO_REF', 'C', 1, 0 },;
          {'IMP', 'C', 1, 0 },;
          {'MSG', 'C', 231, 0 },;
          {'ALIQUOTA', 'N', 6, 2 };
          }})
 Aadd( aArquivos, {"CHEC.dbf",; 
          {;
          {'NUM', 'N', 5, 0 },;
          {'DESC', 'C', 35, 0 };
          }})
 Aadd( aArquivos, {"clafisc.dbf",; 
          {;
          {'COMP', 'C', 15, 0 },;
          {'TERMINAL', 'C', 2, 0 },;
          {'UNIDADE', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"CLMNTCOD.dbf",; 
          {;
          {'C', 'C', 1, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'NNTA', 'C', 6, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'P', 'C', 1, 0 },;
          {'R', 'C', 1, 0 },;
          {'OBS', 'C', 10, 0 },;
          {'NRBOL', 'C', 9, 0 },;
          {'VENCTO', 'C', 10, 0 },;
          {'USUARIO', 'C', 10, 0 };
          }})
 Aadd( aArquivos, {"CLMNTDET.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'NNTA', 'C', 6, 0 },;
          {'CODM', 'C', 4, 0 },;
          {'QUANT', 'N', 5, 1 },;
          {'UNIT', 'N', 7, 2 },;
          {'OBS', 'C', 10, 0 },;
          {'LOTE', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"CMDA.dbf",; 
          {;
          {'NRCMANDA', 'C', 10, 0 };
          }})
 Aadd( aArquivos, {"COMCX.dbf",; 
          {;
          {'NRFAT', 'C', 10, 0 },;
          {'CODVZ', 'C', 4, 0 },;
          {'VAZIL', 'C', 15, 0 },;
          {'QDE', 'N', 7, 2 },;
          {'X', 'C', 1, 0 },;
          {'FN', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"comp.dbf",; 
          {;
          {'COMP', 'C', 15, 0 },;
          {'TERMINAL', 'C', 2, 0 },;
          {'UNIDADE', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"compras.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 20, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'CLASIF', 'C', 2, 0 },;
          {'NCLAS', 'C', 15, 0 },;
          {'VAZIL', 'C', 4, 0 },;
          {'QDEVAZ', 'N', 7, 2 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'X', 'C', 1, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRNOTA', 'N', 9, 0 },;
          {'NFENTRADA', 'N', 9, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 10, 3 },;
          {'UNIT', 'N', 14, 7 },;
          {'PGN', 'C', 1, 0 },;
          {'LTNR', 'C', 5, 0 },;
          {'VENC', 'D', 8, 0 },;
          {'OBS', 'C', 25, 0 },;
          {'NROPDC', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'NFAT', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 };
          }})
 Aadd( aArquivos, {"COMVZ.dbf",; 
          {;
          {'NRFAT', 'C', 10, 0 },;
          {'CODVZ', 'C', 4, 0 },;
          {'VAZIL', 'C', 15, 0 },;
          {'QDE', 'N', 7, 2 },;
          {'X', 'C', 1, 0 },;
          {'FN', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"CONTADOR.dbf",; 
          {;
          {'QUANTIA', 'C', 15, 0 },;
          {'NRO', 'C', 3, 0 };
          }})
 Aadd( aArquivos, {"CONTROLD.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'DSEMA', 'C', 15, 0 },;
          {'TIPO', 'C', 8, 0 },;
          {'PER_MHA', 'C', 1, 0 },;
          {'PER_TRD', 'C', 1, 0 },;
          {'INTGR', 'C', 1, 0 },;
          {'ENTR1', 'C', 5, 0 },;
          {'SAID1', 'C', 5, 0 },;
          {'ALM1', 'C', 5, 0 },;
          {'ALM2', 'C', 5, 0 };
          }})
 Aadd( aArquivos, {"CPOM.dbf",; 
          {;
          {'CONTROLE', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"CREALIN.dbf",; 
          {;
          {'CODL', 'C', 4, 0 },;
          {'SETOR', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"CTRVAZ.dbf",; 
          {;
          {'NRFAT', 'C', 10, 0 },;
          {'CODVZ', 'C', 4, 0 },;
          {'VAZIL', 'C', 15, 0 },;
          {'QDE', 'N', 9, 2 };
          }})
 Aadd( aArquivos, {"CTR_ENT.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NRO', 'N', 9, 0 },;
          {'CODD', 'C', 4, 0 },;
          {'NME', 'C', 25, 0 },;
          {'VLOR', 'N', 9, 2 },;
          {'RCBDO', 'C', 1, 0 },;
          {'PEDIDO', 'C', 10, 0 },;
          {'DTREC', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"DAD_NFEN.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 20, 0 },;
          {'UNDCOM', 'C', 5, 0 },;
          {'QUANT', 'N', 9, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'CONTROL', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'X', 'C', 1, 0 },;
          {'STRIB', 'C', 3, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"DATA_SEM.dbf",; 
          {;
          {'DIA_SEM', 'C', 9, 0 },;
          {'ING_DAY', 'C', 9, 0 };
          }})
 Aadd( aArquivos, {"DESC.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'DESC', 'N', 6, 2 };
          }})
 Aadd( aArquivos, {"DESPESA.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NOME', 'C', 15, 0 },;
          {'HISTORICO', 'C', 15, 0 },;
          {'QUANT', 'N', 8, 3 },;
          {'UNIT', 'N', 11, 4 },;
          {'PGNPG', 'C', 1, 0 },;
          {'OBS', 'C', 15, 0 },;
          {'VENCTO', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"DEVOLUC.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 9, 4 },;
          {'CTR', 'N', 9, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'PGN', 'C', 1, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'FATURADO', 'C', 1, 0 },;
          {'VNCIMTO', 'D', 8, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 20, 0 },;
          {'STRIB', 'C', 3, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'X', 'C', 1, 0 },;
          {'VL_FIN', 'N', 14, 7 },;
          {'USUBX', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'IMPRESSO', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"DEVOLUCA.dbf",; 
          {;
          {'NRODEV', 'C', 10, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'TP', 'C', 1, 0 },;
          {'NNTA', 'C', 6, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'CODP', 'C', 4, 0 },;
          {'PRODUTO', 'C', 20, 0 },;
          {'LOTE', 'C', 4, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QDE', 'N', 7, 2 },;
          {'UNT', 'N', 7, 2 },;
          {'CFOP', 'C', 5, 0 },;
          {'OPRAC', 'C', 20, 0 },;
          {'USUARIO', 'C', 15, 0 },;
          {'TERM', 'C', 2, 0 };
          }})
 Aadd( aArquivos, {"DIALET.dbf",; 
          {;
          {'CODFC', 'C', 4, 0 },;
          {'DIASEM', 'C', 15, 0 },;
          {'ENTR1', 'C', 5, 0 },;
          {'SAID1', 'C', 5, 0 },;
          {'LET', 'C', 1, 0 },;
          {'ALMCO1', 'C', 5, 0 },;
          {'ALMCO2', 'C', 5, 0 };
          }})
 Aadd( aArquivos, {"DPCARG.dbf",; 
          {;
          {'CODCG', 'C', 4, 0 },;
          {'CARGO', 'C', 30, 0 },;
          {'PISO', 'N', 9, 2 };
          }})
 Aadd( aArquivos, {"EMBALS.dbf",; 
          {;
          {'CODEB', 'C', 4, 0 },;
          {'DESCR', 'C', 15, 0 },;
          {'ABREV', 'C', 3, 0 },;
          {'VLR', 'N', 5, 0 },;
          {'NCM', 'C', 10, 0 },;
          {'DESCFAT', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"ENTRADA.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 15, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'LOTEMER', 'C', 5, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'UNIT', 'N', 12, 7 },;
          {'LOTE', 'C', 4, 0 },;
          {'CODEN', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"estoque.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 10, 3 },;
          {'LOTE', 'C', 6, 0 },;
          {'PESOD', 'N', 7, 0 },;
          {'PESOL', 'N', 7, 0 },;
          {'TPO', 'C', 1, 0 },;
          {'PRELOTE', 'C', 9, 0 },;
          {'LT_ANTIGO', 'C', 6, 0 },;
          {'DTBXAM', 'D', 8, 0 },;
          {'CODEN', 'C', 8, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'DATAIN', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"ESTORNO.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QDE', 'N', 9, 4 },;
          {'LOTE', 'C', 6, 0 },;
          {'TIPO', 'C', 8, 0 },;
          {'CONTROL', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"ESTQ_C.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 20, 0 },;
          {'TIPO', 'C', 5, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 10, 3 },;
          {'LOTE', 'C', 5, 0 },;
          {'QDADE', 'C', 5, 0 },;
          {'REGIAO', 'C', 2, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"ETIQUETA.dbf",; 
          {;
          {'LOTE', 'C', 6, 0 },;
          {'PRELOTE', 'C', 9, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'UNDCOM', 'C', 5, 0 },;
          {'DTFAB', 'C', 10, 0 },;
          {'DTVAL', 'C', 10, 0 },;
          {'PESOL', 'N', 7, 0 },;
          {'PESOD', 'N', 7, 0 },;
          {'PESOCXB', 'C', 9, 0 },;
          {'PESOCXL', 'C', 9, 0 },;
          {'QDECX', 'N', 2, 0 },;
          {'CODBPRO', 'C', 12, 0 },;
          {'CODBCX', 'C', 13, 0 },;
          {'CXPROD', 'C', 47, 0 },;
          {'INGR', 'C', 120, 0 };
          }})
 Aadd( aArquivos, {"ETQENV.dbf",; 
          {;
          {'NF', 'N', 9, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'PEDIDO', 'C', 10, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'PESOB', 'N', 8, 2 },;
          {'VOLUME', 'N', 7, 0 },;
          {'DRAZAO', 'C', 40, 0 },;
          {'END', 'C', 40, 0 },;
          {'NROEND', 'N', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 16, 0 },;
          {'CDADE', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'CEP', 'C', 10, 0 };
          }})
 Aadd( aArquivos, {"ETQPRE.dbf",; 
          {;
          {'PRELOTE', 'C', 9, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'UNDCOM', 'C', 5, 0 },;
          {'DTFAB', 'D', 8, 0 },;
          {'DTVAL', 'D', 8, 0 },;
          {'PESOL', 'N', 7, 0 },;
          {'PESOD', 'N', 7, 0 },;
          {'PESOCXB', 'N', 9, 3 },;
          {'PESOCXL', 'N', 9, 3 },;
          {'QDECX', 'N', 2, 0 },;
          {'CODBPRO', 'C', 12, 0 },;
          {'CODBCX', 'C', 13, 0 };
          }})
 Aadd( aArquivos, {"ETQ_DV.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 6, 1 },;
          {'LOTE', 'C', 6, 0 },;
          {'TPO', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"FPRO.dbf",; 
          {;
          {'P', 'C', 22, 0 },;
          {'S', 'C', 6, 0 },;
          {'DRENADO', 'C', 7, 0 };
          }})
 Aadd( aArquivos, {"FRETE.dbf",; 
          {;
          {'DESP', 'N', 9, 2 },;
          {'TAS', 'N', 9, 2 },;
          {'PEDG', 'N', 9, 2 },;
          {'TX_GRIS', 'N', 9, 2 };
          }})
 Aadd( aArquivos, {"FROTA.dbf",; 
          {;
          {'CDCAR', 'C', 2, 0 },;
          {'DATACP', 'D', 8, 0 },;
          {'MODELO', 'C', 20, 0 },;
          {'MARCA', 'C', 15, 0 },;
          {'ESPECIE', 'C', 25, 0 },;
          {'COMBS', 'C', 15, 0 },;
          {'RENAVAM', 'C', 11, 0 },;
          {'PLACA', 'C', 8, 0 },;
          {'CHASSI', 'C', 17, 0 },;
          {'ANOFB', 'N', 4, 0 },;
          {'ANOMD', 'N', 4, 0 },;
          {'COR', 'C', 10, 0 },;
          {'VLPG', 'N', 15, 2 },;
          {'DATAVD', 'D', 8, 0 },;
          {'VLVDA', 'N', 15, 2 },;
          {'VNCLICEN', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"FTMTO.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'VENCIMTO', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'PEDNR', 'C', 10, 0 },;
          {'VALOR', 'N', 9, 2 },;
          {'TIPO', 'C', 14, 0 },;
          {'NBOL', 'N', 9, 0 },;
          {'AGENCIA', 'C', 6, 0 },;
          {'CONTAC', 'C', 14, 0 },;
          {'OPER', 'C', 3, 0 },;
          {'BANCO', 'C', 20, 0 },;
          {'FAVRC', 'C', 25, 0 },;
          {'PAGO', 'C', 1, 0 },;
          {'NRBX', 'C', 12, 0 },;
          {'OPRA', 'N', 9, 0 },;
          {'DATAI', 'D', 8, 0 },;
          {'DATAF', 'D', 8, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NTERM', 'C', 2, 0 },;
          {'STATUS', 'C', 15, 0 };
          }})
 Aadd( aArquivos, {"GASTOS.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'GASTO', 'C', 30, 0 },;
          {'QTDE', 'N', 9, 2 },;
          {'UNIT', 'N', 9, 2 },;
          {'OBS', 'C', 30, 0 };
          }})
 Aadd( aArquivos, {"HORA.dbf",; 
          {;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 30, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'SEMA', 'C', 15, 0 },;
          {'HORA1', 'C', 5, 0 },;
          {'HORA2', 'C', 5, 0 },;
          {'HORA3', 'C', 5, 0 },;
          {'HORA4', 'C', 5, 0 },;
          {'HORA5', 'C', 5, 0 },;
          {'HORA6', 'C', 5, 0 },;
          {'HORA7', 'C', 5, 0 },;
          {'HORA8', 'C', 5, 0 },;
          {'ATRAZ_MIN', 'N', 5, 0 },;
          {'EXT_MIN70', 'N', 5, 0 },;
          {'EXT_MIN75', 'N', 5, 0 },;
          {'EXT_MIN100', 'N', 5, 0 },;
          {'FALTAS', 'N', 1, 0 },;
          {'ENVIADO', 'C', 1, 0 },;
          {'DT_ENVIO', 'D', 8, 0 },;
          {'REGISTRO', 'C', 1, 0 },;
          {'USUARIO', 'C', 15, 0 },;
          {'TERMINAL', 'C', 2, 0 },;
          {'NROENV', 'C', 12, 0 };
          }})
 Aadd( aArquivos, {"HORA5.dbf",; 
          {;
          {'FUNC', 'C', 22, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'HORA1', 'C', 5, 0 },;
          {'HORA2', 'C', 5, 0 },;
          {'HORA3', 'C', 5, 0 },;
          {'HORA4', 'C', 5, 0 },;
          {'HORA5', 'C', 5, 0 },;
          {'HORA6', 'C', 5, 0 },;
          {'HORA7', 'C', 5, 0 },;
          {'HORA8', 'C', 5, 0 };
          }})
 Aadd( aArquivos, {"HORADEL.dbf",; 
          {;
          {'FUNC', 'C', 22, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'HORA1', 'C', 5, 0 },;
          {'HORA2', 'C', 5, 0 },;
          {'HORA3', 'C', 5, 0 },;
          {'HORA4', 'C', 5, 0 },;
          {'HORA5', 'C', 5, 0 },;
          {'HORA6', 'C', 5, 0 },;
          {'HORA7', 'C', 5, 0 },;
          {'HORA8', 'C', 5, 0 };
          }})
 Aadd( aArquivos, {"IMPOSTO.dbf",; 
          {;
          {'APARTIR', 'D', 8, 0 },;
          {'ALQ', 'N', 5, 2 },;
          {'IRPJ', 'N', 5, 2 },;
          {'CSLL', 'N', 5, 2 },;
          {'COFINS', 'N', 5, 2 },;
          {'PISPASEP', 'N', 5, 2 },;
          {'INSS', 'N', 5, 2 },;
          {'ICMS', 'N', 5, 2 },;
          {'IPI', 'N', 5, 2 },;
          {'USUARIO', 'C', 4, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"IMPRPED.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'RAZAO', 'C', 40, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"IVT.dbf",; 
          {;
          {'SIGLA', 'C', 2, 0 },;
          {'NCM', 'C', 10, 0 },;
          {'IVA', 'N', 6, 2 },;
          {'IVAAJUS', 'N', 6, 2 },;
          {'OIVA', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"JUSTIFIC.dbf",; 
          {;
          {'CODFC', 'C', 4, 0 },;
          {'DATA', 'D', 8, 0 },;
          {'JUST', 'C', 14, 0 },;
          {'PERM1', 'C', 5, 0 },;
          {'PERM2', 'C', 5, 0 },;
          {'TIPO', 'C', 1, 0 },;
          {'DIAS', 'N', 3, 0 },;
          {'CID', 'C', 5, 0 },;
          {'MEDIC', 'C', 30, 0 },;
          {'CRM', 'C', 8, 0 },;
          {'LOCAL', 'C', 30, 0 },;
          {'REGIST', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NOCO', 'C', 14, 0 };
          }})
 Aadd( aArquivos, {"LEMBRE.dbf",; 
          {;
          {'COD', 'C', 3, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'L1', 'C', 60, 0 },;
          {'L2', 'C', 60, 0 },;
          {'BX', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"LOG.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'DESCR', 'C', 140, 0 };
          }})
 Aadd( aArquivos, {"NFAT.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'VALOR', 'N', 9, 2 },;
          {'NFAT', 'C', 10, 0 },;
          {'DTBAX', 'D', 8, 0 },;
          {'DATAI', 'D', 8, 0 },;
          {'DATAF', 'D', 8, 0 },;
          {'REGIAO', 'C', 2, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'IMPRES', 'C', 1, 0 },;
          {'NROBX', 'C', 12, 0 };
          }})
 Aadd( aArquivos, {"NFCOMP.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 22, 0 },;
          {'NFREF', 'N', 9, 0 },;
          {'DESC', 'C', 35, 0 },;
          {'NCM', 'C', 10, 0 },;
          {'UND', 'C', 5, 0 },;
          {'STRIB', 'C', 3, 0 },;
          {'CFOP', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'BS_CALC', 'N', 14, 7 },;
          {'VL_FIN', 'N', 14, 7 },;
          {'X', 'C', 1, 0 },;
          {'DTBAIXA', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"NPD.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 20, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'CLASIF', 'C', 2, 0 },;
          {'NCLAS', 'C', 15, 0 },;
          {'VAZIL', 'C', 4, 0 },;
          {'QDEVAZ', 'N', 7, 2 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'X', 'C', 1, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRNOTA', 'N', 9, 0 },;
          {'NFENTRADA', 'N', 9, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 10, 3 },;
          {'UNIT', 'N', 12, 7 },;
          {'PGN', 'C', 1, 0 },;
          {'LTNR', 'C', 5, 0 },;
          {'VENC', 'D', 8, 0 },;
          {'OBS', 'C', 25, 0 },;
          {'NROPDC', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'NFAT', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 };
          }})
 Aadd( aArquivos, {"NRP.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 20, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'CLASIF', 'C', 2, 0 },;
          {'NCLAS', 'C', 15, 0 },;
          {'VAZIL', 'C', 4, 0 },;
          {'QDEVAZ', 'N', 7, 2 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'X', 'C', 1, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRNOTA', 'N', 9, 0 },;
          {'NFENTRADA', 'N', 9, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'CTR', 'N', 10, 3 },;
          {'UNIT', 'N', 12, 7 },;
          {'PGN', 'C', 1, 0 },;
          {'LTNR', 'C', 5, 0 },;
          {'VENC', 'D', 8, 0 },;
          {'OBS', 'C', 25, 0 },;
          {'NROPDC', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'NFAT', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 };
          }})
 Aadd( aArquivos, {"OCOR.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NOCO', 'C', 14, 0 },;
          {'SIT', 'C', 13, 0 },;
          {'RAZAO', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 16, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'CNPJ', 'C', 18, 0 },;
          {'INSCR', 'C', 15, 0 },;
          {'CPF', 'C', 14, 0 },;
          {'INSCRP', 'C', 16, 0 },;
          {'FONE1', 'C', 14, 0 },;
          {'FONE2', 'C', 14, 0 },;
          {'EMAIL', 'C', 60, 0 },;
          {'T1', 'C', 79, 0 },;
          {'T2', 'C', 79, 0 },;
          {'T3', 'C', 79, 0 },;
          {'T4', 'C', 79, 0 },;
          {'T5', 'C', 79, 0 },;
          {'T6', 'C', 79, 0 },;
          {'T7', 'C', 79, 0 },;
          {'T8', 'C', 79, 0 },;
          {'T9', 'C', 79, 0 },;
          {'T10', 'C', 79, 0 },;
          {'T11', 'C', 79, 0 },;
          {'T12', 'C', 79, 0 },;
          {'T13', 'C', 79, 0 },;
          {'T14', 'C', 79, 0 },;
          {'T15', 'C', 79, 0 },;
          {'T16', 'C', 79, 0 },;
          {'T17', 'C', 79, 0 },;
          {'ATEND', 'C', 4, 0 },;
          {'STATUS', 'C', 10, 0 },;
          {'C1', 'C', 79, 0 },;
          {'C2', 'C', 79, 0 },;
          {'C3', 'C', 79, 0 },;
          {'C4', 'C', 79, 0 },;
          {'C5', 'C', 79, 0 },;
          {'DTFIN', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"OPFLH.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODO', 'C', 4, 0 },;
          {'DESCR', 'C', 30, 0 },;
          {'CREDITO', 'C', 1, 0 },;
          {'DEBITO', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"orcmto.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 11, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'PGN', 'C', 1, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'FATURADO', 'C', 1, 0 },;
          {'VNCIMTO', 'D', 8, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'NRONF', 'C', 6, 0 },;
          {'X', 'C', 1, 0 },;
          {'BS_CALC', 'N', 14, 7 },;
          {'VL_SUBS', 'N', 14, 7 },;
          {'VL_DESC', 'N', 14, 7 },;
          {'VL_FIN', 'N', 14, 7 },;
          {'STRIB', 'C', 3, 0 },;
          {'PESS', 'C', 15, 0 },;
          {'PEDCLI', 'N', 10, 0 },;
          {'INFOR1', 'C', 65, 0 },;
          {'INFOR2', 'C', 65, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 },;
          {'USUBX', 'C', 15, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 20, 0 },;
          {'PCOMIS', 'N', 5, 2 },;
          {'IMPRES', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"PERCMER.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODM', 'C', 5, 0 },;
          {'MERCAD', 'C', 15, 0 },;
          {'TIPO', 'C', 3, 0 },;
          {'QUANT', 'N', 10, 3 },;
          {'UNIT', 'N', 12, 7 },;
          {'LOTE', 'C', 5, 0 },;
          {'MOTIVO', 'C', 45, 0 },;
          {'CODEN', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"PERDAS.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'PRELOTE', 'C', 9, 0 },;
          {'QDE', 'N', 6, 2 },;
          {'CAUSA', 'C', 10, 0 },;
          {'DEST', 'C', 10, 0 },;
          {'OBS', 'C', 30, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'DATAIN', 'D', 8, 0 },;
          {'HORA', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"PGCOM.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'NROPDC', 'C', 10, 0 },;
          {'TPOPG', 'C', 15, 0 },;
          {'VL', 'N', 11, 2 },;
          {'VNC', 'D', 8, 0 };
          }})
 Aadd( aArquivos, {"PGFAT.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 22, 0 },;
          {'DIF', 'N', 10, 2 },;
          {'FAT_GER', 'C', 10, 0 },;
          {'PG', 'C', 1, 0 },;
          {'DIFANT', 'N', 10, 2 };
          }})
 Aadd( aArquivos, {"pgfun.dbf",; 
          {;
          {'DATAPG', 'D', 8, 0 },;
          {'DTCOMP', 'D', 8, 0 },;
          {'COMPT', 'C', 15, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 30, 0 },;
          {'CARGO', 'C', 30, 0 },;
          {'TPOPG', 'C', 15, 0 },;
          {'QDIAS', 'N', 3, 0 },;
          {'VLRLQ', 'N', 8, 2 },;
          {'DESC', 'N', 8, 2 },;
          {'VLRPG', 'N', 8, 2 },;
          {'OBS', 'C', 30, 0 },;
          {'PG', 'C', 1, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'DTINC', 'D', 8, 0 },;
          {'HORAINC', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"PRLT.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'CPRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'PRELOTE', 'C', 9, 0 },;
          {'QDE', 'N', 10, 3 },;
          {'LTDEFIN', 'C', 6, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'HORA', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"PROT.dbf",; 
          {;
          {'DATAPROT', 'D', 8, 0 },;
          {'DATAPED', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 25, 0 },;
          {'VALOR', 'N', 9, 2 },;
          {'NROPED', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'HORA', 'C', 8, 0 },;
          {'NROBAIXA', 'C', 12, 0 },;
          {'PAGO', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"REAJUSTE.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'UNDCOM', 'C', 5, 0 },;
          {'VL_PRIM', 'N', 10, 2 },;
          {'USUARIO', 'C', 4, 0 },;
          {'HORA', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"REGIAO.dbf",; 
          {;
          {'CODR', 'C', 2, 0 },;
          {'REGIAO', 'C', 15, 0 };
          }})
 Aadd( aArquivos, {"RELCOM.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 25, 0 },;
          {'CDOPER', 'C', 2, 0 },;
          {'OPER', 'C', 30, 0 },;
          {'PED', 'C', 10, 0 },;
          {'VLR', 'N', 10, 2 };
          }})
 Aadd( aArquivos, {"represen.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODR', 'C', 4, 0 },;
          {'NREP', 'C', 20, 0 },;
          {'COMPLETO', 'C', 40, 0 },;
          {'ENDER', 'C', 40, 0 },;
          {'NROEND', 'C', 6, 0 },;
          {'COMPL', 'C', 20, 0 },;
          {'BAIRRO', 'C', 16, 0 },;
          {'CIDA', 'C', 30, 0 },;
          {'EST', 'C', 2, 0 },;
          {'PAIIS', 'C', 6, 0 },;
          {'CEP', 'C', 10, 0 },;
          {'CPF', 'C', 14, 0 },;
          {'RG', 'C', 16, 0 },;
          {'FONE1', 'C', 13, 0 },;
          {'FONE2', 'C', 13, 0 },;
          {'FONE3', 'C', 13, 0 },;
          {'PGMENTO', 'N', 3, 0 },;
          {'BS_CALC', 'C', 1, 0 },;
          {'EMAIL', 'C', 60, 0 },;
          {'OBS', 'C', 45, 0 },;
          {'VL_COMIS', 'N', 5, 2 },;
          {'ATIVO', 'C', 1, 0 },;
          {'BANCO', 'C', 70, 0 },;
          {'LINHA', 'C', 2, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"rgvaz.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'NFOR', 'C', 20, 0 },;
          {'CODV', 'C', 5, 0 },;
          {'VAZ', 'C', 20, 0 },;
          {'QUANT', 'N', 9, 4 },;
          {'CTR', 'N', 9, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'PGN', 'C', 1, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'VNCIMTO', 'D', 8, 0 },;
          {'CNCM', 'C', 10, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 20, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'X', 'C', 1, 0 },;
          {'FTRA', 'N', 9, 0 },;
          {'STRIB', 'C', 3, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'CODFUN', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"SIT_TRIB.dbf",; 
          {;
          {'COD', 'C', 3, 0 },;
          {'DESCRICAO', 'C', 75, 0 };
          }})
 Aadd( aArquivos, {"SLDVAZ.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'FORNEC', 'C', 20, 0 },;
          {'CDVAZ', 'C', 4, 0 },;
          {'VAZIL', 'C', 15, 0 },;
          {'SALDO', 'N', 7, 1 },;
          {'UNIT', 'N', 9, 2 },;
          {'PGN', 'C', 1, 0 },;
          {'NFAT', 'C', 10, 0 },;
          {'DESC_FAT', 'C', 10, 0 };
          }})
 Aadd( aArquivos, {"STATUS.dbf",; 
          {;
          {'NROPED', 'C', 10, 0 },;
          {'STATUS', 'C', 22, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'DATAUSU', 'D', 8, 0 },;
          {'HORAUSU', 'C', 8, 0 };
          }})
 Aadd( aArquivos, {"usuario.dbf",; 
          {;
          {'CODUSU', 'C', 4, 0 },;
          {'FANTAZIA', 'C', 15, 0 },;
          {'SENHA', 'C', 6, 0 },;
          {'DTCAD', 'D', 8, 0 },;
          {'CADASTRO', 'C', 1, 0 },;
          {'CLICAD', 'C', 1, 0 },;
          {'FORCAD', 'C', 1, 0 },;
          {'MERCAD', 'C', 1, 0 },;
          {'PROCAD', 'C', 1, 0 },;
          {'CFOCAD', 'C', 1, 0 },;
          {'CDBCAD', 'C', 1, 0 },;
          {'ESTCAD', 'C', 1, 0 },;
          {'CLACAD', 'C', 1, 0 },;
          {'EMBCAD', 'C', 1, 0 },;
          {'MUNCAD', 'C', 1, 0 },;
          {'REPCAD', 'C', 1, 0 },;
          {'TRACAD', 'C', 1, 0 },;
          {'CESCAD', 'C', 1, 0 },;
          {'VENDA', 'C', 1, 0 },;
          {'REGV', 'C', 1, 0 },;
          {'BXV', 'C', 1, 0 },;
          {'EDTV', 'C', 1, 0 },;
          {'ESTQV', 'C', 1, 0 },;
          {'ETQED', 'C', 1, 0 },;
          {'LSTV', 'C', 1, 0 },;
          {'PSQV', 'C', 1, 0 },;
          {'FTV', 'C', 1, 0 },;
          {'DVV', 'C', 1, 0 },;
          {'NFV', 'C', 1, 0 },;
          {'COMPRA', 'C', 1, 0 },;
          {'REGC', 'C', 1, 0 },;
          {'BXC', 'C', 1, 0 },;
          {'EDTC', 'C', 1, 0 },;
          {'LSTC', 'C', 1, 0 },;
          {'ESTQC', 'C', 1, 0 },;
          {'PSQC', 'C', 1, 0 },;
          {'NFE', 'C', 1, 0 },;
          {'NFSA', 'C', 1, 0 },;
          {'NFEN', 'C', 1, 0 },;
          {'NFC', 'C', 1, 0 },;
          {'ETQC', 'C', 1, 0 },;
          {'ESTOQUE', 'C', 1, 0 },;
          {'PLNE', 'C', 1, 0 },;
          {'CNCE', 'C', 1, 0 },;
          {'EDTE', 'C', 1, 0 },;
          {'RGPE', 'C', 1, 0 },;
          {'PERE', 'C', 1, 0 },;
          {'CHEQ', 'C', 1, 0 },;
          {'DPE', 'C', 1, 0 },;
          {'LJA', 'C', 1, 0 },;
          {'FNA', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"VAZIL.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODF', 'C', 4, 0 },;
          {'FORNEC', 'C', 20, 0 },;
          {'CDVAZ', 'C', 4, 0 },;
          {'VAZIL', 'C', 15, 0 },;
          {'QUANT', 'N', 7, 1 },;
          {'UNIT', 'N', 9, 2 },;
          {'SALDO', 'N', 7, 0 },;
          {'PGNPG', 'C', 1, 0 },;
          {'OBS', 'C', 15, 0 },;
          {'NFAT', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'CMANDA', 'C', 10, 0 },;
          {'USUARIO', 'C', 4, 0 };
          }})
 Aadd( aArquivos, {"vendas.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 11, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'PGN', 'C', 1, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'DIG', 'N', 3, 0 },;
          {'FATURADO', 'C', 1, 0 },;
          {'VNCIMTO', 'D', 8, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 50, 0 },;
          {'GIMP', 'C', 1, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'X', 'C', 1, 0 },;
          {'FTRA', 'N', 9, 0 },;
          {'BS_CALC', 'N', 14, 7 },;
          {'VL_SUBS', 'N', 14, 7 },;
          {'VL_DESC', 'N', 14, 7 },;
          {'VL_FIN', 'N', 14, 7 },;
          {'TALQAD', 'N', 14, 7 },;
          {'STRIB', 'C', 3, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 },;
          {'USUBX', 'C', 15, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 20, 0 },;
          {'PCOMIS', 'N', 5, 2 },;
          {'LINHA', 'C', 2, 0 },;
          {'IMPRESSO', 'C', 1, 0 },;
          {'OB', 'C', 5, 0 },;
          {'DSCLJ', 'N', 5, 2 };
          }})
 Aadd( aArquivos, {"venrepre.dbf",; 
          {;
          {'DATAP', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'NCLI', 'C', 40, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'TOTPD', 'N', 9, 2 },;
          {'ST', 'N', 9, 2 },;
          {'TOTNF', 'N', 9, 2 },;
          {'CALC', 'C', 1, 0 },;
          {'PGCOMIS', 'C', 1, 0 },;
          {'PERCENT', 'N', 5, 2 },;
          {'LIBER', 'C', 1, 0 },;
          {'OBS', 'C', 30, 0 },;
          {'CODR', 'C', 4, 0 },;
          {'USUARIO', 'C', 15, 0 };
          }})
 Aadd( aArquivos, {"VEN_M.dbf",; 
          {;
          {'DATA', 'D', 8, 0 },;
          {'CODC', 'C', 4, 0 },;
          {'CLIENTE', 'C', 20, 0 },;
          {'CODP', 'C', 5, 0 },;
          {'PRODUTO', 'C', 30, 0 },;
          {'EMBAL', 'C', 15, 0 },;
          {'QUANT', 'N', 9, 4 },;
          {'UNIT', 'N', 15, 10 },;
          {'PGN', 'C', 1, 0 },;
          {'LOTE', 'C', 6, 0 },;
          {'NROPED', 'C', 10, 0 },;
          {'DIG', 'N', 2, 0 },;
          {'FATURADO', 'C', 1, 0 },;
          {'VNCIMTO', 'D', 8, 0 },;
          {'CDOPER', 'C', 5, 0 },;
          {'OPER', 'C', 20, 0 },;
          {'SERIE', 'N', 3, 0 },;
          {'NRONF', 'N', 9, 0 },;
          {'X', 'C', 1, 0 },;
          {'FTRA', 'N', 9, 0 },;
          {'BS_CALC', 'N', 14, 7 },;
          {'VL_SUBS', 'N', 14, 7 },;
          {'VL_DESC', 'N', 14, 7 },;
          {'VL_FIN', 'N', 14, 7 },;
          {'STRIB', 'C', 3, 0 },;
          {'USUARIO', 'C', 4, 0 },;
          {'NROBX', 'C', 12, 0 },;
          {'USUBX', 'C', 15, 0 },;
          {'CODFUN', 'C', 4, 0 },;
          {'NFUNC', 'C', 20, 0 },;
          {'PCOMIS', 'N', 5, 2 },;
          {'LINHA', 'C', 2, 0 },;
          {'IMPRESSO', 'C', 1, 0 },;
          {'AT', 'C', 1, 0 };
          }})
 Aadd( aArquivos, {"xta.dbf",; 
          {;
          {'NNOTA', 'N', 10, 0 };
          }})
			 
Return( aArquivos )

*==================================================================================================*		

def CriaArquivo( cArquivo )
	LOCAL cScreen   := SaveScreen()
	LOCAL aArquivos := {}
	LOCAL cTela
	LOCAL nQtArquivos
	LOCAL nQt
	LOCAL nTam
	LOCAL nX
	LOCAL nPos
	LOCAL cHost
	
	aArquivos := ArrayArquivos()
	if cArquivo != nil
		nPos := Ascan( aArquivos,{ |oBloco|oBloco[1] = cArquivo })
		if nPos != 0
			cArquivo := aArquivos[nPos,1]

			if !ms_swap_file(cArquivo)
				Mensagem( "Aguarde, Gerando Arquivo " + cArquivo)
				ms_swap_DbCreate( cArquivo, aArquivos[ nPos, 2] )
				return true
			endif
		endif
		return false
	endif
	
	nQtArquivos := Len( aArquivos )
	for nQt := 1 To nQtArquivos
		cArquivo := aArquivos[nQt,1]
		
		if !ms_swap_file(cArquivo)			
			Mensagem("Aguarde, Gerando Arquivo " + cArquivo)
			ms_swap_DbCreate(cArquivo, aArquivos[nQt,2] )
		else			
			if NetUse( cArquivo, MULTI )
				Integridade(cArquivo, aArquivos[nQt, 2])
			else
				SetMode(oAmbiente:AlturaFonteDefaultWindows, oAmbiente:LarguraFonteDefaultWindows)
				Cls
				Quit
			endif
		endif
	Next
	resTela( cScreen )
	cTela := Mensagem("Aguarde, Fechando Base de Dados.", Cor())
	FechaTudo()
	resTela( cTela )
	Return
endef

*==================================================================================================*		

def Integridade(cArquivo, aStru )
	LOCAL aStruct	 := DbStruct()
	LOCAL lCriarDbf := OK
	LOCAL cTela
	LOCAL nConta
	LOCAL nX
	
	nConta := Len(aStru)
	cTela  := Mensagem(" Verificando Integridade do database #: ;-;" + cArquivo)
	For nX := 1 To nConta
		cCampo := aStru[nX,1] // NOME DO CAMPO
		IF !AchaCampo( aStruct, aStru, nX, cCampo )
			NovoDbf(cArquivo, aStru, cCampo, lCriarDbf )
			IF lCriarDbf = OK
				lCriarDbf := FALSO
			EndIF
		EndIF
	Next
	DbCloseArea()
	ResTela( cTela )
	return NIL
endef	

*==================================================================================================*		
	
def NovoDbf(cArquivo, aStru, cCampo, lCriarDbf )
	LOCAL cLocalNtx := cArquivo + '.' + CEXT
	LOCAL cTela     := SaveScreen()
	LOCAL cAlias    := lower(Alias())
   LOCAL cOld      := '.old'

	IF lCriarDbf
		(cAlias)->(DbCloseArea())
		Mensagem("Aguarde, renomeando Arquivo: ;-;" + cArquivo)
		ms_swap_ferase(cAlias + cOld)
		ms_swap_ferase(cAlias + ".nsx")
		ms_swap_ferase(cAlias + ".cdx")		
		ms_swap_rename(cArquivo, cAlias + cOld)
		
		Mensagem("Aguarde, Criando Arquivo Novo: ;-;" + cArquivo)		
		CriaArquivo(cArquivo)
		(cAlias)->(DbCloseArea())
				
		if NetUse(cArquivo, MONO, 2, "XTEMP")
			Mensagem("Aguarde, Incluindo Registros no arquivo Novo: ;-;" + cArquivo)
			Appe From (cAlias + cOld)
		endif			
	EndIF
	ResTela( cTela )

   cArquivo := upper(cArquivo)
   cCampo   := upper(cCampo)
	IF cArquivo = "LISTA" .AND. cCampo = "CLASSE"
		cTela := msgconverte(cCampo, cArquivo)
		Lista->(DbGoTop())
		WHILE Lista->(!Eof())
			Lista->Classe := AllTrim( Lista->Classe ) + '0'
			Lista->(DbSkip(1))
		EndDo
	EndIF
	return( ResTela( cTela ))
endef

*==================================================================================================*		

def msgconverte(cCampo, cArquivo)
		return(Mensagem("Aguarde, Convertendo campo " + cCampo + " do Arquivo :" + cArquivo))
endef

*==================================================================================================*		

def AchaCampo( aStruct, Dbf1, nX, cCampo )
	LOCAL cTipo
   LOCAL nTam
   LOCAL nDec
	LOCAL nPos := Ascan2( aStruct, cCampo, 1 )

	if nPos > 0
		cTipo := Dbf1[nX,2]
		nTam	:= Dbf1[nX,3]
		nDec	:= Dbf1[nX,4]
		// if cCampo == "ID"
		if cTipo == "+"
			return true
		endif
		return(( aStruct[ nPos, 2 ] == cTipo .AND. ;
					aStruct[ nPos, 3 ] == nTam  .AND. ;
					aStruct[ nPos, 4 ] == nDec ))
	EndIf
	return false
endef

*==================================================================================================*		

def AchaIndice(cAlias)	
   LOCAL aIndice := ArrayIndices()
   LOCAL cTela   := SaveScreen()
   LOCAL nX
	LOCAL nY

   if !ISNIL(cAlias)
      if !Used()
         WA_USE((cAlias))
			WA_LOCK((cAlias))            			
		endif		
	endif
   Sele (cAlias)
	FOR EACH nX IN aIndice		
		FOR EACH nY IN nX
         if nY:__enumindex() == 1 .and. alltrim(lower(cAlias)) != alltrim(lower(nY))
            exit
         endif
         if nY:__enumindex() == 1
            loop
         endif
         mensagem("Aguarde, Verificando Tags de indices: ;-;;#" + cAlias + "=>" + lower(nY))
			//? lower(nY), nY:__enumindex()-1, lower(OrdName(nY:__enumindex()-1))
         //? lower(nY) == lower(OrdName(nY:__enumindex()-1))			
         if !(lower(nY) == lower(OrdName(nY:__enumindex()-1)))
            (cAlias)->(DbCloseArea())
            return false
         endif
		NEXT
	NEXT
   (cAlias)->(DbCloseArea())
   return true
endef

*==================================================================================================*		

def ArrayIndices()
*----------------*
	LOCAL aArquivos := {}
//	Aadd( aArquivos, { "chepre",    "chepre1","chepre2","chepre3","chepre4", "chepre5"})
	Aadd( aArquivos, { "usuario",   "usuario1"})
	return( aArquivos )
endef

*==================================================================================================*		

Function NetUse( cBcoDados, lModo, nSegundos, cAlias )
******************************************************
LOCAL cScreen := SaveScreen()
LOCAL nArea   := 0
LOCAL Restart := OK
LOCAL cStr1
LOCAL cStr2
LOCAL cStr3
LOCAL cStr4
LOCAL cStr5
LOCAL cStr6
LOCAL lForever
LOCAL cTela
LOCAL lAberto := FALSO
P_DEF( lModo, OK )
P_DEF( nSegundos, 2 )

cBcoDados := StrTran( cBcoDados, '.DBF')
cBcoDados := StrTran( cBcoDados, '.dbf')

cAlias	 := IIF( cAlias = NIL, cBcoDados, cAlias )
lForever  := ( nSegundos = 0 )
lAberto	 := (cBcoDados)->(Used())
WHILE Restart
	WHILE ( lForever .OR. nSegundos > 0 )
		IF lModo
			Use (cBcoDados) SHARED NEW Alias ( cAlias ) VIA RDDNAME
		Else
			Use (cBcoDados) EXCLUSIVE NEW Alias ( cAlias ) VIA RDDNAME
		EndIF
		IF !NetErr()
			ResTela( cScreen )
			Return( OK )
		EndIF
		cTela := Mensagem("Tentando acesso a " + Upper(Trim(cBcoDados)) + ".DBF...")
		Inkey(.5)
		nSegundos -= .5
		ResTela( cTela )
	EndDo
	nOpcao := Conf("Acesso Negado a " + Upper(Trim( cBcoDados )) + " Novamente ? ")
	IF nOpcao = OK
		ResTart := OK
	Else
		ResTart := FALSO
		DbCloseAll()
		FChDir( oAmbiente:xBase )
		SetColor("")
		Cls
		cStr1 := "#1 Se outra esta??o estiver usando o sistema, finalize-a. ;;"
		cStr2 := "#2 Se outra esta??o estiver indexando, aguarde o t?rmino. ;;"
		cStr3 := "#3 Se SHARE estiver instalado, aumente os par?metros de   ;"
		cStr4 := "   travamento de arquivos. Ex.: SHARE /F:18810 /L:510.    ;;"
		cStr5 := "#4 Em ambiente de rede NOVELL, verifique o arquivo NET.CFG;"
		cStr6 := "   e se necess rio, acrescente a linha FILE HANDLES=127.  ;"
		Alert( cStr1 + cStr2 + cStr3 + cStr4 + cStr5 + cStr6, "W+/B")
		Break
		//Quit
	EndIF
EndDo
Return( FALSO )
