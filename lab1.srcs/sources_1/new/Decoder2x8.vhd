----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 09:55:53 AM
-- Design Name: 
-- Module Name: Decoder2x8 - Behavioral
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

entity Decoder3x8 is
    Port ( count_in     : in STD_LOGIC_vector(2 downto 0);
           decode_out   : out STD_LOGIC_vector(7 downto 0));
end Decoder3x8;

architecture Behavioral of Decoder3x8 is

begin
with count_in select
decode_out<="11111110" when "000",
"11111101" when "001",
"11111011" when "010",
"11110111" when "011",
"11101111" when "100",
"11011111" when "101",
"10111111" when "110",
"01111111" when "111",
"11111111" when others;

end Behavioral;
