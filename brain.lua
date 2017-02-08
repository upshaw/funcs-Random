brain={
	array={["0"]=0};
	pointer="0";
	aprint=function()
		local pointer=brain.pointer
		local val=array[pointer]
		print("val: "..val," | ^: "..pointer," | char: "..(string.char(val) or "nil"))
	end;
	cell=function(s)
		local i=s=="+" and 1 or -1
		brain.array[brain.pointer]=brain.array[brain.pointer]+i
	end;
	findloop=function(s)
		local counter,index=0,1
		repeat
			local char=s:sub(index,index)
			if char=="[" then counter=counter+1
			elseif char=="]" then counter=counter-1 end
			index=index+1
		until counter==0
		return s:sub(1,index-1)
	end;
	handleloop=function(s)
		local contents=s:sub(2,#s-1)
		while brain.array[brain.pointer]>0 do
			brain.handlestring(contents)
		end
	end;
	handlestring=function(s)
		local g,n=#s
		for i=1,#s do
			local char=s:sub(i,i)
			if char~="[" and char~="]" then
				brain.syntax[char](char)
			elseif char=="[" then
				local loop=brain.findloop(s:sub(i,#s))
				n=s:sub(i+#loop)
				brain.handleloop(loop)
				break
			end
		end
		if n then brain.handlestring(n) end
	end;
	move=function(s)
		local i=s==">" and 1 or -1
		brain.pointer=tostring(tonumber(brain.pointer)+i)
		if not brain.array[brain.pointer] then
			brain.array[brain.pointer]=0
		end
	end;
	decode=function(string)
		local s=""
		string:gsub("[%[%]%.<>%+%-]",function(m)s=s..m end)
		brain.handlestring(s)
	end;
	syntax={
		["+"]=brain.cell;["-"]=brain.cell;
		[">"]=brain.move;["<"]=brain.move;
		["."]=brain.aprint;
	}
}


local code=[[
   ++++++++[
   >++++[
    >++
    >+++
    >+++
    >+
    <<<<-
   ]>+
   >+
   >-
   >>+
   [<]
   <-
  ]
  >>.
  >---.
  +++++++..
  +++.
  >>.
  <-.
  <.
  +++.
  ------.
  --------.
  >>+.
  >++.
]] 
brain.decode(code)
