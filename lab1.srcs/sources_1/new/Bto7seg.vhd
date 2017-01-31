----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 09:55:53 AM
-- Design Name: 
-- Module Name: Bto7seg - Behavioral
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

entity Bto7seg is
    Port ( E        : in STD_LOGIC;
           bin_in   : in std_logic_vector(3 downto 0);
           seg_out  : out std_logic_vector (6 downto 0));
end Bto7seg;

architecture Behavioral of Bto7seg is

signal seven_seg : std_logic_vector(6 downto 0);

begin

--active low 7 segment display
seg_out <= not seven_seg; 

seg_proc : process(bin_in,E)
	begin
	if E = '1' then	
		case bin_in is
			when x"0" => seven_seg <= "0111111";	-- 0
			when x"1" => seven_seg <= "0000110";	-- 1
			when x"2" => seven_seg <= "1011011";	-- 2
			when x"3" => seven_seg <= "1001111";	-- 3
			when x"4" => seven_seg <= "1100110";	-- 4
			when x"5" => seven_seg <= "1101101";	-- 5
			when x"6" => seven_seg <= "1111101";	-- 6
			when x"7" => seven_seg <= "0000111";	-- 7
			when x"8" => seven_seg <= "1111111";	-- 8
			when x"9" => seven_seg <= "1101111";	-- 9
			when x"A" => seven_seg <= "1110111";	-- A
			when x"B" => seven_seg <= "1111100";	-- b
			when x"C" => seven_seg <= "0111001";	-- C
			when x"D" => seven_seg <= "1011110";	-- d
			when x"E" => seven_seg <= "1111001";	-- E
			when x"F" => seven_seg <= "1110001";	-- F
			when others =>
				seven_seg <= (others => '0');
		end case;
	else 
	seven_seg <= (others => '0');
	end if;
	end process seg_proc;			

end Behavioral;
