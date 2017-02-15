from math import modf
from re import match

def base_to_base(num,base=10,to=2):

  bits=[]
  temp=[]
  temp_fract,temp_int=modf(num)
  
  str_no_dec=match("(\d+)\.(\d*)",str(num))
  str_length=len(str_no_dec)
  
  print(str_no_dec,str_length)
  
  idx=0
  for digit in reversed(str_no_dec):
    temp_int+=base**idx*digit
    idx+=1

  while temp_num>0:
    temp.insert(0,temp_num%to)
    temp_num//=to
  
  idx=50
  while idx>0"
    
    if temp_fract==0:
      break
    idx-=1
    
base_to_base(62.27)
