----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 09:55:53 AM
-- Design Name: 
-- Module Name: RAM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( clk  : in STD_LOGIC;
           W    : in std_logic;
           WADD : in std_logic_vector(2 downto 0);
           DIN  : in std_logic_vector(5 downto 0);
           RADD : in std_logic_vector(2 downto 0);
           DOUT : out std_logic_vector(5 downto 0));
end RAM;

architecture Behavioral of RAM is

type Memory is array (0 to 7) of unsigned (5 downto 0);
signal RAM: Memory := (others => "000000");

begin

RAM_proc: process
begin 
wait until (clk'event and clk='1');
        if (W='1') then 
            RAM(to_integer(unsigned(WADD))) <= unsigned(DIN);
        end if;
end process RAM_proc;

DOUT <= std_logic_vector(RAM (to_integer(unsigned(RADD))));

end Behavioral;
