local function acsii_to_bin(str)
	local bits={}
	str=tostring(str)
	for i=1,#str do
		local bit=str:byte(i,i)
		local int,fract=math.modf(bit)
		while int>0 do
			local r=int%2
			table.insert(bits,1,tostring(r))
			int=(int-r)/2
		end
		bits[#bits+1]=" "
	end
	return table.concat(bits)
end

local function binary_to_ascii(num)
	local bits,sum={},0
	num=tostring(num)
	for k in num:gmatch(("[01]"):rep(8)) do
		for i=0,7 do
			local idx=8-i
			local bit=tonumber(k:sub(idx,idx))
			sum=sum+2^i*bit
		end
		bits[#bits+1],sum=string.char(sum),0
	end
	return table.concat(bits)
end
