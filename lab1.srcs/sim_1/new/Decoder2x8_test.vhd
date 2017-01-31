----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: Decoder2x8_test - Behavioral
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

entity Decoder3x8_test is
end Decoder3x8_test;

architecture Behavioral of Decoder3x8_test is
--component instantiation
component Decoder3x8 is
Port ( count_in     : in STD_LOGIC_vector(2 downto 0);
       decode_out   : out STD_LOGIC_vector(7 downto 0));
end component;

--inputs
signal count_in     : std_logic_vector(2 downto 0) := "000";
--outputs
signal decode_out   : std_logic_vector(7 downto 0);  

begin
uut: Decoder3x8 port map (count_in, decode_out);

stim_proc: process
begin
    for i in 0 to 7 loop
    count_in <= std_logic_vector(to_unsigned(i,3));
    wait for 10 ns;
    end loop;
end process stim_proc;

end Behavioral;
