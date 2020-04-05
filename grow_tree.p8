pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
clouds={}

function cloud() 
	local c={
		x=rnd(120),
		y=rnd(160),
		s=rnd(100),
		t=function(self)
			if self.s<50 then
				spr(2,self.x,self.y,2,1)
			else
				spr(4,self.x,self.y,4,3)
			end
		end,
		grow=function(self)
			self.y=self.y+8
			if self.y > 160 then
				self.x = rnd(120)
				self.y = -32
			end
		end
	}
	add(clouds,c)
	return c
end

timer = 20
height = 0
f = 0
win = false
p = false
s = false

function init()
	palt(0,false)
	palt(12,true)
	for i=1,10 do
		start(cloud())
	end
end

function tick()
	f=f+1
	if f%30==0 and not win and s then
		timer = timer - 1
		if timer == 0 then
			win = true
		end
	end
	if s then
		if not win then
			if btn(5) and not p then
				p = true
				height = height + 1
				for i=1,#clouds do
					clouds[i]:grow()
				end
			end
			if not btn(5) and p then
				p = false
			end
		end
	else
		if btnp(5) then
			s = true
		end
	end
	cls(12)
	tick_ent()
	print("❎ to grow!",44,50,10)
	print("time: "..timer,4,4)
	print("height: "..height,4,12)
	spr(9,95,75,2,4)
	spr(9,95,75+32,2,4)
	spr(12,85,60,4,2)
	spr(12,70,70,4,2)
	spr(12,100,75,4,2)
	spr(12,90,80,4,2)
end


-->8
ent={}

function start(e)
	if e.i then
		e:i()
	end
	add(ent,e)
end

function _init()
	init()
end

function tick_ent()
	i=1
	while i<=#ent do
		ent[i]:t()
		if ent[i].d then
			del(ent,ent[i])
		else
			i=i+1
		end
	end
end

function _update()
	tick()
end

__gfx__
ccccccccccccccccccc777ccc7777ccccccccccccccc777ccccccccccccccccccccccccccc5995445444252ccccccccccccccccccc33bbbbbbbbbbcc3ccccccc
cccccccccccccccccc77777c777777ccccccc7777cc777777777cccccccccccccccccccccc5995445444252cccccccccccccccccccbbbbbbbbccbbbbbbcccccc
cc7cc7cccccccccccc7777777777777cccccc777777777777777cccccccccccccccccccccc5995445544252ccccccccccccccccccb3b3bbbbbbbbbbbbbc3cccc
ccc77cccccccccccc77777766777777cccccc777777777777777cccccccccccccccccccccc5995444544252cccccccccccccccccbb33bbbbbbbbbbbbbb333ccc
ccc77cccccccccccc77777666777777cccccc777777777766666cccccc7ccccccccccccccc5995444544252cccccccccccccccc3bbb3bbbbbbbbbbb3bb3c3ccc
cc7cc7cccccccccc7777666667777766ccccc77777776666666677777777cccccccccccccc5995444544252ccccccccccc33bbbbbbbbbbbbbb3bb33bb33333cc
cccccccccccccccc7777666677777766cccc7777766666666666777777777ccccccccccccc5955444544252cccccccccbbbbb33bbbbbbbbb33333b33c33c55c3
ccccccccccccccccc777777777776666ccc77777766666666677777777777ccccccccccccc5954445444252cccccccccbbbbbbbbbbb33bbb333bbbb33355555c
cccccccccccccccccc77766666666666cc77777776666667777777777777666ccccccccccc5954444544252ccccccccc333cbbbbbbb3bb3bbbb33cb333555353
ccccccccccccccccccccc666666666ccc777777777777777777777777776666ccccccccccc5954445542252ccccccccccc33bbbbbbbb3b3b33cc3b3333533555
cccccccccccccccccccccccccccccccc7777777777777777777777777776666ccccccccccc5954445242552cccccccccccccbcbb3b3bccb3bbbbbb3355533355
cccccccccccccccccccccccccccccccc7777777777777777777777777666666cccccccccc55954455222552ccccccccccbbbbbbbbb3333b3353333333555535c
cccccccccccccccccccccccccccccccc777766666777777777777776666666ccccccccccc59554454442252ccccccccccccbbbcbb3bbc33b355c5553555333cc
cccccccccccccccccccccccccccccccc77666666666677777777776666666cccccccccccc59544454444252ccccccccccccccccbb3c3bb555555553333335ccc
ccccccccccccccccccccccccccccccccc76666666666666777776666666cccccccccccccc59544454444252cccccccccccccccccc5533353335c5335555ccccc
cccccccccccccccccccccccccccccccccc66666cccc666666666666666ccccccccccccccc59544454444252ccccccccccccccccccc555c5555553333cccccccc
ccccccccccccccccccccccccccccccccccccccccccccc66666666666cccccccccccccccc5995445442242552cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccc6666666666ccccccccccccccccc5995455442222552cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccc6666ccccccccccccccccc55955454442525522cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc59954454442225522cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc59954454442255522cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc59954454442255522cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc59954454442255222cccccccccccccccccccccccccccccccccccccccc
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc59955454442255252cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc5995454442255252cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc5995454442552252cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc5995454442552552cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc5995454442552552cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc5995454442552552cccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc599545444255252ccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc599545444255252ccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc599545444255252ccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
