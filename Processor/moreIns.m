# goal: Create pseudoinstructions that would suit a parallel processor
# ex: vectorAdd

MULADD:
    mult $t1, $t2, t3
    addi $t1, $t1, $t5 % finishes a multiply and add ins 

%2 = arith.addf %0, %1 : f32