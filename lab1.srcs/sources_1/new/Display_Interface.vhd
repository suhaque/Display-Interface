----------------------------------------------------------------------------------
-- Company: CPP
-- Engineer: Siam Haque & Dean Coco
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Display_Interface is
Port( 
     clk    : in std_logic;
     Ent    : in std_logic;
     WADD   : in std_logic_vector(2 downto 0);
     DIN    : in std_logic_vector(5 downto 0);
     E      : out std_logic_vector(7 downto 0);
     SegOut : out std_logic_vector(6 downto 0);
     DP     : out std_logic
     );
end Display_Interface;

architecture Behavioral of Display_Interface is
--component instantiations

--RAM 8X6
component RAM is
 Port ( clk  : in STD_LOGIC;
        W    : in std_logic;
        WADD : in std_logic_vector(2 downto 0);
        DIN  : in std_logic_vector(5 downto 0);
        RADD : in std_logic_vector(2 downto 0);
        DOUT : out std_logic_vector(5 downto 0));
end component;

--20 bit counter
component counter_20b is
 Port ( clk      : in STD_LOGIC;
        count    : out std_logic_vector(19 downto 0));
end component;

--3x8 decoder
component Decoder3x8 is
Port ( count_in     : in STD_LOGIC_vector(2 downto 0);
       decode_out   : out STD_LOGIC_vector(7 downto 0));
end component;

--Binary to 7-segment decoder
component Bto7seg is
Port ( E        : in STD_LOGIC;
       bin_in   : in std_logic_vector(3 downto 0);
       seg_out  : out std_logic_vector (6 downto 0));
end component;

--signals
signal count_out : std_logic_vector(19 downto 0);
signal DOUT      : std_logic_vector(5 downto 0);
signal DOUT5_relay : std_logic;

begin
RAM8x6: RAM port map(clk => clk, W => Ent, WADD => WADD, DIN => DIN, RADD => count_out(19 downto 17), DOUT => DOUT);
counter20b: counter_20b port map (clk => clk, count => count_out);
Decoder: Decoder3x8 port map(count_in => count_out(19 downto 17), decode_out => E);
SegmentDisplay: Bto7seg port map(E => DOUT5_relay, bin_in => DOUT(4 downto 1), seg_out => SegOut);

enable_proc:process(DOUT5_relay)
begin
    if(DOUT5_relay = '1') then
        DP <= DOUT(0);
    elsif(DOUT5_relay ='0')then
        DP <= '1';
    else
        DP <= '0';
    end if;
end process;

Dout(5) <= DOUT5_relay;

end Behavioral;
