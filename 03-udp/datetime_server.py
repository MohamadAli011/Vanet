import socket
import datetime

#Inisiasi objek socket UDP/IPv4
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Bind server ke IP dan port tertentu
sock.bind( ('', 7777) )


try :
	# Buat service-nya jalan terus
	while True :
		# Baca data yang sudah dikirimkan oleh client
		# return value : data dan alamat pengirim
		data, address = sock.recvfrom(100)
		
		kembalian = ""

		if data == "today":
			kembalian = datetime.date.today().isoformat()
		elif data == "yesterday":
			kembalian = datetime.date.today()-datetime.timedelta(days=1)
			kembalian = kembalian.isoformat()
		elif data == "tomorrow":
			kembalian = datetime.date.today()+datetime.timedelta(days=1)
			kembalian = kembalian.isoformat()
		else :
			kembalian = "Pesan salah"


		#Kirim balik ke client
		sock.sendto(kembalian, address)
except KeyboardInterrupt :
	sock.close()
	print "Server mati"

