public codnum
if digt = '10'
   if reg < 10
      stor '000000000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '00000000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '0000000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '000000'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor '00000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999999
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999999
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 999999999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '8'
   if reg < 10
      stor '0000000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '000000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '00000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 999999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '6'
   if reg < 10
      stor '00000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '5'
   if reg < 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '4'
   if reg < 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '2'
   if reg < 10
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor ltrim(str(reg)) to codnum
   endi
endi
