#
# Copyright (C) 2001 by USC/ISI
# All rights reserved.                                            
#                                                                
# Redistribution and use in source and binary forms are permitted
# provided that the above copyright notice and this paragraph are
# duplicated in all such forms and that any documentation, advertising
# materials, and other materials related to such distribution and use
# acknowledge that the software was developed by the University of
# Southern California, Information Sciences Institute.  The name of the
# University may not be used to endorse or promote products derived from
# this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
# 

# @(#) $Header: /cvsroot/nsnam/ns-2/tcl/ex/udpdata.tcl,v 1.1 2001/11/20 21:46:38 buchheim Exp $ (USC/ISI)

#
#  This is a simple demonstration of how to send data in UDP datagrams
#

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
set val(nn)     5                          ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1156                       ;# X dimension of topography
set val(y)      400                        ;# Y dimension of topography
set val(stop)   25.0                       ;# time of simulation end

set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

$ns color 0 blue
$ns color 1 red

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

## open trace files
#set f [open outUDP.tr w]
#$ns trace-all $f
#set nf [open outUDP.nam w]
#$ns namtrace-all $nf

#Open the NS trace file
set tracefile [open outUDP1.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open outUDP1.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

######################################################################
## create topology.  three nodes in line: (0)--(2)--(1)
#set n0 [$ns node]
#set n1 [$ns node]
#set n2 [$ns node]
##set n3 [$ns node]

#$ns duplex-link $n0 $n2 2Mb 10ms DropTail
#$ns duplex-link $n2 $n1 1.5Mb 10ms DropTail

#$ns duplex-link-op $n0 $n2 orient right
#$ns duplex-link-op $n2 $n1 orient right

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
#Create 5 nodes
set n0 [$ns node]
$n0 set X_ 300
$n0 set Y_ 500
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 500
$n1 set Y_ 600
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 700
$n2 set Y_ 600
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20

$ns at 0.5 " $n0 setdest 250 500 20 " 

# create UDP agents
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

set udp1 [new Agent/UDP]
$ns attach-agent $n2 $udp1

$ns connect $udp0 $udp1



# The "process_data" instance procedure is what will process received data
# if no application is attached to the agent.
# In this case, we respond to messages of the form "ping(###)".
# We also print received messages to the trace file.
Agent/UDP instproc process_data {size data} {
	global ns
	$self instvar node_

	# note in the trace file that the packet was received
	$ns trace-annotate "[$node_ node-addr] received {$data}"

}


# Setting the class allows us to color the packets in nam.
$udp0 set class_ 0
$udp1 set class_ 2

# Now, schedule some messages to be sent, using the UDP "send" procedure.
# The first argument is the length of the data and the second is the data
# itself.  Note that you can lie about the length, as we do here.  This allows
# you to send packets of whatever size you need in your simulation without
# actually generating a string of that length.  Also, note that the length
# you specify must not be larger than the maximum UDP packet size (the default
# is 1000 bytes)
# if the send procedure is called without a second argument (e.g. "send 100")
# then a packet of the specified length (or multiple packets, if the number
# is too high) will be sent, but without any data.  In that case, process_data
# will not be called at the receiver.

$ns at 0.6 "$udp0 send 724 ping(42)"
$ns at 0.7 "$udp1 send 100 countdown(5)"
$ns at 0.8 "$udp0 send 500 {kecelakaan}"
$ns at 0.9 "$udp1 send 828 {ping  (12345678)}"

$ns at 1.0 "finish"

proc finish {} {
	global ns tracefile namfile
	$ns flush-trace
	close $tracefile
	close $namfile

	puts "running nam..."
	exec nam outUDP1.nam &
	exit 0
}

$ns run

