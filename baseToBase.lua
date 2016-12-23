--brandon upshaw(newc)

local function baseToBase(n,f,t)
	local b,c,a,p={},{},0
	n,f,t=type(n)=='number' and string.format("%.10g",n) or n:upper(),f or 10,t or 2
	for i=65,(f>t and f or t)+54 do
		c[#c+1]=string.char(i)
	end
	local function checker(i)
		i=tonumber(i)==nil and i or tonumber(i)
		if type(i)=='number' then
			if i>f then error(i..": is a invalid number") end
		else if i:byte()>f+54 then error(i..": is an invalid number") end end
	end
	n:gsub("[%u%d]",checker)
	p,n=-#n:match("[%u%d]+%.?([%u%d]*)"),n:gsub("%.","")
	local g=p
	for i=#n,1,-1 do
		local s=c[n:byte(i,i)-64] and n:byte(i,i)-55 or tonumber(n:sub(i,i))
		a=a+f^g*s
		g=g+1
	end
	local i,h,f=math.modf(a)
	while i>0 do
		table.insert(b,1,(i%t>9 and c[i%t-9]) or string.format("%g",i%t))
		i=(i-i%t)/t
	end
	if p==0 then return table.concat(b) end
	b[#b+1]="."
	local o=1
	while h~=0 or o>500 do
		f,h=math.modf(h*t)
		b[#b+1]=f>9 and c[f-9] or f
		o=o+1
	end
	return table.concat(b)
end

print(
	baseToBase("5A2",12,10),
	baseToBase(525),
	baseToBase("3G",21),
	baseToBase(123261,7,14)
)
