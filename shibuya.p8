pico-8 cartridge // http://www.pico-8.com
version 27
__lua__
-- shibuya
-- by torin (@yurkth)

function _init()
 poke(0x5f15,133)
 poke(0x5f16,134)
 scene.active(scene.title)
end

scene={
 active=function(s)
  s.init()
  _update=s.update
  _draw=s.draw
 end
}

scene.title={
 init=function()
	 ts=false
	 fx0=16 fy0=25 fx1=111 fy1=72
 end,
 update=function()
  if btn(🅾️) then
   ts=true
  end
  if ts then
   fx0=lerp(fx0,0,.1)
   fy0=lerp(fy0,0,.1)
   fx1=lerp(fx1,128,.1)
   fy1=lerp(fy1,128,.1)
   if (flr(fx0)==flr(fy0) and flr(fx1)==flr(fy1)) scene.active(scene.game)
  end
 end,
 draw=function()
  cls(7)
  print("press z to start",33,98,5)
  frame(fx0,fy0,fx1,fy1)
 end
}


scene.game={
 init=function() end,
 update=function() end,
 draw=function()
  cls(7)
  frame(0,0,127,127)
  spr12t(1,4.5,.5,1,2)
  spr12t(4,9,1)
  spr12t(5,3,2)
  spr12t(6,8,5)
  spr12t(7,2,8)
 end
}
-->8
-- util

function spr12(n,x,y,w,h,flip_x,flip_y)
 local sw=12*(w or 1)
 local sh=12*(h or 1)
 sspr(12*(n%10),12*flr(n/10),sw,sh,x,y,sw,sh,flip_x or false,flip_y or false)
end

function spr12t(n,cx,cy,...)
 spr12(n,12*cx+4,12*cy+4,...)
end

function round(val)
 return flr(val+.5)
end

function lerp(s,e,t)
 return s+(e-s)*t
end

function frame(x0,y0,x1,y1)
 local w=x1-x0+1
 local h=y1-y0+1
 function edgev(sx,sy,flip_x,flip_y)
  sspr(8,18,4,5,x0+sx,y0+sy,4,5,flip_x,flip_y)
 end
 function rectv(rx,ry,rw)
  rectfill(x0+rx,y0+9+ry,x0+w+rw,y0+h-10-ry)
 end
 function sprv(sx,flip_x)
  sspr(5,13,2,8,x0+sx,y0+h/2-4,2,8,flip_x)
 end
 color(5)
 edgev(0,4,false,true)
 edgev(0,h-9,false,false)
 edgev(w-4,4,true,true)
 edgev(w-4,h-9,true,false)
 local offv=flr(h*.15)
 rectv(2,0,-3)
 rectv(1,round(offv/2),-2)
 rectv(0,offv,-1)
 sprv(1,false)
 sprv(w-3,true)
 
 function edgeh(sx,sy,flip_x,flip_y)
  sspr(7,12,5,4,x0+sx,y0+sy,5,4,flip_x,flip_y)
 end
 function recth(rx,ry,rh)
  rectfill(x0+9+rx,y0+ry,x0+w-10-rx,y0+h+rh)
 end
 function sprh(sy,flip_y)
  sspr(2,16,8,2,x0+w/2-4,y0+sy,8,2,false,flip_y)
 end
 edgeh(4,0,false,true)
 edgeh(w-9,0,true,true)
 edgeh(4,h-4,false,false)
 edgeh(w-9,h-4,true,false)
 local offh=flr(w*.15)
 recth(0,2,-3)
 recth(round(offh/2),1,-2)
 recth(offh,0,-1)
 sprh(1,true)
 sprh(h-3,false)
 
 rectfill(x0+4,y0+4,x0+w-5,y0+h-5,7)
 clip(x0+4,y0+4,w-8,h-8)
end
__gfx__
77777777777700550000550000000005500000550000550000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000700575555750000000055750000575555750000000000000000000000000000000000000000000000000000000000000000000000000000000000
70700000070700577777750000000577750000577777750000000000000000000000000000000000000000000000000000000000000000000000000000000000
70070000700700575775750000000577575500577777750000000000000000050000500000055005500000550000550000000000000000000000000000000000
70007007000700577557750000005777777500577777750000000000000000005005000000005005000005005005005000000000000000000000000000000000
70000770000700575555750000005777775000577777750000055555500000055555500000055555500000055555500000000000000000000000000000000000
70000770000700577777750000005777750000577777750000577777750000577777750000577777750000577777750000000000000000000000000000000000
70007007000700577777750000057777750000577777750000575775750000575775750000575775750000575775750000000000000000000000000000000000
70070000700755577777755555557777755555577777755505575775755005575775755005575775755005575775755000000000000000000000000000000000
70700000070757575775757557757777757557577777757500577777750000577777750000577777750000577777750000000000000000000000000000000000
70000000000757575775757557577775757557577777757500055555500000055555500000055555500000055555500000000000000000000000000000000000
77777777777757575775757557575775757557577557757500005005000000005005000000005005000000005005000000000000000000000000000000000000
eeeeeee0555557575555757557575775757557575775757500000000000000000000000000000000000000005555000000000000000000000000000000000000
eeeee585000057755775577555557557557557755555577500000000000000000000000000000000000000005555000000000000000000000000000000000000
eeeee555005057777777777557777777777557777777777500000000000000050550500000000000000000005555000000000000000000000000000000000000
eeeee550550055555555555555555555555555555555555500550000550000575775750000055555500000006666000000000000000000000000000000000000
ee85588558ee57777777777557777777777557777777777505775005775000575775750000005555000000555555550000000000000000000000000000000000
ee55588555ee57777557777557777777777557777777777505775555775000055555500000055555500000055555500000000000000000000000000000000000
eeeee55e000557777557777557777777777557777777777500577777750000577777750000577777750000577777750000000000000000000000000000000000
eeeee55e050557777557777557777777777557777777777500575775750000575775750000575775750000575775750000000000000000000000000000000000
eeeee58e500557777557777557777777777557777777777505575775755005575775755005575775755005575775755000000000000000000000000000000000
eeeeeeee500557777777777557777777777557777777777500577777750000577777750000577777750000577777750000000000000000000000000000000000
eeeeeeee055057777777777557777777777557777777777500055555500000055555500000055555500000055555500000000000000000000000000000000000
eeeeeeeeeeee55555555555555555555555555555555555500005005000000005005000000005005000000005005000000000000000000000000000000000000
