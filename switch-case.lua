		local function switch(v)
			return function(t)
				local function check(k)
					if type(k)=='function' then
						return k
					elseif type(k)=='string' then
						return assert(loadstring(k))
					end
					return error
				end
				if t["case"..v] then 
					check(t["case"..v])(v)
				elseif t.default then
					check(t.default)(v)
				end
			end
		end
		
		local function achieved(n)
			print("case "..n.." was acheived")
		end
		
		local num=4
		switch(num){
			case1=achieved;
			case3=achieved;
			case4=
				[[local a=0
				while true do
					a=a+1
					print(a)
					if a==10 then break end
				end]];
			default=print
		}
