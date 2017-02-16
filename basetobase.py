import re as string
from math import modf

def base_to_base(num,base=10,to=2):

  bits=[]
  temp_fract, temp_int = modf(num)
  
  find=string.compile("(\d+)\.(\d*)")
  str_data = find.match(str(num))
  str_no_dec = str_data.group(1) + str_data.group(2)
  
  idx = 0 - len(str_data.group(2))
  for digit in reversed(str_no_dec):
    temp_int+=(base**idx)*float(digit)
    idx+=1
    
  while temp_num>0:
    bits.insert(0,temp_num%to)
    temp_num//=to
  
  idx=50
  while idx>0"
    #TODO: decimal conversion
    if temp_fract==0:
      break
    idx-=1
    



base_to_base(62.27)
