----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 07:05:34 PM
-- Design Name: 
-- Module Name: TB_Mux_2_way_4_bit - Behavioral
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

entity TB_Mux_2_way_3_bit is
--  Port ( );
end TB_Mux_2_way_3_bit;

architecture Behavioral of TB_Mux_2_way_3_bit is
component Mux_2_way_3_bit
    Port ( In_0 : in STD_LOGIC_VECTOR (2 downto 0);
           In_1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal In_0,In_1,Mux_out:STD_LOGIC_VECTOR (2 downto 0);
signal Sel: STD_LOGIC;

begin
    UUT: Mux_2_way_3_bit port map(
        In_0=>In_0,
        In_1=>In_1,
        Sel=>Sel,
        Mux_out=>Mux_out
    );
    process
        begin
        --200645J - my index number is 110 000 111 111 000 101
        In_0<="101";
        In_1<="000";
        Sel<='0';
        wait for 100 ns;
        Sel<='1';
        wait for 100 ns;
        
        In_0<="111";
        In_1<="111";
        Sel<='0';
        wait for 100 ns;
        Sel<='1';
        wait for 100 ns;
        
        In_0<="000";
        In_1<="110";
        Sel<='0';
        wait for 100 ns;
        Sel<='1';
        wait for 100 ns;
        
    end process;
end Behavioral;