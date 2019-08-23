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
set val(nn)     11                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1043                      ;# X dimension of topography
set val(y)      1043                      ;# Y dimension of topography
set val(stop)   10.0                         ;# time of simulation end

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
set tracefile [open hasil.tr w]
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
#Create 13 nodes
set n0 [$ns node]
$n0 set X_ 200
$n0 set Y_ 100
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 200
$n1 set Y_ 400
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 500
$n2 set Y_ 100
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 800
$n3 set Y_ 100
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 901
$n4 set Y_ 400
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 1000
$n5 set Y_ 300
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 245
$n6 set Y_ 125
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 465
$n7 set Y_ 65
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 165
$n8 set Y_ 145
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 538
$n9 set Y_ 125
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 865
$n10 set Y_ 365
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 465
$n11 set Y_ 125
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20

$ns at 0.0 " $n0 color blue"
$n0 color "blue"
$ns at 0.0 "$n0 label RSU"
$ns at 0.0 " $n1 color blue"
$n1 color "blue"
$ns at 0.0 "$n1 label RSU"
$ns at 0.0 " $n2 color blue"
$n2 color "blue"
$ns at 0.0 "$n2 label RSU"
$ns at 0.0 " $n3 color blue"
$n3 color "blue"
$ns at 0.0 "$n3 label RSU"
$ns at 0.0 " $n4 color blue"
$n4 color "blue"
$ns at 0.0 "$n4 label RSU"
$ns at 0.0 " $n5 color blue"
$n5 color "blue"
$ns at 0.0 "$n5 label RSU"

$ns at 1.1 " $n9 color red"
$n9 color "red"

#===================================
#        Generate movement          
#===================================
$ns at 0,1 " $n6 setdest 765 125 100 " 
$ns at 5,2 " $n6 setdest 865 365 100 " 
$ns at 0,1 " $n7 setdest 245 65 80 " 
$ns at 0,2 " $n9 setdest 650 125 100 " 
$ns at 0,1 " $n11 setdest 765 125 150 " 
$ns at 3,0 " $n11 setdest 865 365 100 " 

#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n9 $udp0

set udp1 [new Agent/UDP]
$ns attach-agent $n5 $udp1

$ns connect $udp0 $udp1
#$udp0 set packetSize_ 1500

Agent/UDP instproc process_data {size data} {
    global ns
    $self instvar node_

    # note in the trace file that the packet was received
    $ns trace-annotate "[$node_ node-addr] received {$data}"

}
#set kir "$udp0 send 25 K1"

#$ns at 1.0 "$kir start"
#$ns at 5.0 "$kir stop"

$ns at 1.1 "$udp0 send 25 K1 "
$ns at 1.2 "$udp0 send 25 K1 "
$ns at 1.3 "$udp0 send 25 K1 "
$ns at 1.4 "$udp0 send 25 K1 "



#$ns at 9 "finish"

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
#set cbr5 [new Application/Traffic/CBR]
#$cbr5 attach-agent $udp0
#$cbr5 set packetSize_ 1000
#$cbr5 set rate_ 1.0Mb
#$cbr5 set random_ null
#$ns at 1.0 "$cbr5 start"
#$ns at 5.0 "$cbr5 stop"


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
