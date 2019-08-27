import struct

def sendall_termination(conn, data):
	data = data+"\r\n"
	conn.send(data)

def recvall_termination(conn):
	alldata = ''
	data_terima = ''
	while "\r\n" not in data_terima :
		data_terima = conn.recv(10)
		alldata = alldata + data_terima
	alldata = alldata.replace("\r\n", "")
	return alldata

def sendall_number(conn, data):
	# Hitung panjang data yang akan dikirim
	msg_len = len(data)
	# Pack panjang datanya dengan lib struct
	msg_len_pack = struct.pack(">I", msg_len)
	# Prepend message len ke data yang akan dikirim
	data = msg_len_pack+data
	# Kirim ke receiver
	conn.send(data)

def recvall_number(conn):
	# Baca 4-byte di awal (integer)
	msg_len_raw = conn.recv(4)
	# Unpack supaya jadi integer lagi
	msg_len = struct.unpack(">I", msg_len_raw)[0]
	# Baca sampai habis
	alldata = ''
	while len(alldata) < msg_len :
		alldata = alldata+conn.recv(10)
	return alldata