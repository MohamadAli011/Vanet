# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     42                          ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      888                      ;# X dimension of topography
set val(y)      952                      ;# Y dimension of topography
set val(stop)   300.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
##Create 6 nodes
#set n0 [$ns node]
#$n0 set X_ 200
#$n0 set Y_ 199
#$n0 set Z_ 0.0
#$ns initial_node_pos $n0 20
#set n1 [$ns node]
#$n1 set X_ 350
#$n1 set Y_ 199
#$n1 set Z_ 0.0
#$ns initial_node_pos $n1 20
#set n2 [$ns node]
#$n2 set X_ 500
#$n2 set Y_ 199
#$n2 set Z_ 0.0
#$ns initial_node_pos $n2 20
#set n3 [$ns node]
#$n3 set X_ 1179
#$n3 set Y_ 476
#$n3 set Z_ 0.0
#$ns initial_node_pos $n3 20
#set n4 [$ns node]
#$n4 set X_ 165
#$n4 set Y_ 56
#$n4 set Z_ 0.0
#$ns initial_node_pos $n4 20
#set n6 [$ns node]
#$n6 set X_ 1298
#$n6 set Y_ 102
#$n6 set Z_ 0.0
#$ns initial_node_pos $n6 20
# set activity file

set opt(af) $opt(config-path)
append opt(af) /activity.tcl

# set mobility file
set opt(mf) $opt(config-path)
append opt(mf) /mobility.tcl

#===================================
#        Generate movement          
#===================================
#$ns at 0,2 " $n4 setdest 593 44 40 " 
#$ns at 2 " $n6 setdest 976 200 2 " 

#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
#set tcp0 [new Agent/TCP]
#$ns attach-agent $n4 $tcp0
#set sink2 [new Agent/TCPSink]
#$ns attach-agent $n3 $sink2
#$ns connect $tcp0 $sink2
#$tcp0 set packetSize_ 1500


#===================================
#        Applications Definition        
#===================================
#Setup a FTP Application over TCP connection
#set ftp0 [new Application/FTP]
#$ftp0 attach-agent $tcp0
#$ns at 1.0 "$ftp0 start"
#$ns at 2.0 "$ftp0 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
