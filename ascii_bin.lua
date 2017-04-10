local function ascii_to_bin(str)
	local bits={}
	str=tostring(str)
	for i=1,#str do
		local temp_bits={}
		local bit=str:byte(i,i)
		local int,fract=math.modf(bit)
		while int>0 do
			local r=int%2
--			print(string.format("%01d",r))
			table.insert(temp_bits,1,string.format("%01d",r))
			int=(int-r)/2
		end
		bits[#bits+1]=string.format("%08d",table.concat(temp_bits)).." "
	end
	return table.concat(bits)
end
 
local function bin_to_ascii(num)
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
 
local str="hello world"
print(
	ascii_to_bin(str),
	ascii_to_bin(bin_to_ascii(str))
)
