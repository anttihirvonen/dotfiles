# from hex
h2d(){
    echo "ibase=16; $@"|bc
}

h2b(){
    echo "ibase=16; obase=2; $@"|bc
}

# from decimal
d2h(){
    echo "obase=16; $@"|bc
}

d2b(){
    echo "obase=2; $@"|bc
}

# from binary
b2d(){
    echo "ibase=2; $@"|bc
}

b2he(){
    # see how obase is set in binary? :)
    echo "ibase=2; obase=10000; $@"|bc
}
