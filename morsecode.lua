--brandon upshaw 12/20/16
local toMorse,toText=".","([*-/]+)%s"

local morse={}
local letters={
    ["A"]='*-',["B"]='-***',["C"]='-*-*',
    ["D"]='-**',["E"]='*',["F"]='**-*',
    ["G"]='--*',["H"]='****',["I"]='**',
    ["J"]='*---',["K"]='-*-',["L"]='*-**',
    ["M"]='--',["N"]='-*',["O"]='---',
    ["P"]='*--*',["Q"]='--*-',["R"]='*-*',
    ["S"]='***',["T"]='-',["U"]='**-',
    ["V"]='***-',["W"]='*--',["X"]='-**-',
    ["Y"]='-*--',["Z"]='--**',["0"]='-----',
    ["1"]='*----',["2"]='**---',["3"]='***--',
    ["4"]='****-',["5"]='*****',["6"]='-****',
    ["7"]='--***',["8"]='---**',["9"]='----*',
    [" "]='/',["/"]=" "
}
--populate reverse table
for k,v in next,letters do
    morse[v]=k
end

local function swapMorse(match)
    local m,a=letters[match:upper()],morse[match]
    return m and m.." " or a and a:lower() or match
end

--limited to %w,[*-/]
--usage
local str="hello world"
print(
    str:gsub(toMorse,swapMorse),
    str:gsub(toMorse,swapMorse):gsub(toText,swapMorse)
)