----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: DFF_test - Behavioral
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

entity DFF_test is
end DFF_test;

architecture Behavioral of DFF_test is

component DFF is
Port ( clk : in STD_LOGIC;
       D   : in STD_LOGIC;
       Q   : out STD_LOGIC);
end component;

signal clk  : std_logic;
signal D    : std_logic;
signal Q    : std_logic;

begin
uut: DFF port map(clk,D,Q);

clk_proc: process
begin
    while(true) loop
    clk <= '0'; wait for 1ns;
    clk <= '1'; wait for 1ns;
    end loop;
end process clk_proc;

stim_proc: process
begin
D <= '1'; wait for 4 ns;
D <= '0'; wait for 4 ns;
D <= '1'; wait for 3 ns;
D <= '0'; wait for 1 ns;
wait;
end process stim_proc;

end Behavioral;
