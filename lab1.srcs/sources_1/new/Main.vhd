----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/22/2017 07:40:34 PM
-- Design Name: 
-- Module Name: Main - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity Main is
Port (
    clk     : in std_logic;
    ent     : in std_logic;
    wadd    : in std_logic_vector(2 downto 0);
    din     : in std_logic_vector(5 downto 0);
    En      : out std_logic_vector(7 downto 0);
    ca2cg   : out std_logic_vector (6 downto 0);
    dp      : out std_logic );
end Main;

architecture Behavioral of Main is
--component instantiation

--debouncer
component debouncer is
Port ( clk : in STD_LOGIC;
       pb : in STD_LOGIC;
       ent : out STD_LOGIC);
end component;

--Display Interface
component Display_Interface is
Port( 
     clk    : in std_logic;
     Ent    : in std_logic;
     WADD   : in std_logic_vector(2 downto 0);
     DIN    : in std_logic_vector(5 downto 0);
     E      : out std_logic_vector(7 downto 0);
     SegOut : out std_logic_vector(6 downto 0);
     DP     : out std_logic
     );
end component;

--signal instantiation
signal W : std_logic;

begin
debouncer_0: debouncer port map(clk => clk, pb => ent, ent => W);
DI: Display_Interface port map(clk => clk, Ent => W, WADD => wadd, 
                               DIN => din, E => En, SegOut => ca2cg,
                               DP => dp);

end Behavioral;
