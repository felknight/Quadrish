#!/bin/python 
import struct

f1 = "C:/Quadris/Quadris/colors.bin"
f2 = "C:/Quadris/Android/app/src/main/assets/colors.bin" 

f = open("Colors.bmp","rb")
frm = "=ccLHHLLLLHHLLLLLL"
bytes_read = f.read(struct.calcsize(frm))
if not bytes_read : exit()
bmphead = struct.unpack(frm, bytes_read)
if not (bmphead[0] == 'B' and bmphead[1] == 'M') : exit()
if bmphead[6] != 40:
	print "Format not supported"
	exit()
if bmphead[10] != 24:
	print "Must be 24 bpp BMP"
	exit()

print "Exporting to ", f1, ",", f2,"\n"
print "Size: ",bmphead[2]
print "Offset: ",bmphead[5]
coln = bmphead[2]-bmphead[5]
print "Colors:",coln/3

f.seek(bmphead[5])
f1f = open(f1,"wb")
f1f.write(struct.pack("=L",coln/3))
f1f.write(f.read(coln));
f1f.close

f.seek(bmphead[5])
f2f = open(f2,"wb")
f2f.write(struct.pack("=L",coln/3))
f2f.write(f.read(coln));
f2f.close

f.close