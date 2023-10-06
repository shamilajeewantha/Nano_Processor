----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2022 09:06:17 AM
-- Design Name: 
-- Module Name: TB_StartUp - Behavioral
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

entity TB_StartUp is
--  Port ( );
end TB_StartUp;

    architecture Behavioral of TB_StartUp is

component StartUp
port(
     Clk : in STD_LOGIC;
     Reset : in STD_LOGIC;
     Res : out STD_LOGIC
    );
end component;

signal Clk : std_logic :='0';
signal Reset, Res : std_logic;

begin

UUT : StartUp
port map(
    Clk => Clk,
    Reset => Reset,
    Res => Res
);

process
    begin
        wait for 5 ns;
        Clk <= NOT(Clk);
end process;

process
    begin
        Reset <= '0';
        wait;
end process;

end Behavioral;
