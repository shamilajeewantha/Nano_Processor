----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2022 06:08:22 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
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
end component;

signal Clk, Res : STD_LOGIC := '0';
signal Reg_EN : STD_LOGIC_VECTOR (2 downto 0);
signal D,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : Register_Bank
    PORT MAP(
        Clk => Clk,
        Res => Res,
        Reg_EN => Reg_EN,
        D => D,
        Q0 => Q0,
        Q1 => Q1,
        Q2 => Q2,
        Q3 => Q3,
        Q4 => Q4,
        Q5 => Q5,
        Q6 => Q6,
        Q7 => Q7
    );

    process
    begin
        wait for 20ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
        --My index no = 200274 = 110 000 111 001 010 010 ; 
        --Choose the register by feeding 3-bits from the index no to the decoder
        D <= "1111";
        wait for 50ns;
        
        Reg_EN <= "010";
        wait for 50ns;
        
        Reg_EN <= "001";
        wait for 50ns;        
        
        Reg_EN <= "111";
        wait for 50ns;        
        
        Reg_EN <= "000";
        wait for 50ns;        
        
        Res <= '1';
        Wait for 50ns;
        
        Res <= '0';
        Wait for 50ns;        
        
        D <= "1010";
        wait for 50ns;
        
        Reg_EN <= "110";
        wait for 50ns;        
        
        Reg_EN <= "000";
        wait;         
        
    end process;
end Behavioral;
