----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2017 09:05:01 PM
-- Design Name: 
-- Module Name: Display_Controller - Behavioral
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

entity Display_Controller is
  Port (clk : in std_logic;
        dv13, dv12, dv11, dv10 : in std_logic_vector(3 downto 0);
        dv23, dv22, dv21, dv20 : in std_logic_vector(3 downto 0);
        W : out std_logic;
        WADD : out std_logic_vector(2 downto 0);
        DIN : out std_logic_vector(5 downto 0) );
end Display_Controller;

architecture Behavioral of Display_Controller is
-- state control signal --
signal state : integer := 0;

--signals for the output--
signal WADD_sig : unsigned(2 downto 0); -- will convert to std_logic_vector later

begin
    process
    begin
        wait until(rising_edge(clk));
        case state is
            when 0 => WADD_sig <= "111"; DIN <= '0' & dv23 & '1'; W <= '1'; state <= 1;
            when 1 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv22 & '1'; state <= 2;
            when 2 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv21 & '1'; state <= 3;
            when 3 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv20 & '1'; state <= 4;
            when 4 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv13 & '1'; state <= 5;
            when 5 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv12 & '1'; state <= 6;
            when 6 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv11 & '1'; state <= 7;
            when 7 => WADD_sig <= WADD_sig - 1; DIN <= '0' & dv10 & '1'; state <= 8;
            when 8 => W <= '1'; state <= 0;
            when others => state <= 0;
        end case;
    end process;
    
    process(state)
        begin
            case state is
                when 0 => W <= '0';
                when 1 => W <= '1';
                when 2 => W <= '1';
                when 3 => W <= '1';
                when 4 => W <= '1';
                when 5 => W <= '1';
                when 6 => W <= '1';
                when 7 => W <= '1';
                when 8 => W <= '1';
                when others => W <= '1';
            end case;
        end process;
    WADD <= std_logic_vector(WADD_sig);
end Behavioral;
