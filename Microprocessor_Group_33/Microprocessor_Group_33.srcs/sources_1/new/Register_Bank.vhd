----------------------------------------------------------------------------------
-- Company: CS 1050 Group 33
-- Engineer: H. M. Shamila Jeewantha 200274U
-- 
-- Create Date: 07/10/2022 04:19:03 PM
-- Design Name: General Register Bank
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal EN_bus : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => Reg_EN,
        EN => '1',
        Y => EN_bus
    );
    
Reg_0 : Reg
    PORT MAP(
        D => "0000",
        En => '0',
        Res => Res,
        Clk => Clk,
        Q => Q0
    );    

Reg_1 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(1),
        Res => Res,
        Clk => Clk,
        Q => Q1
    );

Reg_2 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(2),
        Res => Res,
        Clk => Clk,
        Q => Q2
    );

Reg_3 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(3),
        Res => Res,
        Clk => Clk,
        Q => Q3
    );

Reg_4 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(4),
        Res => Res,
        Clk => Clk,
        Q => Q4
    );

Reg_5 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(5),
        Res => Res,
        Clk => Clk,
        Q => Q5
    );

Reg_6 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(6),
        Res => Res,
        Clk => Clk,
        Q => Q6
    );

Reg_7 : Reg
    PORT MAP(
        D => D,
        En => EN_bus(7),
        Res => Res,
        Clk => Clk,
        Q => Q7
    );
    
end Behavioral;
