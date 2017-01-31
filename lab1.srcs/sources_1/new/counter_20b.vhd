----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 09:55:53 AM
-- Design Name: 
-- Module Name: counter_20b - Behavioral
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

entity counter_20b is
    Port ( clk      : in STD_LOGIC;
           count    : out std_logic_vector(19 downto 0));
end counter_20b;

architecture Behavioral of counter_20b is

signal count_int: integer;

begin
    clk_proc: process(clk)
    begin
        if(rising_edge(clk)) then
            if (count_int = 1_048_575) then count_int <= 0;
            else count_int <= count_int + 1;
            end if;
        end if;
    end process clk_proc;
count <= std_logic_vector(to_unsigned(count_int,20));
end Behavioral;
