# sets a register to 0 using clear $REGISTER 
clear:
  add $t0, $zero, $zero # add 0 and 0 and store the result in $to

# branch if less than
# a combination of set if less than and beq
ble:
  slti $t1, $t3, $t5
  beq $t3, $t5, Label
  beq $t1, 1, Label

bgt:
  slti $t1, $t3, $t5
  bne $t1, 1, Label

bgt:
  slti $t1, $t3, $t5
  beq $t3, $t5, Label # adheres to the or equal to case
  bne $t1, 1, Label
