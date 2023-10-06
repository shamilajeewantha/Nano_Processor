----------------------------------------------------------------------------------
-- Company: Group 33
-- Engineer: 200645J M.G. Kasun P. Thennakoon
-- 
-- Create Date: 07/08/2022 07:22:54 PM
-- Design Name: 8 way Multiplexer - 4 bit
-- Module Name: Mux_8_way_4_bit - Behavioral
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

entity Mux_8_way_4_bit is
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
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is
component Mux_8_to_1 
     Port( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
bit_0_mux: Mux_8_to_1 
    port map(
        D(0)=>Reg_0(0),
        D(1)=>Reg_1(0),
        D(2)=>Reg_2(0),
        D(3)=>Reg_3(0),
        D(4)=>Reg_4(0),
        D(5)=>Reg_5(0),
        D(6)=>Reg_6(0),
        D(7)=>Reg_7(0),
        S=>Sel,
        EN=>En,
        Y=>Mux_out(0)
    );
bit_1_mux: Mux_8_to_1 
    port map(
        D(0)=>Reg_0(1),
        D(1)=>Reg_1(1),
        D(2)=>Reg_2(1),
        D(3)=>Reg_3(1),
        D(4)=>Reg_4(1),
        D(5)=>Reg_5(1),
        D(6)=>Reg_6(1),
        D(7)=>Reg_7(1),
        S=>Sel,
        EN=>En,
        Y=>Mux_out(1)
    );
bit_2_mux: Mux_8_to_1 
    port map(
        D(0)=>Reg_0(2),
        D(1)=>Reg_1(2),
        D(2)=>Reg_2(2),
        D(3)=>Reg_3(2),
        D(4)=>Reg_4(2),
        D(5)=>Reg_5(2),
        D(6)=>Reg_6(2),
        D(7)=>Reg_7(2),
        S=>Sel,
        EN=>En,
        Y=>Mux_out(2)
    );
bit_3_mux: Mux_8_to_1 
    port map(
        D(0)=>Reg_0(3),
        D(1)=>Reg_1(3),
        D(2)=>Reg_2(3),
        D(3)=>Reg_3(3),
        D(4)=>Reg_4(3),
        D(5)=>Reg_5(3),
        D(6)=>Reg_6(3),
        D(7)=>Reg_7(3),
        S=>Sel,
        EN=>En,
        Y=>Mux_out(3)
    );
    
    
end Behavioral;