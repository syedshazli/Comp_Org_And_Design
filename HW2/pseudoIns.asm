# sets a register to 0 using clear $REGISTER 
clear:
  add $t0, $zero, $zero # add 0 and 0 and store the result in $to

# branch if less than
# a combination of set if less than and beq
ble:
  slti $t1, $t3, $t5
  beq $t1, 1, Label

# if t3 was not less than 5, t1 was not set to 1, so if t1 is not equal to 1, jump to the label
# TODO: we know it follows greater than, but what about equal to? Same not for above
bgt:
  slti $t1, $t3, $t5
  bne $t1, 1, Label
