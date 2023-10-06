----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 01:49:01 PM
-- Design Name: 
-- Module Name: TB_CPU_Internal - Behavioral
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

entity TB_CPU is
--  Port ( );
end TB_CPU;

architecture Behavioral of TB_CPU is

component CPU
    port(Reset : in STD_LOGIC;
         Clk : in STD_LOGIC;
         Output : out STD_LOGIC_VECTOR (3 downto 0);
         OverFlag : out STD_LOGIC;
         ZeroFlag : out STD_LOGIC;
         NegFlag : out STD_LOGIC;
         Display : out STD_LOGIC_VECTOR (6 downto 0);
         Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Reset : std_logic;
signal Clk : std_logic := '0';
signal Display :std_logic_vector (6 downto 0);
signal Anode : std_logic_vector (3 downto 0);
signal OverFlag, ZeroFlag, NegFlag : std_logic;
signal Output : std_logic_vector (3 downto 0);
begin
    UUT : CPU
    port map(
        Reset => Reset,
        Clk => Clk,
        Output => Output,
        OverFlag => OverFlag,
        ZeroFlag => ZeroFlag,
        NegFlag => NegFlag,
        Display => Display,
        Anode => Anode
    );
    
    process begin
        wait for 5 ns;
        Clk <= Not(Clk);
    end process;
    
    process begin
        
        Reset <= '0';
        wait for 525 ns;
        
        Reset <= '1';       -- Short pulse of Reset signal
        wait for 20 ns;
        
        Reset <= '0';
        wait for 175 ns;
        
        Reset <= '1';       -- Longer pulse of Reset signal
        wait for 100 ns; 
    
    end process;
    
end Behavioral;
