----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: Savin N. Gunawawardena 200202B & 200110P Navindu Y.D. De Silva
-- 
-- Create Date: 07/23/2022 08:50:58 AM
-- Design Name: CPU StartUp Controller
-- Module Name: StartUp - Behavioral
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

entity StartUp is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Res : out STD_LOGIC);
end StartUp;

architecture Behavioral of StartUp is

-- first is a signal to indicate if first clock cycle is currently undergoing
-- started is to indicate if the CPU has began updating the Program Counter
signal first, started : std_logic := '0';   -- initially set to 0

begin
    process(Clk) begin
        if (rising_edge(Clk)) then
            -- when Reset is ON or when the CPU has not done a clock cylce and not started then set the Res to 1 to set PC and Registers to 0
            Res <= (NOT(first) AND NOT(started)) OR Reset;      
            started <= first;           -- next states of started and first signals
            first <= NOT(first); 
        end if;
    end process;


end Behavioral;
