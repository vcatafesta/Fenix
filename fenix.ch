#include "button.ch"
#include "inkey.ch"
#include "box.ch"
#include "indice.ch"
#include "hbclass.ch"
#include "achoice.ch"
#include "memoedit.ch"
#include "fileman.ch"
#include "define.ch"
#include "getexit.ch"


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
#xcommand WA_USE( <alias> )      => USE <alias> SHARED NEW ;;
                                       HB_DBDETACH( <(alias)> )
#xcommand WA_LOCK( <alias> )     => HB_DBREQUEST( <(alias)> )
#xcommand WA_UNLOCK( <alias> )   => HB_DBDETACH( <(alias)> )			
#translate P_Def( <var>, <val> ) => IF( <var> = NIL, <var> := <val>, <var> )
#translate IfNil( <var>, <val> ) => IF( <var> = NIL, <var> := <val>, <var> )
#Translate MkDir  	 	 	 => FT_MkDir
#Translate FChDir  	 	 	 => FT_ChDir	
 
			 