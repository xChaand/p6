	.text
	.globl main
main:		# MAIN METHOD ENTRY
	# RETURN ADDRESS
	sw    $ra, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	# CONTROL LINK
	sw    $fp, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		# CURRENT AR
	subu  $sp, $sp, 0
	# CODEGEN of stmts of function
	.data
.L2:	.asciiz "hi"
	.text
	la    $t0, .L2
	sw    $t0, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	.data
.L3:	.asciiz "hid"
	.text
	la    $t0, .L3
	sw    $t0, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	# POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	# POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1
	sw    $t0, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	# POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L1
	li    $v0, 4
	.data
.L4:	.asciiz "good"
	.text
	la    $t0, .L4
	sw    $t0, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	# POP
	addu  $sp, $sp, 4
	syscall		# writting to console
	b     .L0
.L1:
	li    $v0, 4
	.data
.L5:	.asciiz "bad"
	.text
	la    $t0, .L5
	sw    $t0, 0($sp)	# PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	# POP
	addu  $sp, $sp, 4
	syscall		# writting to console
.L0:
_main_exit:		# FUNCTION EXIT
	lw    $ra, 0($fp)
	move  $t0, $fp
	lw    $fp, -4($fp)
	move  $sp, $t0
	li    $v0, 10
	syscall
