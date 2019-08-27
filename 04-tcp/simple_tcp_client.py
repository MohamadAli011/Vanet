import socket

# Inisiasi socket TCP/IPv4
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Inisiasi 3-way handshaking
sock.connect( ('127.0.0.1', 7778) )
# Kirim string ke server
sock.send("Hello Hello Hello Hello")
# Terima balasan dari server
data = sock.recv(10)
# Cetak data
print data
# Tutup koneksi
sock.close()