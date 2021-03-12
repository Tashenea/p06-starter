//If R0 is > 0 go to memory address in R1, otherwise go to memory address in R2
@R0							//[2,@R0,@,R0,0]
D=M							//[3,D=M,D,M,]
@:NotGreaterThanZero		//[2,@:NotGreaterThanZero,@,:NotGreaterThanZero,16]
D;JGT						//[4,D;JGT,D,JGT,]
@R1							//[2,@R1,@,R1,1]
A=M							//[3,A=M,A,M,]
0;JMP						//[4,0;JMP,0,JMP,]
(:NotGreaterThanZero)		//[0,(:NotGreaterThanZero),:NotGreaterThanZero,]
@R2							//[2,@R2,@,R2,2]
A=M							//[3,A=M,A,M,]
0;JMP						//[4,0;JMP,0,JMP,]


//First pass: translate all labels (REQUIRED) and variables (OPTIONAL)
//Only process instruction type 0 (for labels)
//Goal: add a symbols table entry for all label pseudo instructions at the appropriate line number
//Therefore, at end of first pass, symbols[":NotGreaterThanZero"] = 7

//On 2nd pass, actually convert our commands into assembly