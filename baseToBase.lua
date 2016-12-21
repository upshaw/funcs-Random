--brandon upshaw(newc)

local function baseToBase(n,bf,bt)
	local b,c,t,n,bf,bt,x,g,h,f={},{},0,string.format("%g",n),bf or 10,bt or 2,{},0
	for i=65,(bf>bt and bf or bt)+55 do
		c[#c+1]=tostring(i):char()
	end
	n:gsub("%w",function(m)
		if tonumber(m)>=bf or type(m)=='string' and m:upper():byte()>=bf+55 then
			error(m)
		end
	end)
	for i=#n:gsub("%.",""),1,-1 do
		local d=n:find("%.") and (n:find("%.")-1)-i or #n:gsub("%.","")-i
		print(i,d,#n:gsub("%.","")-d)
		t=t+(bf^(d))*tonumber(n:gsub("%.",""):sub(i,i))
	end
	print(t)
	local i,h=math.modf(t)
	while i>0 do
		table.insert(x,1,(i%bt>9 and c[i%bt-9]) or i%bt)
		i=(i-i%bt)/bt
	end
	if h==0 then return table.concat(x) end
	x[#x+1]="."
	while g<10 or h~=0 do
		f,h=math.modf(h*bt)
		x[#x+1]=f>9 and c[f-9] or f
		g=g+1
	end
	return table.concat(x)
end

print(
	baseToBase(62.6432,9,12)
)
