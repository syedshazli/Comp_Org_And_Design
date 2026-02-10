sum:
  # TODO: Add a bne instruction for the while loop, comparing i to input n
  addi $sp, $sp, -8 # make space for i and sum
  sw $t0, 4($sp) # save register $t0 for use afterwards (For sum)
  sw $s0, 0($sp) # save register $s0 for use afterwards (for i)

  addi $t0, $zero, $zero # initialize i to 0
  addi $s0, $zero, $zero # initialize sum to 0

  j loop # go to the loop unconditionally

loop:
  add $t1, $t0, $t0
  add $t1, $t1, $t1 # indexing for accessing a[i]
  add $t1, $t1, $a0 # access address of a[i]
  lw $t2, 0($t1) # load a[i] in temp reg l2
  add $a1, $a1, $t2 # sum = sum + a[i]
  be $t0, $a1, exit # exit if i == n
  add $t0, $t0, 1 # increment i if not equal
  j loop # i != n, jump back to the loop

exit:
  add $v0, $t0, $zero # store return type sum in return value register
  lw $t0, 4($sp) # restore registers to previous values
  lw $s0, 0($sp) # restore registers to previous values
  addi $sp, $sp, 8 # restore stack pointer
  jr $ra # jump to return address
