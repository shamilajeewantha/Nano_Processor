----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: Savin N. Gunawawardena 200202B
-- 
-- Create Date: 07/10/2022 01:55:22 PM
-- Design Name: 4-bit Add-Subtract Unit (4-bit ASU)
-- Module Name: ASU_4 - Behavioral
-- Project Name: Microporcessor
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

entity ASU_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OpSel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Over : out STD_LOGIC;
           Neg : out STD_LOGIC;
           Zero : out STD_LOGIC);
end ASU_4;

architecture Behavioral of ASU_4 is

component FA
port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
end component;

SIGNAL FA0_C, FA1_C, FA2_C, FA3_C: std_logic;
SIGNAL S0, S1, S2, S3: std_logic;
SIGNAL A0, A1, A2, A3: std_logic;
SIGNAL B0, B1, B2, B3: std_logic;

begin
-- If OpSel = 0, A + B operation
-- If OpSel = 1, -A + B operation

A0 <= (A(0) XOR OpSel);
FA_0 : FA
port map (
        A => A0,
        B => B(0),
        C_in => OpSel,
        S => S0,
        C_Out => FA0_C);

A1 <= (A(1) XOR OpSel);
FA_1 : FA
port map (
        A => A1,
        B => B(1),
        C_in => FA0_C,
        S => S1,
        C_Out => FA1_C);

A2 <= (A(2) XOR OpSel);
FA_2 : FA
port map (
        A => A2,
        B => B(2),
        C_in => FA1_C,
        S => S2,
        C_Out => FA2_C);

A3 <= (A(3) XOR OpSel);
FA_3 : FA
port map (
        A => A3,
        B => B(3),
        C_in => FA2_C,
        S => S3,
        C_Out => FA3_C);
        
S(0) <= S0;
S(1) <= S1;
S(2) <= S2;
S(3) <= S3;

Over <= FA3_C XOR FA2_C;
Zero <= NOT(S0 OR S1 OR S2 OR S3 OR (FA3_C XOR FA2_C));        
Neg <= S3 XOR (FA3_C XOR FA2_C);

end Behavioral;
