# A 3 nodes example for ad hoc simulation with AODV
# Define options
set val(chan)       Channel/WirelessChannel     ;# channel type
set val(prop)       Propagation/TwoRayGround    ;# radio-propagation model
set val(netif)      Phy/WirelessPhy             ;# network interface type
set val(mac)        Mac/802_11                  ;# MAC type
set val(ifq)        Queue/DropTail/PriQueue     ;# interface queue type
set val(ll)         LL                          ;# link layer type
set val(ant)        Antenna/OmniAntenna         ;# antenna model
set val(ifqlen)     100                         ;# max packet in ifq
set val(nn)         32                          ;# number of mobilenodes
set val(rp)         AODV                        ;# routing protocol
set val(x)          9500                        ;# X dimension of topography
set val(y)          600                         ;# Y dimension of topography
set val(stop)       800                         ;# time of simulation end

set ns          [new Simulator]
set tracefd     [open akhirv2v.tr w]
set namtrace    [open akhirv2v.nam w]

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

# Create nn mobilenodes [$val(nn)] and attach them to the channel.
set chan_1_ [new $val(chan)]

# konfigurasi node
$ns node-config -adhocRouting $val(rp) \
-llType $val(ll) \
-macType $val(mac) \
-channel $chan_1_ \
-ifqType $val(ifq) \
-ifqLen $val(ifqlen) \
-antType $val(ant) \
-propType $val(prop) \
-phyType $val(netif) \
-topoInstance $topo \
-agentTrace ON \
-routerTrace ON \
-macTrace OFF \
-movementTrace ON

#untuk node
for {set i 0} {$i < $val(nn) } { incr i } {
    set node_($i) [$ns node]
}

# peletakan lokasi node
$node_(0) set X_ 9490.0 #awal
$node_(0) set Y_ 290.0
$node_(0) set Z_ 0.0
$node_(1) set X_ 9300.0 #ragunan (190)
$node_(1) set Y_ 240.0
$node_(1) set Z_ 0.0
$node_(22) set X_ 8775.0 #ragunan-deptan(525)
$node_(22) set Y_ 230.0
$node_(22) set Z_ 0.0
$node_(2) set X_ 8250.0 #deptan 1 (1050)
$node_(2) set Y_ 240.0
$node_(2) set Z_ 0.0
$node_(3) set X_ 8025.0 #smk 57  (225)
$node_(3) set Y_ 240.0
$node_(3) set Z_ 0.0
$node_(4) set X_ 7675.0 #jatipadang 2 (350)
$node_(4) set Y_ 240.0
$node_(4) set Z_ 0.0
$node_(5) set X_ 7125.0 #pejaten 3 (550)
$node_(5) set Y_ 240.0
$node_(5) set Z_ 0.0
$node_(6) set X_ 6900.0 #buncit indah (225)
$node_(6) set Y_ 240.0
$node_(6) set Z_ 0.0
$node_(23) set X_ 6550.0 #buncit indah-warung jati (350)
$node_(23) set Y_ 230.0
$node_(23) set Z_ 0.0
$node_(7) set X_ 6200.0 #warung jati(700)
$node_(7) set Y_ 240.0
$node_(7) set Z_ 0.0
$node_(24) set X_ 5775.0 #warung jati- imigrasi (425)
$node_(24) set Y_ 230.0
$node_(24) set Z_ 0.0
$node_(25) set X_ 5350.0 #warung jati-imigrasi (425)
$node_(25) set Y_ 230.0
$node_(25) set Z_ 0.0
$node_(26) set X_ 4925.0 #warung jati-imigrasi (425)
$node_(26) set Y_ 230.0
$node_(26) set Z_ 0.0
$node_(8) set X_ 4500.0 #imigrasi 4 (1700)
$node_(8) set Y_ 240.0
$node_(8) set Z_ 0.0
$node_(9) set X_ 4225.0 #durentiga 5 (225)
$node_(9) set Y_ 240.0
$node_(9) set Z_ 0.0
$node_(10) set X_ 3675.0 #mampang prapatan
$node_(10) set Y_ 240.0
$node_(10) set Z_ 0.0
$node_(28) set X_ 3275.0 #kuningan timur
$node_(28) set Y_ 390.0
$node_(28) set Z_ 0.0
$node_(29) set X_ 3275.0 #kuningan timur
$node_(29) set Y_ 540.0
$node_(29) set Z_ 0.0
$node_(30) set X_ 3275.0 #kuningan timur
$node_(30) set Y_ 140.0
$node_(30) set Z_ 0.0
$node_(31) set X_ 3275.0 #kuningan timur
$node_(31) set Y_ 40.0
$node_(31) set Z_ 0.0
$node_(11) set X_ 3275.0 #kuningan timur
$node_(11) set Y_ 240.0
$node_(11) set Z_ 0.0
$node_(12) set X_ 2975.0 #patra kuningan
$node_(12) set Y_ 240.0
$node_(12) set Z_ 0.0
$node_(13) set X_ 2625.0 #depkes
$node_(13) set Y_ 240.0
$node_(13) set Z_ 0.0
$node_(14) set X_ 2200.0 #gor sumantri
$node_(14) set Y_ 240.0
$node_(14) set Z_ 0.0
$node_(15) set X_ 2025.0 #karet kuningan
$node_(15) set Y_ 240.0
$node_(15) set Z_ 0.0
$node_(16) set X_ 1850.0 #kuningan madya
$node_(16) set Y_ 240.0
$node_(16) set Z_ 0.0
$node_(17) set X_ 1600.0 #setiabudi utara aini
$node_(17) set Y_ 240.0
$node_(17) set Z_ 0.0
$node_(18) set X_ 1100.0 #latuharhari
$node_(18) set Y_ 240.0
$node_(18) set Z_ 0.0
$node_(19) set X_ 650.0 #halimun
$node_(19) set Y_ 240.0
$node_(19) set Z_ 0.0
$node_(27) set X_ 325.0 #halimun-dukuh atas (325)
$node_(27) set Y_ 230.0
$node_(27) set Z_ 0.0
$node_(20) set X_ 50.0 #dukuh atas
$node_(20) set Y_ 240.0
$node_(20) set Z_ 0.0
$node_(21) set X_ 10.0 #mobil 2
$node_(21) set Y_ 190.0
$node_(21) set Z_ 0.0



# Generation of movements
$ns at 1.0 "$node_(0) setdest 9300.0 290.0 15.0" 
$ns at 20.0 "$node_(0) setdest 8250.0 290.0 15.0" 
$ns at 95.0 "$node_(0) setdest 8200.0 290.0 15.0"
$ns at 105.0 "$node_(0) setdest 8025.0 290.0 15.0" 
$ns at 125.0 "$node_(0) setdest 7725.0 290.0 15.0" 
$ns at 150.0 "$node_(0) setdest 7675.0 290.0 15.0" 
$ns at 165.0 "$node_(0) setdest 7175.0 290.0 15.0" 
$ns at 210.0 "$node_(0) setdest 7125.0 290.0 15.0" 
$ns at 220.0 "$node_(0) setdest 6900.0 290.0 15.0"
$ns at 240.0 "$node_(0) setdest 6200.0 290.0 15.0"
$ns at 290.0 "$node_(0) setdest 4800.0 290.0 15.0"
$ns at 390.0 "$node_(0) setdest 4500.0 290.0 15.0"
$ns at 415.0 "$node_(0) setdest 4300.0 290.0 15.0"
$ns at 435.0 "$node_(0) setdest 4225.0 290.0 15.0"
$ns at 445.0 "$node_(0) setdest 3675.0 290.0 15.0"
$ns at 490.0 "$node_(0) setdest 3275.0 290.0 15.0"
$ns at 525.0 "$node_(0) setdest 2975.0 290.0 15.0"
$ns at 550.0 "$node_(0) setdest 2625.0 290.0 15.0"
$ns at 580.0 "$node_(0) setdest 2200.0 290.0 15.0"
$ns at 615.0 "$node_(0) setdest 2025.0 290.0 15.0"
$ns at 635.0 "$node_(0) setdest 1850.0 290.0 15.0"
$ns at 655.0 "$node_(0) setdest 1600.0 290.0 15.0"
$ns at 675.0 "$node_(0) setdest 1100.0 290.0 15.0"
$ns at 715.0 "$node_(0) setdest 650.0 290.0 15.0"
$ns at 750.0 "$node_(0) setdest 50.0 290.0 15.0"
$ns at 790.0 "$node_(0) setdest 20.0 290.0 15.0"
$ns at 800.0 "$node_(0) setdest 10.0 290.0 15.0"

$ns at 1.0 "$node_(21) setdest 50.0 190.0 15.0" 
$ns at 10.0 "$node_(21) setdest 650.0 190.0 15.0" 
$ns at 60.0 "$node_(21) setdest 1100.0 190.0 15.0"
$ns at 95.0 "$node_(21) setdest 1600.0 190.0 15.0" 
$ns at 135.0 "$node_(21) setdest 1850.0 190.0 15.0" 
$ns at 160.0 "$node_(21) setdest 2025.0 190.0 15.0" 
$ns at 180.0 "$node_(21) setdest 2200.0 190.0 15.0" 
$ns at 200.0 "$node_(21) setdest 2625.0 190.0 15.0" 
$ns at 235.0 "$node_(21) setdest 2975.0 190.0 15.0"
$ns at 265.0 "$node_(21) setdest 3275.0 190.0 15.0"
$ns at 290.0 "$node_(21) setdest 3675.0 190.0 15.0"
$ns at 325.0 "$node_(21) setdest 4225.0 190.0 15.0"
$ns at 365.0 "$node_(21) setdest 4300.0 190.0 15.0"
$ns at 375.0 "$node_(21) setdest 4500.0 190.0 15.0"
$ns at 395.0 "$node_(21) setdest 4800.0 190.0 15.0"
$ns at 420.0 "$node_(21) setdest 6200.0 190.0 15.0"
$ns at 520.0 "$node_(21) setdest 6900.0 190.0 15.0"
$ns at 570.0 "$node_(21) setdest 7125.0 190.0 15.0"
$ns at 590.0 "$node_(21) setdest 7175.0 190.0 15.0"
$ns at 600.0 "$node_(21) setdest 7675.0 190.0 15.0"
$ns at 640.0 "$node_(21) setdest 7725.0 190.0 15.0"
$ns at 650.0 "$node_(21) setdest 8025.0 190.0 15.0"
$ns at 675.0 "$node_(21) setdest 8200.0 190.0 15.0"
$ns at 693.0 "$node_(21) setdest 8250.0 190.0 15.0"
$ns at 700.0 "$node_(21) setdest 9300.0 190.0 15.0"
$ns at 800.0 "$node_(21) setdest 9490.0 190.0 15.0"

# Set a TCP connection between node (0) and node (1)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (2)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 3
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (3)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 4
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(3) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (4)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 5
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (5)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 6
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (6)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 7
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (7)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 8
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (8)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 9
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (9)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 10
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (10)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 11
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (11)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 12
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (12)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 13
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(12) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (13)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 14
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(13) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (14)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 15
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (15)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 16
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(15) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (16)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 17
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(16) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (17)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 18
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (18)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 19
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(18) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (19)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 20
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (20)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 21
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (0) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 22
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (20)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 23
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (19)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 24
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (18)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 25
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(18) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (17)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 26
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (16)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 27
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(16) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (15)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 28
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(15) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (14)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 29
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (13)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 30
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(13) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (12)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 31
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(12) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (11)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 32
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (10)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 33
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (9)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 34
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (8)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 35
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (7)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 36
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (6)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 37
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (5)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 38
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (4)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 39
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (3)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 40
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(3) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (2)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 41
set sink [new Agent/TCPSink]
$ns attach-agent $node_(0) $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (21) and node (1)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 42
set sink [new Agent/TCPSink]
$ns attach-agent $node_(21) $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (22) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 43
set sink [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (22) and node (1)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 44
set sink [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp
$ns attach-agent $node_(1) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (22) and node (2)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 45
set sink [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (22) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 46
set sink [new Agent/TCPSink]
$ns attach-agent $node_(22) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (23) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 47
set sink [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (23) and node (6)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 48
set sink [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (23) and node (7)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 49
set sink [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (23) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 50
set sink [new Agent/TCPSink]
$ns attach-agent $node_(23) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (24) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 51
set sink [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (24) and node (7)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 52
set sink [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (24) and node (25)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 53
set sink [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp
$ns attach-agent $node_(25) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (24) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 54
set sink [new Agent/TCPSink]
$ns attach-agent $node_(24) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (25) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 55
set sink [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (25) and node (24)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 56
set sink [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp
$ns attach-agent $node_(24) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (25) and node (26)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 57
set sink [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp
$ns attach-agent $node_(26) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (25) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 58
set sink [new Agent/TCPSink]
$ns attach-agent $node_(25) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (26) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 59
set sink [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (26) and node (25)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 60
set sink [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp
$ns attach-agent $node_(25) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (26) and node (8)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 61
set sink [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (26) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 62
set sink [new Agent/TCPSink]
$ns attach-agent $node_(26) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (1) and node (2)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 63
set sink [new Agent/TCPSink]
$ns attach-agent $node_(1) $tcp
$ns attach-agent $node_(2) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (2) and node (3)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 64
set sink [new Agent/TCPSink]
$ns attach-agent $node_(2) $tcp
$ns attach-agent $node_(3) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (3) and node (4)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 65
set sink [new Agent/TCPSink]
$ns attach-agent $node_(3) $tcp
$ns attach-agent $node_(4) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (4) and node (5)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 66
set sink [new Agent/TCPSink]
$ns attach-agent $node_(4) $tcp
$ns attach-agent $node_(5) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (5) and node (6)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 67
set sink [new Agent/TCPSink]
$ns attach-agent $node_(5) $tcp
$ns attach-agent $node_(6) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (6) and node (7)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 68
set sink [new Agent/TCPSink]
$ns attach-agent $node_(6) $tcp
$ns attach-agent $node_(7) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (7) and node (8)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 69
set sink [new Agent/TCPSink]
$ns attach-agent $node_(7) $tcp
$ns attach-agent $node_(8) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (8) and node (9)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 70
set sink [new Agent/TCPSink]
$ns attach-agent $node_(8) $tcp
$ns attach-agent $node_(9) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (9) and node (10)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 71
set sink [new Agent/TCPSink]
$ns attach-agent $node_(9) $tcp
$ns attach-agent $node_(10) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (10) and node (11)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 72
set sink [new Agent/TCPSink]
$ns attach-agent $node_(10) $tcp
$ns attach-agent $node_(11) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (11) and node (12)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 73
set sink [new Agent/TCPSink]
$ns attach-agent $node_(11) $tcp
$ns attach-agent $node_(12) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (12) and node (13)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 74
set sink [new Agent/TCPSink]
$ns attach-agent $node_(12) $tcp
$ns attach-agent $node_(13) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (13) and node (14)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 75
set sink [new Agent/TCPSink]
$ns attach-agent $node_(13) $tcp
$ns attach-agent $node_(14) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (14) and node (15)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 76
set sink [new Agent/TCPSink]
$ns attach-agent $node_(14) $tcp
$ns attach-agent $node_(15) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (15) and node (16)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 77
set sink [new Agent/TCPSink]
$ns attach-agent $node_(15) $tcp
$ns attach-agent $node_(16) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (16) and node (17)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 78
set sink [new Agent/TCPSink]
$ns attach-agent $node_(16) $tcp
$ns attach-agent $node_(17) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (17) and node (18)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 79
set sink [new Agent/TCPSink]
$ns attach-agent $node_(17) $tcp
$ns attach-agent $node_(18) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (18) and node (19)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 80
set sink [new Agent/TCPSink]
$ns attach-agent $node_(18) $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (19) and node (20)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 81
set sink [new Agent/TCPSink]
$ns attach-agent $node_(19) $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (27) and node (21)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 82
set sink [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp
$ns attach-agent $node_(21) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (27) and node (0)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 83
set sink [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp
$ns attach-agent $node_(0) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (27) and node (19)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 84
set sink [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp
$ns attach-agent $node_(19) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Set a TCP connection between node (22) and node (20)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 85
set sink [new Agent/TCPSink]
$ns attach-agent $node_(27) $tcp
$ns attach-agent $node_(20) $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 1.0 "$ftp start"
$ns at 800.0 "$ftp stop"

# Define node initial position in nam
for {set i 0} {$i <$val(nn)} { incr i } {

# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i <$val(nn) } { incr i } {
$ns at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "stop"
$ns at 800.01 "puts \"end simulation\" ; $ns halt"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
}

$ns run
