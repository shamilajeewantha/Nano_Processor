----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 02:55:38 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
-- Project Name: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder
port(
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

signal Instruct : std_logic_vector (12 downto 0);
signal RegEn, RegSel_MuxA, RegSel_MuxB, JumpAdd : std_logic_vector (2 downto 0);
signal CheckReg, ImmData : std_logic_vector (3 downto 0);
signal OpSel : std_logic;
signal LoadSel, EN_ASU, JumpReady, NullReg : std_logic;

begin
UUT : Instruction_Decoder
port map(
    Instruct => Instruct,
    CheckReg => CheckReg,
    RegEn => RegEn,
    LoadSel => LoadSel,
    ImmData => ImmData,
    RegSel_MuxA => RegSel_MuxA,
    RegSel_MuxB => RegSel_MuxB,
    OpSel => OpSel,
    EN_ASU => EN_ASU,
    JumpReady => JumpReady,
    JumpAdd => JumpAdd,
    NullReg => NullReg
);

process begin
    -- Resting the Code for various instructions of type MOV, NEG, ADD and JZR

    -- Index Number - 200110P - 011 000 011 011 010 1110    
            -- Using extracts from idx number for inputs of Reg
    
    CheckReg <= "1100";                             -- (Last 4 digits of Index Number)
    Instruct <= "0100100110000";     -- MOV R2,3        (011 010) (reversed)
    wait for 100 ns;
    
    Instruct <= "1100110000000";     -- NEG R3           (011)
    wait for 100 ns;
    
    Instruct <= "0000000000000";     -- WAIT                no inputs necessary for this
    wait for 100 ns;
    
    Instruct <= "1000000110000";     -- ADD R0,R3        (000 011) (reversed)
    wait for 100 ns;
    
    Instruct <= "1010000110000";     -- SUB R0,R3        (use the same input registers as before)
    wait for 100 ns;
    
    Instruct <= "0111100000000";     -- JZR R6,0         (110 Last 3 bits of number)
    wait for 100 ns;
    CheckReg <= "0000";                         -- Testing when CheckReg is zero
    wait;
    
end process;

end Behavioral;
