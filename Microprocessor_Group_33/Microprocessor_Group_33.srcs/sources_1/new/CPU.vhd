----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: 200110P Navindu Y.D. De Silva & 200645J M.G. Kasun P. Thennakoon
-- 
-- Create Date: 07/12/2022 03:04:40 PM
-- Design Name: Microprocessor CPU
-- Module Name: CPU - Behavioral
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

entity CPU is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlag : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           NegFlag : out STD_LOGIC;
           Display : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end CPU;

architecture Behavioral of CPU is

component Slow_Clk
    port(
        Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC
        );
end component;

component StartUp
    port(
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Res : out STD_LOGIC
    );
end component;

component ProgramROM
    port(
        address : in STD_LOGIC_VECTOR (2 downto 0);
        instruct : out STD_LOGIC_VECTOR (12 downto 0)
    );
end component;

component ProCounter
    port(
        D : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        PCount : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

component Instruction_Decoder
    Port ( 
           Instruct : in STD_LOGIC_VECTOR (12 downto 0);
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
           NullReg : out STD_LOGIC
    );
end component;
      
component Register_Bank
    port(
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0)
     );
end component;
     
component Mux_8_way_4_bit
    port(
        Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
        Sel : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        Mux_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component ASU_4
    port(
         A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         OpSel : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR (3 downto 0);
         Over : out STD_LOGIC;
         Neg : out STD_LOGIC;
         Zero : out STD_LOGIC
    );
end component;

component Adder_3_bit
    port(
        IN_3_bit : in STD_LOGIC_VECTOR (2 downto 0);
        OUT_3_bit : out STD_LOGIC_VECTOR (2 downto 0) 
    );
end component;

component Mux_2_way_3_bit
    port(
        In_0 : in STD_LOGIC_VECTOR (2 downto 0);
        In_1 : in STD_LOGIC_VECTOR (2 downto 0);
        Sel : in STD_LOGIC;
        Mux_out : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

component Mux_2_way_4_bit
    port(
        In_0 : in STD_LOGIC_VECTOR (3 downto 0);
        In_1 : in STD_LOGIC_VECTOR (3 downto 0);
        Sel : in STD_LOGIC;
        Mux_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component LUT_16_7
    port(
         address : in STD_LOGIC_VECTOR (3 downto 0);
         data : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

-- signals
signal Clk_slow : std_logic ;
signal Res : std_logic;                                 -- to handle the reset key
signal IsStart: std_logic_vector(1 downto 0):="01";     -- to identify the starting state

-- Busses to transfer signals across
signal Instruction_Bus : std_logic_vector (12 downto 0);
signal RegBankEn : std_logic_vector (2 downto 0);
signal LoadSelector : std_logic;
signal UpdateRegValue : std_logic_vector (3 downto 0);
signal MuxA_Sel : std_logic_vector (2 downto 0);
signal MuxB_Sel : std_logic_vector (2 downto 0);
signal Operation : std_logic;
signal IsJump : std_logic;
signal ZeroReg : std_logic;
signal JumpFlag : std_logic;
signal JumpAddress :std_logic_vector (2 downto 0);
signal Ins_Pointer : std_logic_vector (2 downto 0);
signal Next_InsPoint : std_logic_vector (2 downto 0);
signal Inc_1_Pointer : std_logic_vector (2 downto 0);
signal RegisterWrite : std_logic_vector (3 downto 0);

-- ASU signals
signal ASU_active : std_logic;
signal ASU_out : std_logic_vector (3 downto 0);
signal ASU_In_A : std_logic_vector (3 downto 0);
signal ASU_In_B : std_logic_vector (3 downto 0);
signal OverASU, ZeroASU, NegASU : std_logic :='0';

-- Register signals
signal R0, R1, R2, R3, R4, R5, R6, R7 : std_logic_vector (3 downto 0);

--- Design Code --
begin

Slow_Clk_0 : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => Clk_slow
    );

StartUpCPU : StartUp
    port map(
        Clk => Clk_slow,
        Reset => Reset,
        Res => Res
    ); 

Instruction_Decoder_0 : Instruction_Decoder
    port map(
        Instruct => Instruction_Bus,
        CheckReg => ASU_In_A,
        RegEn => RegBankEn,
        LoadSel => LoadSelector,
        ImmData => UpdateRegValue,
        RegSel_MuxA => MuxA_Sel,
        RegSel_MuxB => MuxB_Sel,
        OpSel => Operation,
        EN_ASU => ASU_active,
        JumpReady => IsJump,
        JumpAdd => JumpAddress,
        NullReg => ZeroReg
    );

P_ROM: ProgramROM
    port map(
        address => Ins_Pointer,
        instruct => Instruction_Bus
    );

Program_Counter : ProCounter
    port map(
        D => Next_InsPoint,
        Clk => Clk_slow,
        Res => Res, 
        PCount => Ins_Pointer
    );

Adder_3_bit_0 : Adder_3_bit
    port map(
        IN_3_bit => Ins_Pointer,
        OUT_3_bit => Inc_1_Pointer
    );

Mux_PCounterSel : Mux_2_way_3_bit
    port map(
        In_0 => Inc_1_Pointer,
        In_1 => JumpAddress,
        Sel => JumpFlag,
        Mux_out => Next_InsPoint
    );
    
Mux_DataSelector : Mux_2_way_4_bit
    port map(
        In_0 => ASU_out,
        In_1 => UpdateRegValue,
        Sel => LoadSelector,
        Mux_out => RegisterWrite
    );

Mux_ASU_In_A : Mux_8_way_4_bit
    port map(
        Reg_0 => R0,
        Reg_1 => R1,
        Reg_2 => R2,
        Reg_3 => R3,
        Reg_4 => R4,
        Reg_5 => R5,
        Reg_6 => R6,
        Reg_7 => R7,
        Sel => MuxA_Sel,
        En => '1',
        Mux_out => ASU_In_A
    );

Mux_ASU_In_B : Mux_8_way_4_bit
    port map(
        Reg_0 => R0,
        Reg_1 => R1,
        Reg_2 => R2,
        Reg_3 => R3,
        Reg_4 => R4,
        Reg_5 => R5,
        Reg_6 => R6,
        Reg_7 => R7,
        Sel => MuxB_Sel,
        En => '1',
        Mux_out => ASU_In_B
    );

Gen_Registers : Register_Bank
    port map(
        Clk => Clk_slow,
        Res => Res,
        D => RegisterWrite,
        Reg_EN => RegBankEn,
        Q0 => R0,
        Q1 => R1,
        Q2 => R2,
        Q3 => R3,
        Q4 => R4,
        Q5 => R5,
        Q6 => R6,
        Q7 => R7
    );

ArithmeticUnit : ASU_4
    port map(
        A => ASU_In_A,
        B => ASU_In_B,
        OpSel => Operation,
        S => ASU_out,
        Over => OverASU,
        Neg => NegASU,
        Zero => ZeroASU
    );

S7Segment : LUT_16_7
    port map(
        address => R7,
        data => Display
    );

    R0 <= "0000";
    Output <= R7;
    JumpFlag <= IsJump AND ZeroReg;
    Anode <= "1110";
    OverFlag <= OverASU AND ASU_active;
-- Checks if the operation undergoing was an addition operation before displaying the Zero Flag
    ZeroFlag <= ZeroASU AND ASU_active;    
    NegFlag <= NegASU AND ASU_active;

end Behavioral;
