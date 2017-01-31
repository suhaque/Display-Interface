-----------------------------------------------0-----------------------------------
-- Company: 
-- Engineer: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Display_Interface_test is
end Display_Interface_test;

architecture Behavioral of Display_Interface_test is
--component instantiation
component Display_Interface is
Port( 
     clk    : in std_logic;
     Ent      : in std_logic;
     WADD   : in std_logic_vector(2 downto 0);
     DIN    : in std_logic_vector(5 downto 0);
     E      : out std_logic_vector(7 downto 0);
     SegOut : out std_logic_vector(6 downto 0);
     DP     : out std_logic
     );
end component;

--signal instantiation
signal clkt     : std_logic;
signal Entt     : std_logic;
signal WADDt    : std_logic_vector(2 downto 0);
signal DINt     : std_logic_vector(5 downto 0);
signal Et       : std_logic_vector(7 downto 0);
signal SegOutt  : std_logic_vector(6 downto 0);
signal DPt      : std_logic;

begin
uut: Display_Interface port map(clk => clkt, Ent => Entt, WADD => WADDt, DIN => DINt, E => Et, SegOut => SegOutt, DP => DPt);

clk_process: process
begin
for i in 1 to 500 loop
clkt <= '0';
wait for 1 ns;
clkt <= not clkt;
wait for 1 ns;
end loop;
end process;

stim_proc: process
begin
Entt <= '1'; wait for 2ns;
WADDt <= "001"; DINt <= "000001"; wait for 10ns;
Entt <= '0'; wait for 2ns; 
WADDt <= "001"; DINt <= "000011"; wait for 20ns;
Entt <= '1'; wait for 2ns;
WADDt <= "011"; DINt <= "000011"; wait for 30ns;
Entt <= '0'; wait for 2ns;
WADDt <= "011"; DINt <= "000011"; wait for 40ns;
Entt <= '0'; wait for 2ns;
WADDt <= "101"; DINt <= "010001"; wait for 50ns;
Entt <= '0'; wait for 2ns;
WADDt <= "101"; DINt <= "100001"; wait for 60ns;
Entt <= '1'; wait for 2ns;
WADDt <= "101"; DINt <= "100001"; wait for 70ns;
Entt <= '0'; wait for 2ns;
WADDt <= "101"; DINt <= "100001"; wait for 80ns;
wait;
end process;
end Behavioral;
