----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: Navindu Y. D. De Silva - 200110P
-- 
-- Create Date: 07/09/2022 02:46:18 PM
-- Design Name: Instruction Decoder for a Microprocessor
-- Module Name: Instruction_Decoder - Behavioral
-- Project Name: Microprocessor
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port ( Instruct : in STD_LOGIC_VECTOR (12 downto 0);
           CheckReg : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSel : out STD_LOGIC;
           ImmData : out STD_LOGIC_VECTOR (3 downto 0);
           RegSel_MuxA : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel_MuxB : out STD_LOGIC_VECTOR (2 downto 0);
           OpSel : out STD_LOGIC;
           En_ASU : out STD_LOGIC;
           JumpReady : out STD_LOGIC;
           JumpAdd : out STD_LOGIC_VECTOR (2 downto 0);
           NullReg : out STD_LOGIC);
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
    -- For each new instruction
    process (Instruct, CheckReg) begin
    
    -- Supplementary signal to check if Subtraction operation is active
    -- SubSignal <= Instruct(12) AND NOT(Instruct(11)) AND Instruct(10);

    -- When the Arithmetic Unit is required to do a Subtraction operation
        -- it will send the input B to the ASU's first input (input A) which has a negation
        -- and will send the input A to the ASU's second input (input B) which will pass as normal

    -- Location of the 1st Register to be sent to Arithmetic Unit
        -- When Arithmetic Unit is not required it will send the relevant Register 
    --RegSel_MuxA <= Instruct(9) & Instruct(8) & Instruct(7);
    RegSel_MuxA(2) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(9)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(6));
    RegSel_MuxA(1) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(8)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(5));
    RegSel_MuxA(0) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(7)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(4));
    
    -- Location of the 2nd Register to be sent to Arithmetic Unit
        -- When Arithmetic Unit is not required it will send 000 to the unit
    --RegSel_MuxB <= Instruct(6) & Instruct(5) & Instruct(4);
    RegSel_MuxB(2) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(6)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(9));
    RegSel_MuxB(1) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(5)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(8));
    RegSel_MuxB(0) <= (NOT(Instruct(12) AND NOT(Instruct(11)) AND Instruct(10)) AND Instruct(4)) OR (Instruct(12) AND NOT(Instruct(11)) AND Instruct(10) AND Instruct(7));
    
    -- Location of Register enabled to be updated
    RegEn <= Instruct(9) & Instruct(8) & Instruct(7);
    
    -- Value to be updated into the Register for MOV instruction
        -- During the other instructions, value is not transferred as LoadSel is set as 0
    ImmData <= Instruct(3) & Instruct(2) & Instruct(1) & Instruct(0);
    
    -- Next ROM address to jump to if jump condition satisfied
    JumpAdd <= Instruct(2) & Instruct(1) & Instruct(0);
    
    -- Control Signal sent to 2-way-4-bit Mux to select data to be sent to enabled Register
        -- If MOV instruction (OpCode 010), LoadSel = 1 (Sends value in ImmData)
        -- Other instructions, LoadSel = 0 (Sends output of Arithmetic Unit)
    LoadSel <= NOT(Instruct(12)) AND Instruct(11) AND NOT(Instruct(10));
    
    -- Control Signal sent to Arithmetic Unit for type of operation
        -- OpSel = 1 when the ASU must do a Negation operation for either Subtraction or Negation operation
    OpSel <= Instruct(12) AND (Instruct(11) OR Instruct(10));
    
    -- Control Signal sent to ASU to notify a mathematical operation is done by the ASU
        -- If ADD, NEG, SUB Instruction En_ASU = 1 (OpCode 1xx)
    EN_ASU <= Instruct(12);
    
    -- Control signal to indicate if Jump Instruction is sent to Decoder
        -- If JZR instruction (OpCode 011), JumpReady = 1
    JumpReady <= NOT(Instruct(12)) AND Instruct(11) AND Instruct(10);
    
    -- Control Signal to check if the CheckReg is 0000
    NullReg <= NOT(CheckReg(0) OR CheckReg(1) OR CheckReg(2) OR CheckReg(3));
    
    -- Both JumpReady and NullReg will be sent to the Program Counter Selector Mux
    
    end process;
end Behavioral;
