from re import compile
from math import modf
from string import ascii_uppercase

def base_to_base(num,base=10,to=2):
    
  chars=[]
  uppers=None
  
  #add chars if needed
  max_base=max(base,to)
  if max_base>10:
      uppers=ascii_uppercase[:max_base-10]
      
  #check if number is valid
  for digit in str(num):
    if type(digit) is str:
      pos=uppers.find(digit)
      try:
        pos==-1 or pos>=base-10
      except Exception as error:
        print(error)
    else:
      try:
        digit>=base
      except Exception as error:
        print(Error)
  
  bits=[]
  return_bits = lambda: "".join(bits)
  
  temp_fract, temp_int = modf(num)
  
  #parse to find all the numbers
  find, boolean = None, false
  if temp_fract!=0:
    find=compile("([\u\d+]*)\.([\u\d]*)")
    boolean=true
  else:
    find=compile("([\u\d+]*)")
  str_data = find.match(str(num))
  
  str_no_dec=str_data.group(1)
  if boolean:
        str_no_dec+=str_data.group(2)
  
  #convert to decimal
  idx = 0 if boolean else 0-len(str_data.group(2))
  for digit in reversed(str_no_dec):
    temp_int+=(base**idx)*float(digit)
    idx+=1
  
  #convert integral part to __to__ base
  while temp_int>0:
    bits.insert(0,str(int(temp_int%to)))
    temp_int//=to
  
  #check if fractional part needs converting
  if not boolean:
    return return_bits()
  else:
    bits.append(".")
  
  #convert fractional parts
  idx=50
  while idx>0:
    temp_fract, temp_int = modf(temp_fract*to)
    bits.append(str(int(temp_int)))
    if temp_fract==0:
      break
    idx-=1
    
  return return_bits()



print(base_to_base(62,12))
