'reinit'
'sdfopen C:\exam\coads_climatology.cdf'

'set t 2'
'set lon 100 300'
'set lat -45 45'

'set gxout shaded'
'set cint 2'
'set cterp off'
'd sst'

'set gxout contour'
'set cint 2'
'set cterp off'
'd sst'

'set gxout vector'
'd uwnd;vwnd'

'enable print C:\exam\1.gmf'
'print'
'disable'

*还有一个要求是把3月份风场数据输出到nc文件，不会。