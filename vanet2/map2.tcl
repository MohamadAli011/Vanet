# set number of nodes
set opt(nn) 42

# set activity file
set opt(af) $opt(config-path)
append opt(af) /activity.tcl

# set mobility file
set opt(mf) $opt(config-path)
append opt(mf) /mobility.tcl

# set start/stop time
set opt(start) 0.0
set opt(stop) 300.0

# set floor size
set opt(x) 888.44
set opt(y) 952.07
set opt(min-x) 28.79
set opt(min-y) 0.03

