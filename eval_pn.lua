unary={["~"]=true,["!"]=true}
operators={
	["+"]=function(a,b) return a+b end,
	["-"]=function(a,b) return a-b end,
	["*"]=function(a,b) return a*b end,
	["/"]=function(a,b) return a/b end,
	["%"]=function(a,b) return a%b end,
	[">>"]=function(a,b) return a>>b end,
	["<<"]=function(a,b) return a<<b end,
	["^"]=function(a,b) return a^b end,
	["~"]=function(a) return ~a end,
	["!"]=function(a) return a>1 and a*operators["!"](a-1) or 1 end
}

function extract(expr,verbose)
	local i,l=1
	while i<=#expr do
		if verbose and expr~=l then print("expression: ",expr) l=expr end
		local op=expr:sub(1,i-1):match("%s-(%S-)%s-$")
		local op0=expr:match("%S+",i)
		local op1=expr:match("[^%s]+",#op0+i+1)
		if #op>0 and #op<3 and op0 and not operators[op0] and op0~=op then
			if not op and not operators[op] or expr:match(".#INF") then
				return expr
			end
			op0,op1=tonumber(op0),tonumber(op1)
			lb0=op0 and #tostring(op0) or 0
			lb1=op1 and #tostring(op1) or 0
			if (op0 and not operators[op0]) and ((op1 and not operators[op1]) or unary[op]) then
				local n=unary[op] and i+lb0+1 or i+lb0+lb1+2
				expr=expr:sub(1,i-#op-1)..tostring(operators[op](op0,op1))..expr:sub(n)
				i=1
			else
				i=operators[op0] and i+lb0+1 or i+lb0+lb1+2
			end
		else
			i=i+1
		end
	end				
end

expression="/ 6.6 + * 2 7 4"
verbose=true --print out each expression to be evaluated
print("\nresult: ",extract(expression,verbose))
