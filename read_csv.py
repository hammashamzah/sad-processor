import csv
import serial

#ser = serial.Serial(0)
#ser.baudrate = 115200
#print ser.name

with open('tmp_binary.csv', 'rb') as f:
	reader = csv.reader(f, delimiter=",", quoting=csv.QUOTE_NONE)
	for row in reader:
		rowvalue =  "".join(row)
		for i in range (0,5):
			eightbitbuffer = hex(int(rowvalue[i*8:(i+1)*8],2)).replace('0x','\\x')
			print eightbitbuffer
			ser.write(eightbitbuffer)
