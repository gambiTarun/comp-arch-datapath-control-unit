# comp-arch-datapath-control-unit
Designing and implementing (in Verilog) datapath and control unit for a single cycle processor (including instruction memory)

## Block level design of the processor (datapath + control unit)

<img width="881" alt="Screen Shot 2022-10-11 at 11 22 21 PM" src="https://user-images.githubusercontent.com/22619455/195265604-e6659cb3-6116-49f8-8a0a-ca48c769684e.png">

## Types of instructions for the processor

### 1. Immediate Type

Example: li r1, constant →loads immediate signed value specified in the instruction to the register R1

<img width="812" alt="Screen Shot 2022-10-11 at 11 27 49 PM" src="https://user-images.githubusercontent.com/22619455/195266454-acf5dfd8-f42f-40ff-9781-8670655d1046.png">

### 2. Register Type (R-type)

Example: add r1, r2, r3 →adds the contents of registers r2 and r3. The result of addition is written in to the register r1

<img width="801" alt="Screen Shot 2022-10-11 at 11 27 58 PM" src="https://user-images.githubusercontent.com/22619455/195266515-2d7e4692-a3be-4d34-88f9-d8925fd5c4d4.png">

Assume there are 32 32-bit general purpose registers indicated by r0, r1, r2...r31 and corresponding register numbers (00000), (00001)...........(11111).
Assume the Opcode for Immediate type and R-type instructions as below

<img width="449" alt="Screen Shot 2022-10-11 at 11 29 59 PM" src="https://user-images.githubusercontent.com/22619455/195266907-5037692a-1905-4cd9-90ab-89d162f016ed.png">

Additionally R-type instructions have multiple variations defined by their function codes. The R-type instructions should include add, sub, AND, OR, srl (Shift right logical), sll (shift left logical) .The different R-type instructions that the processor should support are tabulated below.
 
 <img width="862" alt="Screen Shot 2022-10-11 at 11 30 06 PM" src="https://user-images.githubusercontent.com/22619455/195266939-feac8161-9010-4f4a-90f8-ba6385a8e2df.png">
 *Second source is not used for shift operations

The processor module should have only two inputs CLK and Reset. When Reset is activated the Processor starts executing instructions from 0th location of instruction memory.
