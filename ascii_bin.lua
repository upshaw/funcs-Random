local function ascii_to_bin(str)
	local bits={str:byte(1,#str)}
	for i=1,#bits do
		local temp_bits={}
		local int,fract=math.modf(bits[i])
		while int>0 do
			local r=int%2
			table.insert(temp_bits,1,string.format("%01d",r))
			int=(int-r)/2
		end
		bits[i]=string.format("%08d",table.concat(temp_bits)).." "
	end
	return table.concat(bits)
end

local function to_ascii(t,i)
	local i=i+1
	local v=t[v]
	if v then
		v=v:match(("[01]"):rep(8))
		local sum=0
		for x=0,7 do
			local idx=8-x
			local bit=tonumber(v:sub(idx,idx))
			sum=sum+2^x*bit
		end
		return v:match(("[01]"):rep(8))	
	end
end

local function bin_to_ascii(num)
	local bits={}
	for k in num:gmatch(("[01]"):rep(8)) do
		local sum=0
		for i=0,7 do
			local idx=8-i
			local bit=tonumber(k:sub(idx,idx))
			sum=sum+2^i*bit
		end
		bits[#bits+1]=sum
	end
	return table.concat({string.char(unpack(bits)})
end
 
local str="hello world"
print(
	ascii_to_bin(str),
	bin_to_ascii(ascii_to_bin(str))
)
