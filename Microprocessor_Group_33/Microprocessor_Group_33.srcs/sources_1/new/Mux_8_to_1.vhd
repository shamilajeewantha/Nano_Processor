----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 05:58:43 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    COMPONENT Decoder_3_to_8
        PORT (I : in STD_LOGIC_VECTOR (2 downto 0);
              EN : in STD_LOGIC;
              Y : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    
    signal DY : STD_LOGIC_VECTOR (7 downto 0);
    
begin
    Decoder_3_to_8_Mux : Decoder_3_to_8 PORT MAP(
        I => S,
        EN => EN,
        Y => DY);
    
    Y <= (D(0) AND DY(0)) OR (D(1) AND DY(1)) OR (D(2) AND DY(2)) OR (D(3) AND DY(3)) OR (D(4) AND DY(4))
    OR (D(5) AND DY(5)) OR (D(6) AND DY(6)) OR (D(7) AND DY(7)) ;

end Behavioral;
