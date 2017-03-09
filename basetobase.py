from re import match
from math import modf
from string import ascii_uppercase
 
def base_to_base(num,base=10,to=2):
	bits=[]
	chars=[]
	uppers=None
	return_bits=lambda:"".join(bits)
 
	def return_finds(num):
		str_data = match(r"([\w\d+]*)\.?([\w\d]*)",str(num))
		t=str_data.groups("0")
		return t[0],t[1]
 
	def digit_value(digit,idx):
		if uppers:
			pos=uppers.find(digit)
			if pos>-1:
				return pos+1
			else:
				return (base**idx)*float(digit)
		else:
			return (base**idx)*float(digit)
 
	def analyze_data(str):
		try:
			pos=uppers.find(str)
		except:
			pass
		if pos:
			if pos>=base-10:
				print("stop")
			elif pos==-1:
				try:
					digit=int(str)
					if digit>=base:
						print("stop")
				except:
					print("stop")
 
		else:
			if int(str)>=base:
				print("stop")
 
	max_base=max(base,to)
	if max_base>10:
		uppers=ascii_uppercase[:max_base-10]
 
	for digit in str(num):
		analyze_data(digit)
 
	intg,fract=return_finds(num)
 
	idx=0-len(fract)
	temp_int=0
	for digit in reversed(intg+fract):
		temp_int+=digit_value(digit,idx)
		idx+=1
 
	while temp_int>0:
		bits.insert(0,str(int(temp_int%to)))
		temp_int//=to
 
	if not fract!="":
		return return_bits()
	else:
		bits.append(".")
 
	idx=50
	while idx>0:
		fract, temp_int = modf(fract*to)
		bits.append(str(int(temp_int)))
		if fract==0:
			break
		idx-=1
	return return_bits()
 
 
 
print(base_to_base(62,12))
