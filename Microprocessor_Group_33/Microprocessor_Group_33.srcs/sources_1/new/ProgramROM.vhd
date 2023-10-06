----------------------------------------------------------------------------------
-- Company: CS 1050 - Group 33
-- Engineer: Thisura G. Gallage 200176V
-- 
-- Create Date: 07/11/2022 05:29:28 PM
-- Design Name: Program Read-Only-Memory (ROM)
-- Module Name: ProgramROM - Behavioral
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
use ieee.numeric_std.all;

entity ProgramROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruct : out STD_LOGIC_VECTOR (12 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is
type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
    signal instruct_ROM : rom_type :=(
                                            "0101110000000", --ROM 0     MOV R7,0
                                            
                                            "0100010000011", --ROM 1     MOV R1,3
                                            
                                            "0100100000001", --ROM 2     MOV R2,1
                                            
                                            "1100100000000", --ROM 3     NEG R2
                                            
                                            "1001110010000", --ROM 4     ADD R7,R1
                                            
                                            "1000010100000", --ROM 5     ADD R1,R2
                                            
                                            "0110010000110", --ROM 6     JZR R1,6
                                            
                                            "0110000000100"  --ROM 7     JZR R0,4
                                            );

begin

instruct <= instruct_ROM(to_integer(unsigned(address)));

end Behavioral;
