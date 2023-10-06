----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: H. M. Shamila Jeewantha 200274U
-- 
-- Create Date: 07/10/2022 12:42:02 PM
-- Design Name: 3 bit Adder Unit 
-- Module Name: Adder_3_bit - Behavioral
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

entity Adder_3_bit is
    Port ( IN_3_bit : in STD_LOGIC_VECTOR (2 downto 0);
           OUT_3_bit : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3_bit;

architecture Behavioral of Adder_3_bit is
component RCA
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0); 
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

begin
    RCA_0 : RCA
    PORT MAP(
    A => IN_3_bit,
    B => "001",
    S => OUT_3_bit
    );

end Behavioral;
