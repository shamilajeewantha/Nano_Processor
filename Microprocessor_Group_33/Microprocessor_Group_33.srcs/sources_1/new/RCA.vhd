----------------------------------------------------------------------------------
-- Company: Group 33
-- Engineer: 200274U H.M.Shamila Jeewantha
-- 
-- Create Date: 06/06/2022 11:53:09 PM
-- Design Name: Ripple Carry Adder
-- Module Name: RCA - Behavioral
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

entity RCA is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0); 
           S : out STD_LOGIC_VECTOR (2 downto 0));
end RCA;

architecture Behavioral of RCA is

component HA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       S : out STD_LOGIC;
       C : out STD_LOGIC);
end component;

component FA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S : out STD_LOGIC;
       C_out : out STD_LOGIC);

end component;
SIGNAL HA0_C, FA1_C, Sum_3rd_bit_Lv1 : std_logic;
begin
    HA_0 : HA
        port map (
            A => A(0),
            B => B(0),
            S => S(0),
            C => HA0_C);
    FA_1 : FA
        port map (
            A => A(1),
            B => B(1),
            C_in => HA0_C,
            S => S(1),
            C_Out => FA1_C);

-- Adding the pair of third bits without processing a carry bit
    Sum_3rd_bit_Lv1 <= A(2) XOR B(2);
    S(2) <= Sum_3rd_bit_Lv1 XOR FA1_C;
    
end Behavioral;
