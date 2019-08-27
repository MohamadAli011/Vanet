import socket

#Inisiasi objek socket UDP/IPv4
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

data = raw_input("Masukkan data : ")

# Kirim data ke server
sock.sendto(data, ('127.0.0.1', 7777) )
# Terima data kembalian dari server
data, address = sock.recvfrom(100)
# Cetak data yang diterima dari server
#print "Client menerima data "+data+" dari server"
print data