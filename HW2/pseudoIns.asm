# sets a register to 0 using clear $REGISTER 
clear:
  add $t0, $zero, $zero # add 0 and 0 and store the result in $to

# branch if less than
# a combination of set if less than and beq
ble:
  slt $at, $t5, $t3
  beq $at, $zero, Label # if t5 was not less than t3, then t5 >= t3, branch

bgt:
  slt $at, $t5, $t4 # if t5 is greater than or equal to t4, then $at is set to 0, otherwise $at is set to 1.
  bne $at, $zero, Label # 0 != 1, branch!

bge: # want to check if t5 >= t3
  slt $at, $t5, $t3 # is t5 less than t3? if so, set $t1 to 1
  beq $at, 0, Label # if t5 was not less than t3 ($t1 set to 0), then t5 was greater than or equal to t3. branch!

# BEQ FOR SMALL CONSTANT
beq:
  addi $at, $zero, small # small is a constant
  beq $at, $t1, Label

# BEQ FOR LARGE CONSTANT
beq:
  lui $at, BIG_UPPER_16 # UPPER 16 BITS OF BIG
  ori $at, $at, BIG_LOWER_16 # LOWER 16 BITS OF BIG
  beq $t1, $at, Label

# LI SMALL
li:
  addi $t1, $zero, small # we can use add since the immediate is under 2^16

# LI BIG
li:
  lui $t2, BIG_UPPER_16 # UPPER 16 BITS OF BIG
  ori $t2, $t2, BIG_LOWER_16 # LOWER 16 BITS OF BIG
  
# ADDI BIG
addi:
  lui $t0, BIG_UPPER_16 # UPPER 16 BITS OF BIG
  ori $t0, $t0, BIG_LOWER_16 # LOWER 16 BITS OF BIG
  add $t0, $t0, $t2

# LW BIG
lw:
  lui $at, BIG_UPPER_16 # load the upper part of constant into $t4
  ori $at, $at, BIG_LOWER_16 $ load the lower part of $t4 into 
  add $at, $t2, $at # add upper part of $t3
  lw $t5, 0($at)
