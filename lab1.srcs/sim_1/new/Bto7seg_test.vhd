----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: Bto7seg_test - Behavioral
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

entity Bto7seg_test is
end Bto7seg_test;

architecture Behavioral of Bto7seg_test is
--component instantiation
component Bto7seg is
    Port ( E        : in STD_LOGIC;
           bin_in   : in std_logic_vector(3 downto 0);
           seg_out  : out std_logic_vector (6 downto 0));
end component;

signal Et       : std_logic;
signal bin_int  : std_logic_vector(3 downto 0);
signal seg_outt : std_logic_vector(6 downto 0);

begin
uut: Bto7seg port map(E => Et, bin_in => bin_int, seg_out => seg_outt);

stim_proc: process
begin
Et <= '0'; bin_int <= "0001"; wait for 10ns;
bin_int <= "0101"; wait for 10ns;
Et <= '1'; bin_int <= "1110"; wait for 10ns;
bin_int <= "1111"; wait for 10ns;
bin_int <= "0000"; wait for 10ns;
wait;
end process;

end Behavioral;
