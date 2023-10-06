----------------------------------------------------------------------------------
-- Company: Group 33
-- Name: Thisura G. Gallage 200176V
-- 
-- Create Date: 08/07/2022 03:09:42 PM
-- Design Name: Program Counter
-- Module Name: ProCounter - Behavioral
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

entity ProCounter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           PCount : out STD_LOGIC_VECTOR (2 downto 0));
end ProCounter;

architecture Behavioral of ProCounter is

begin
process (Clk) begin
    if (rising_edge(Clk)) then
        if Res = '1'then
            PCount <= "000";
        else
            PCount <= D;
        end if;
    end if;
end process;
end Behavioral;
