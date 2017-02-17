from re import compile
from math import modf
from string import ascii_uppercase

def base_to_base(num,base=10,to=2):
  
  chars=[]
  uppers=None
  
  max_base=max(base,to)
  if max_base>10:
      uppers=ascii_uppercase[::max_base-10]
  else:
    chars=None
  print(uppers)
  
  bits=[]
  return_bits = lambda: "".join(bits)
  
  temp_fract, temp_int = modf(num)
  
  find = compile("(\d+)\.(\d*)")
  str_data = find.match(str(num))
  str_no_dec = str_data.group(1) + str_data.group(2)
  
  idx = 0 - len(str_data.group(2))
  for digit in reversed(str_no_dec):
    temp_int+=(base**idx)*float(digit)
    idx+=1
    
  while temp_int>0:
    bits.insert(0,str(int(temp_int%to)))
    temp_int//=to
    
  if temp_fract==0:
    return return_bits()
  else:
    bits.append(".")
    
  
  idx=50
  while idx>0:
    temp_fract, temp_int = modf(temp_fract*to)
    bits.append(str(int(temp_int)))
    if temp_fract==0:
      break
    idx-=1
    
  return return_bits()



print(base_to_base(62.27,12))
