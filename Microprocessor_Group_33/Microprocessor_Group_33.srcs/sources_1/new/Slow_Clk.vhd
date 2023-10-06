----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: Savin N. Gunawawardena 200202B
-- 
-- Create Date: 06/09/2022 02:47:40 PM
-- Design Name: Slow Clock Adapter
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
signal count : integer := 1;
signal clk_status : STD_LOGIC := '0';
begin
    process (Clk_in) begin
        if (rising_edge(Clk_in)) then
            count <= count + 1;
            if (count = 1) then                     -- for simulation
            --if (count = 50000000) then            -- for bitsteam (ticks every 1 seconds)
                clk_status <= not clk_status;
                Clk_out <= clk_status;
                count <= 1;
            end if;
        end if;
    
    end process;
    
end Behavioral;
