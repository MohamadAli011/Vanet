import socket

# Inisiasi socket TCP/IPv4
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Binding ke IP dan port tertentu
sock.bind( ('', 7778) )

# Listen
sock.listen(10)

while True :
	# Accept permintaan 3-way handshaking
	conn, addr = sock.accept()
	# Receive data dari client
	data = conn.recv(10)
	print data
	# Ubah datanya
	data = "OK "+data
	# Kirim balik ke client
	conn.send(data)
	# Close connection
	conn.close()