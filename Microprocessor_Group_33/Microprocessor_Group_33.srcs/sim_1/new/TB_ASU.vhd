----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 02:44:05 PM
-- Design Name: 
-- Module Name: TB_ASU - Behavioral
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

entity TB_ASU_4 is
--  Port ( );
end TB_ASU_4;

architecture Behavioral of TB_ASU_4 is
component ASU_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           OpSel : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Over : out STD_LOGIC;
           Neg : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal Over,Neg,Zero:STD_LOGIC;
signal OpSel:STD_LOGIC;
signal A,B,S:STD_LOGIC_VECTOR (3 downto 0) :="0000";

begin
UUT : ASU_4
    PORT MAP(
        A => A,
        B => B,
        OpSel => OpSel,
        S=>S,
        Over => Over,
        Neg => Neg,
        Zero => Zero        
    );
    
    process
    begin
    --my index no = 200202 = 1100 0011 1000 0010 10
   
    -- first 8 digits
        A <= "1100";    
        B <= "0011";
        OpSel <= '0';      -- A + B      
        wait for 100ns;

        OpSel <= '1';      -- - A + B
        wait for 100ns;
     
    -- second 8 digits
        A <= "1000";    
        B <= "0010";
        OpSel <= '0';      -- A + B
        wait for 100ns;

        OpSel <= '1';      -- - A + B
        wait for 100ns;
        
    -- random inputs
        A <= "0111";    
        B <= "1000";  
        
        OpSel <= '0';      -- A + B
        wait for 100ns;
        
        OpSel <= '1';      -- - A + B
        wait for 100ns;
        
        A <= "1000";       
        B <= "1000"; 
        OpSel <= '0';       -- A + B       
        wait for 100ns;   
        
        A <= "1000";    
        B <= "1000";  
        OpSel <= '1';       -- - A + B      
        wait for 100ns;   
         
        A <= "0000";    
        B <= "0000";
        OpSel <= '0';       -- A + B
        wait;  
                
    end process;

end Behavioral;
