----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 12:59:39 PM
-- Design Name: 
-- Module Name: TB_Adder_3_bit - Behavioral
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

entity TB_Adder_3_bit is
--  Port ( );
end TB_Adder_3_bit;

architecture Behavioral of TB_Adder_3_bit is
component Adder_3_bit
    Port ( IN_3_bit : in STD_LOGIC_VECTOR (2 downto 0);
           OUT_3_bit : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal IN_3_bit_sim , OUT_3_bit_sim : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : Adder_3_bit
    PORT MAP(
    IN_3_bit => IN_3_bit_sim,
    OUT_3_bit => OUT_3_bit_sim
    );
    
    process
    begin
    --MY index no = 200274 = 110 000 111 001 010 010
    IN_3_bit_sim <= "010";
    wait for 100ns;
    IN_3_bit_sim <= "001";
    wait for 100ns;
    IN_3_bit_sim <= "111";
    wait for 100ns;
    IN_3_bit_sim <= "000";
    wait for 100ns;
    IN_3_bit_sim <= "110";
    wait;
    
    end process;   
end Behavioral;
