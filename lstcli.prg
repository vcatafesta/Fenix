   @ 00,00 clea to 23,79
   Pest='  '
   @ 00,01 say '- Listagem de Clientes' 
   @ 01,01 say 'Estado:' get Pest pict '!!'
   read
   if Pest = '  '
      retu
   endi
ty := 0
do whil ty = 0
   OI := 0
   l := 2
   dct := -1
   arq5()
   index on dscnto to I5
   set index to I5
   do whil .not. eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if ativo # 'A'
         skip
         loop
      endi
      if dscnto = dct
         skip
         loop
      endi
      @ l,01 say dscnto
      stor DSCNTO to dct
      l := l + 1
      skip
   endd
   Unlock
   Use

   @ 21,20 say 'Digite o Valor do Desconto:' get oi pict '9999.99'
   read
   @ 22,20 prompt 'IMPRIMIR TABELA'
   @ 23,20 prompt 'SAIR'
   MENU TO TY
   @ 20,01 clea to 21,40
   if TY # 1
      retu
   endi
   ARQ5()
   go top
   ln := 2
   SET DEVI TO PRINT
   SET PRINT ON
   @ 00,00 say '- Listagem de Clientes      '+'Estado de: '+Pest 
   do whil .not. eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if dscnto # oi
         skip
         loop
      endi
      if ativo # 'A'
         skip
         loop
      endi
      @ ln,00 say chr(15)
      @ ln,02 say codc+'-'+cliente
      @ ln,36 say fone1
      @ ln,55 say contato
      @ ln,75 say dscnto
      @ ln+1,02 say email
      skip
      ln := ln+2
      if ln>60
         ejec
         ln := 0
         loop
      endi
   endd
   Unlock
   Use
   set print off
   set devi to scre
   ejec
   @ 21,02 say 'Gerando relat¢rio *.TXT  ....'
   r := ' '
   nm := dtos(date)+".txt"
   set printer to C:\hb32\clamar\Relat\&nm
   set print on
   set console off
   ??'Listagem email clientes do estado: '+Pest
   ?'Desconto desses: '+ltrim(str(oi))
   ?
   arq5()
   go top
   do whil .not. eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if dscnto # oi
         skip
         loop
      endi
      if ativo # 'A'
         skip
         loop
      endi
      if email = '     '
         skip
         loop
      endi
      ?trim(email)+';'
      skip
   endd
   set console on
   set print off
   set printer to
   @ 23,02 say '* Dados Gerado com SUCESSO !!!' get R 
   read

   @ 02,00 clea to 23,79
   TY := 0
   loop
endd
