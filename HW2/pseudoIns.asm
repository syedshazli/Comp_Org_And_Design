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
  addi $t2, $zero, 1 # set a register to 1
  bne $t1, $t2, Label # 0 != 1, branch!

bge: # want to check if t5 >= t3
  slt $t1, $t5, $t3 # is t5 less than t3? if so, set $t1 to 1
  beq $t1, 0, Label # if t5 was not less than t3 ($t1 set to 0), then t5 was greater than or equal to t3. branch!

# BEQ FOR SMALL CONSTANT
beq:
  addi $t3, $zero, small # small is a constant
  beq $t3, $t1, Label

# BEQ FOR LARGE CONSTANT
beq:
  lui $t3, BIG # UPPER 16 BITS OF BIG
  ori $t3, BIG # LOWER 16 BITS OF BIG
  beq $t1, $t3, Label

# LI SMALL
li:
  addi $t1, $zero, small # we can use add since the immediate is under 2^16

# LI BIG
li:
  lui $t2, BIG # UPPER 16 BITS OF BIG
  ori $t2, BIG # LOWER 16 BITS OF BIG
  
# ADDI BIG
addi:
  lui $t0, BIG # UPPER 16 BITS OF BIG
  ori $t0, BIG # LOWER 16 BITS OF BIG
  add $t0, $t0, $t2

# LW BIG
lw:
  lui $t3, BIG # load the lower part of constant into $t3
  add $t0, $t2, $t3 # add the lower part into $t0 
  ori $t3, BIG $ load the lower part of $t3 into 
  add $t0, $t2, $t3 # add upper part of $t3
  lw $t5, 0($t0)
