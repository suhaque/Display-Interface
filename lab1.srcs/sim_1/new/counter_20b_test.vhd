----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: counter_20b_test - Behavioral
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

entity counter_20b_test is
end counter_20b_test;

architecture Behavioral of counter_20b_test is
--component instantiation
component counter_20b is
 Port ( clk     : in STD_LOGIC;
        count   : out std_logic_vector(19 downto 0));
end component;

--inputs
signal clk      : std_logic := '0';
--outputs
signal count    : std_logic_vector(19 downto 0);

begin
uut: counter_20b port map(clk, count);

clk_proc: process
begin
    clk <= '0';
    for i in 1 to 100 loop
        wait for 1 ns;
        clk <= not clk;
    end loop;
end process clk_proc;

end Behavioral;
