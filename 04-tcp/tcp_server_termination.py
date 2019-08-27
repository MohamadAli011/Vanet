import socket
from util import recvall_termination, sendall_termination
from util import recvall_number, sendall_number

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
	data = recvall_number(conn)
	print data
	# Ubah datanya
	data = "OK "+data
	# Kirim balik ke client
	sendall_number(conn, data)
	# Close connection
	# conn.close()