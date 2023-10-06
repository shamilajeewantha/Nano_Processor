----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 12:51:40 PM
-- Design Name: 
-- Module Name: TB_Mux_8_way_4_bit - Behavioral
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

entity TB_Mux_8_way_4_bit is
--  Port ( );
end TB_Mux_8_way_4_bit;

architecture Behavioral of TB_Mux_8_way_4_bit is
component Mux_8_way_4_bit
Port ( Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reg_0,Reg_1,Reg_2,Reg_3,Reg_4,Reg_5,Reg_6,Reg_7,Mux_out:STD_LOGIC_VECTOR (3 downto 0);
signal Sel:STD_LOGIC_VECTOR (2 downto 0);
Signal En: STD_LOGIC;

begin
    UUT : Mux_8_way_4_bit port map(
        Reg_0=>Reg_0,
        Reg_1=>Reg_1,
        Reg_2=>Reg_2,
        Reg_3=>Reg_3,
        Reg_4=>Reg_4,
        Reg_5=>Reg_5,
        Reg_6=>Reg_6,
        Reg_7=>Reg_7,
        Sel=>Sel,
        En=>En,
        Mux_out=>Mux_out);
        
    process
        begin
        En<='1'; -- always set to 1
        Reg_0<="0000";
        Reg_1<="0010";
        Reg_2<="0100";
        Reg_3<="0110";
        Reg_4<="1000";
        Reg_5<="1010";
        Reg_6<="1100";
        Reg_7<="1110";
        --my index number is 200645. In binary it is 110 000 111 111 000 101
        Sel<="101";
        wait for 100ns;
        Sel<="000";
        wait for 100ns;
        Sel<="111";
        wait for 100ns;
        Sel<="110";
        wait for 100ns;
    end process;
end Behavioral;
