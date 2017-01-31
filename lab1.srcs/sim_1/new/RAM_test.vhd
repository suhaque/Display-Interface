----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/11/2017 10:58:38 AM
-- Design Name: 
-- Module Name: RAM_test - Behavioral
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

entity RAM_test is
end RAM_test;

architecture Behavioral of RAM_test is
--component instantiation
component RAM is  
   Port ( clk : in STD_LOGIC;
          W : in std_logic;
          WADD : in std_logic_vector(2 downto 0);
          DIN : in std_logic_vector(5 downto 0);
          RADD : in std_logic_vector(2 downto 0);
          DOUT : out std_logic_vector(5 downto 0));
end component;

--inputs
signal clkt     : std_logic := '0';
signal Wt       : std_logic := '0';
signal WADDt    : std_logic_vector (2 downto 0) := "000";
signal DINt     : std_logic_vector (5 downto 0) := "000000";
signal RADDt    : std_logic_vector (2 downto 0) := "000"; 
--outputs
signal DOUTt    : std_logic_vector (5 downto 0);

begin
uut: RAM port map (clk => clkt, 
                    W => Wt,
                    WADD => WADDt, 
                    DIN => DINt, 
                    RADD => RADDt, 
                    DOUT => DOUTt);

clk_proc: process
begin
    wait for 10ns;
    clkt <= not clkt;
end process clk_proc;

stim_proc: process
begin
Wt <= '0'; WADDt <= "010"; DINt <= "111111"; RADDt <= "010"; wait for 10ns;
Wt <= '1'; WADDt <= "010"; DINt <= "111111"; RADDt <= "010"; wait for 10ns;
Wt <= '0'; WADDt <= "010"; DINt <= "111111"; RADDt <= "010"; wait for 10ns;
Wt <= '1'; WADDt <= "011"; DINt <= "111111"; RADDt <= "011"; wait for 10ns;
Wt <= '0'; WADDt <= "011"; DINt <= "111111"; RADDt <= "011"; wait for 10ns;
Wt <= '1'; WADDt <= "110"; DINt <= "111100"; RADDt <= "110"; wait for 10ns;
Wt <= '0'; WADDt <= "110"; DINt <= "111100"; RADDt <= "110"; wait for 10ns;
wait;
end process stim_proc;

end Behavioral;
