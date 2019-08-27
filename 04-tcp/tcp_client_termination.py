import socket
from util import recvall_termination, sendall_termination
from util import recvall_number, sendall_number

# Inisiasi socket TCP/IPv4
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Inisiasi 3-way handshaking
sock.connect( ('127.0.0.1', 7778) )
# Kirim string ke server
data = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cuius quidem, quoniam Stoicus fuit, sententia condemnata mihi videtur esse inanitas ista verborum. Quod autem principium officii quaerunt, melius quam Pyrrho; Duo enim genera quae erant, fecit tria. Tum Triarius: Posthac quidem, inquit, audacius. Si de re disceptari oportet, nulla mihi tecum, Cato, potest esse dissensio. Quae contraria sunt his, malane? Duo Reges: constructio interrete. An potest cupiditas finiri? Res enim fortasse verae, certe graves, non ita tractantur, ut debent, sed aliquanto minutius. Non igitur potestis voluptate omnia dirigentes aut tueri aut retinere virtutem."
sendall_number(sock, data)
# Terima balasan dari server
data = recvall_number(sock)
# Cetak data
print data
# Tutup koneksi
sock.close()