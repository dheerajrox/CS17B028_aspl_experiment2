	.file	1 "exp1.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 40, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48     # adds register(sp) and (-48) and stores in register (sp)
	sw	$fp,44($sp)     # Store Word $fp at specific address.
	move	$fp,$sp		# $fp = $sp
	li	$2,10			# $2 = 10
	sw	$2,4($fp) # Store Word $2 at specific address.
	li	$2,17			# $2 = 17
	sw	$2,8($fp)  # Memory[$fp+8]=$2 
	lw	$3,4($fp)  # Memory[$fp+4]=$3
	lw	$2,8($fp) # Memory[$fp+8] = $2
	addu	$2,$3,$2 # $2 = $3 + $2
	sw	$2,12($fp)  # Memory[fp+12] = 2 # store
	lw	$3,4($fp)   #Memory[fp+4] = 3 # load
	lw	$2,8($fp)   
	subu	$2,$3,$2   # $2 = $2 - $3
	sw	$2,16($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	teq	$2,$0,7   
	div	$0,$3,$2  # $0 = $3 / $2
	mfhi	$2 # $2 = hi
	mflo	$2 # $2 = lo
	sw	$2,20($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	mul	$2,$3,$2
	sw	$2,24($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	or	$2,$3,$2
	sw	$2,28($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	and	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	xor	$2,$3,$2
	sw	$2,36($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,44($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
