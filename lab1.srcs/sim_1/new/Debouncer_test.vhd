----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: Debouncer_test - Behavioral
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

entity Debouncer_test is
end Debouncer_test;

architecture Behavioral of Debouncer_test is
component Debouncer is
    Port ( clk : in STD_LOGIC;
           pb : in STD_LOGIC;
           ent : out STD_LOGIC);
end component;
signal Ent, W, clk : std_logic;

begin
uut: Debouncer port map(clk => clk, pb => Ent, ent => W);

clk_process: process
begin
clk <= '1';
wait for 0.1 ns;
clk <= not clk;
wait for 0.1 ns;
end process;

stimulus: process
begin
Ent <= '1';
wait for 10 ms;
end process;
end Behavioral;
