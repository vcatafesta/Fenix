#ifndef _FENIX_CH_
	#if defined( __PLATFORM__UNIX )
      #define _SHELLENV_  "SHELL"
   #else
      #define _SHELLENV_  "COMSPEC"
   #endif
	#include "achoice.ch"
	#include "inkey.ch"
	#include "define.ch"
	#include "dbinfo.ch"
	#Include "box.ch"
	#include "button.ch"
	#include "color.ch"
	#Include "dbinfo.ch"
	#include "dbedit.ch"
	#include "directry.ch"
	#include "ferror.ch"
	#include "error.ch"
	#Include "fileio.ch"
	#Include "fileman.ch"
	#Include "getexit.ch"
	#include "hbclass.ch"
	#include "hbdyn.ch"
	#include "hbgtinfo.ch"
	#include "hbthread.ch"	
	#include "hbver.ch"	
	#include "hbmemory.ch"	
	#include "hblang.ch"
	#include "indice.ch"
	#include "memoedit.ch"
	#include "picture.ch"   // Picture de Entrada de Dados SCI
	#include "set.ch"
	#include "setcurs.ch"
	#include "indice.ch"
	#include "rddname.ch"


//#require "hbwin"
#define FORM_A4 9
#define RGB( nR,nG,nB ) ( nR + ( nG * 256 ) + ( nB * 256 * 256 ) )
#define PS_SOLID   	0
#define BLACK           RGB( 0x0 ,0x0 ,0x0 )
#define BLUE            RGB( 0x0 ,0x0 ,0x85 )
#define GREEN           RGB( 0x0 ,0x85,0x0 )
#define CYAN            RGB( 0x0 ,0x85,0x85 )
#define RED             RGB( 0x85,0x0 ,0x0 )
#define MAGENTA         RGB( 0x85,0x0 ,0x85 )
#define BROWN           RGB( 0x85,0x85,0x0 )
#define WHITE           RGB( 0xC6,0xC6,0xC6 )
#define TRUE 		.t.
#define true 		.t.
#define OK   		.t.
#define FALSE		.f.
#define FALSO		.f.
#define NOK   		.f.
#define FORM_A4 	9
#define ESC			27

#XCOMMAND DEFAULT <v1> TO <x1> [, <vn> TO <xn> ]								;
			 =>																				;
			 IF <v1> == NIL ; <v1> := <x1> ; END									;
			 [; IF <vn> == NIL ; <vn> := <xn> ; END ]
#XCOMMAND DEFAU <v1> TO <x1> [, <vn> TO <xn> ]								;
			 =>																				;
			 IF <v1> == NIL ; <v1> := <x1> ; END									;
			 [; IF <vn> == NIL ; <vn> := <xn> ; END ]
#xcommand WA_USE( <alias> )      					=> USE <alias> SHARED NEW ;;
																	HB_DBDETACH( <(alias)> )
#xcommand WA_LOCK( <alias> )     					=> HB_DBREQUEST( <(alias)> )
#xcommand WA_UNLOCK( <alias> )   					=> HB_DBDETACH( <(alias)> )			
#translate P_Def( <var>, <val> ) 					=> IF( <var> = NIL, <var> := <val>, <var> )
#translate IfNil( <var>, <val> ) 					=> IF( <var> = NIL, <var> := <val>, <var> )
#Translate MkDir  	 	 	 							=> FT_MkDir
#Translate FChDir  	 	 	 							=> FT_ChDir	
#translate strcount       								=> GT_StrCount
#translate isarray			 							=> hb_isarray
#xtranslate alltrim(<xValue>)  						=> ltrim(rtrim(<xValue>))
#translate ifNIL( <var>, <val> )        			=> if( <var> = NIL, <var> := <val>, <var> )
#translate MS_DEFAULT( <var>, <val> )    			=> if( <var> = NIL, <var> := <val>, <var> )
#translate MS_NIL( <var>, <val> )    				=> if( <var> = NIL, <var> := <val>, <var> )
#translate TrimStr(<xValue>)      					=> alltrim(<xValue>)
#translate StrTrim(<xValue>)      					=> alltrim(<xValue>)
#translate xAllTrim(<xValue>)                	=> alltrim(<xValue>)
#translate TrimStrZero(<xValue>, <nzeros>)   	=> alltrim(strzero(<xValue>, <nzeros>))
#translate AllTrimStrZero(<xValue>, <nzeros>)   => alltrim(strzero(<xValue>, <nzeros>))
#Translate Beep				 => Tone
#Translate CapFirst			 => TokenUpper
#Translate MsRename			 => FRename
#Translate IsFile			    => File
#Translate Feof			    => HB_Feof
//#Translate MsAdvance		    => FAdvance
#Translate MsWriteLine	    => FWriteLine
#Translate MsReadLine	    => FReadLine
#Translate StrCount	    	 => GT_StrCount
#Translate ChrCount	    	 => GT_StrCount
#Translate PutKey	  	 	 	 => HB_KeyPut
//#Translate SaveVideo	  	  	 => SaveScreen

//#Translate MkDir		  	  	 => FT_MkDir
#Translate Atotal		  	  	 => FT_Asum
#Translate FIsPrinter  	  	 => FT_IsPrint  // Ft_Isprint("lpt1")
#Translate IsPrinter  	  	 => PrintReady  // Printready(1)
#Translate PrnStatus  	  	 => PrintStat
#Translate MkDir  	 	 	 => FT_MkDir
#Translate FChDir  	 	 	 => FT_ChDir
#Translate Argc 	 	 	 	 => HB_Argc
#Translate Argv 	 	 	 	 => HB_Argv
#Translate Program 	 	 	 => HB_ProgName
#Translate Encrypt 	 	 	 => HB_Crypt
#Translate Decrypt			 => HB_Decrypt
#Translate Box(				 => MS_Box(
	
//Versao 3.2/3.4
//#Translate WaitKey			 => HB_Inkey
//#Translate Inkey				 => HB_Inkey
	
//Versao 3.0
#Translate WaitKey			 => Inkey
		
//#Translate Roloc			    => FT_InvClr
#Translate Standard			 => ColorStandard
#Translate Enhanced			 => ColorEnhanced	
#Translate Unselected   	 => ColorUnselected

#xtranslate Single( <t>, <l>, <b>, <r> )               => hb_DispBox( <t>, <l>, <b>, <r>, B_SINGLE )
#xtranslate Double( <t>, <l>, <b>, <r> )               => hb_DispBox( <t>, <l>, <b>, <r>, B_DOUBLE )
#xtranslate SingleDouble( <t>, <l>, <b>, <r> )         => hb_DispBox( <t>, <l>, <b>, <r>, B_SINGLE_DOUBLE )
#xtranslate DoubleSingle( <t>, <l>, <b>, <r> )         => hb_DispBox( <t>, <l>, <b>, <r>, B_DOUBLE_SINGLE )
#xtranslate SingleUni( <t>, <l>, <b>, <r> )            => hb_DispBox( <t>, <l>, <b>, <r>, HB_B_SINGLE_UNI )
#xtranslate DoubleUni( <t>, <l>, <b>, <r> )            => hb_DispBox( <t>, <l>, <b>, <r>, HB_B_DOUBLE_UNI )
#xtranslate SingleDoubleUni( <t>, <l>, <b>, <r> )      => hb_DispBox( <t>, <l>, <b>, <r>, HB_B_SINGLE_DOUBLE_UNI )
#xtranslate DoubleSingleUni( <t>, <l>, <b>, <r> )      => hb_DispBox( <t>, <l>, <b>, <r>, HB_B_DOUBLE_SINGLE_UNI )
#xtranslate BkGrnd( <t>, <l>, <b>, <r>, <c> )          => hb_DispBox( <t>, <l>, <b>, <r>, Replicate( <c>, 9 ))
	
#Translate DiskSize   	 => FT_DskSize
//#Translate DiskFree   	 => FT_DskFree

#Translate Sx_SetScope   	 => OrdScope
#Translate Sx_ClrScope   	 => OrdScope
