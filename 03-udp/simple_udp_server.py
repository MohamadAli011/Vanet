import socket

# Inisiasi objek socket UDP/IPv4
sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

# Bind
sock.bind( ('', 7777) )

try :
	print "Server hidup"
	while True:
		# Terima data
		data, address = sock.recvfrom(100)
		print "Menerima data "+data+" dari client"
		# Ubah datanya
		data = "OK "+data
		# Kirim balik ke client
		sock.sendto(data, address)
except KeyboardInterrupt :
	print "Server mati"