----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/24/2022 05:07:31 PM
-- Design Name: 
-- Module Name: TB_ProgramROM - Behavioral
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

entity TB_ProgramROM is
--  Port ( );
end TB_ProgramROM;

architecture Behavioral of TB_ProgramROM is
component ProgramROM
 Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
        instruct : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal address: STD_LOGIC_VECTOR (2 downto 0);
signal instruct: STD_LOGIC_VECTOR (12 downto 0);

begin
UUT: ProgramROM
port map(
address => address,
instruct => instruct
);

process
begin
--Index Number 200176 = 11 0000 110 111 110 000
address<="000";
wait for 25 ns;
address<="110";
wait for 25ns;
address<="111";
wait for 25ns;
address<="110";
wait for 25 ns;

end process;


end Behavioral;
