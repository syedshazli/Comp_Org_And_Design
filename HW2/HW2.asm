sum:
  # TODO: Add a bne instruction for the while loop, comparing i to input n
  addi $sp, $sp, -8 # make space for i and sum
  sw $t0, 4($sp) # save register $t0 for use afterwards (For sum)
  sw $s0, 0($sp) # save register $s0 for use afterwards (for i)

  addi $t0, $t0, $zero # initialize i to 0
  addi $s0, $s0, $zero # initialize sum to 0

  j loop

loop:
  be $t0, a1,exit # exit if i == n
  j loop # i != n, jump back to the loop

exit:
  add $v0, $t0, $zero # store return type sum in return value register
  lw $t0, 4($sp) # restore registers to previous values
  lw $s0, 0($sp) # restore registers to previous values
  addi $sp, $sp, 8 # restore stack pointer
  jr $ra # jump to return address
