# sets a register to 0 using clear $REGISTER 
clear:
  add $t0, $zero, $zero # add 0 and 0 and store the result in $to

# branch if less than
# a combination of set if less than and beq
ble:
  slt $t1, $t5, $t3
  beq $t1, $zero, Label # if t5 was not less than t3, then t5 >= t3, branch

bgt:
  slt $t1, $t3, $t5 # if t3 is greater than t5, then $t1 is set to 0.
  bne $t1, 1, Label # 0 != 1, branch!

bge: # want to check if t5 >= t3
  slt $t1, $t5, $t3 # is t5 less than t3? if so, set $t1 to 1
  beq $t1, 0, Label # if t5 was not less than t3 ($t1 set to 0), then t5 was greater than or equal to t3. branch!
