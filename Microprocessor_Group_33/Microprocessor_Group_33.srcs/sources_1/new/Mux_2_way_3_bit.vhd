----------------------------------------------------------------------------------
-- Company: Group 33
-- Engineer: 200645J M.G. Kasun P. Thennakoon
--
-- Create Date: 07/09/2022 01:36:58 PM
-- Design Name: 2 way Multiplexer - 3 bit
-- Module Name: Mux_2_way_3_bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2_way_3_bit is
    Port ( In_0 : in STD_LOGIC_VECTOR (2 downto 0);
           In_1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is

begin

    Mux_out(0) <= (In_1(0) AND SEL) OR (In_0(0) AND NOT(Sel));
    Mux_out(1) <= (In_1(1) AND SEL) OR (In_0(1) AND NOT(Sel));
    Mux_out(2) <= (In_1(2) AND SEL) OR (In_0(2) AND NOT(Sel));

end Behavioral;