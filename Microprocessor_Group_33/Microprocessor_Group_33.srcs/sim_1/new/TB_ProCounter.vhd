----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:31:08 PM
-- Design Name: 
-- Module Name: TB_ProCounter - Behavioral
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

entity TB_ProCounter is
--  Port ( );
end TB_ProCounter;

architecture Behavioral of TB_ProCounter is

component ProCounter
    port(
        D : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        PCount : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal D : std_logic_vector (2 downto 0):= "000";
signal PCount : std_logic_vector (2 downto 0);
signal Res : std_logic;
signal Clk : std_logic := '0';

begin

UUT: ProCounter
    port map(
        D => D,
        Clk => Clk,
        Res => Res,
        PCount => PCount);

process begin
        wait for 20 ns;
        Clk <= NOT(clk);
end process;

process begin
    -- Index Number 200202B - 110 000 111 000 001 010
    Res <= '1';
    D <= "010";
    wait for 110 ns;
    D <= "001";
    wait for 174 ns;
    Res <= '0';
    wait for 264 ns;
    D <= "000";
    wait for 202 ns;
    D <= "111";
    wait for 88 ns;
    
end process;
end Behavioral;
