
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopModule is
Port (clk, vauxp3, vauxn3, vauxp11, vauxn11 : in std_logic;
      Ena : out std_logic_vector(7 downto 0);
      sevSeg : out std_logic_vector(6 downto 0);
      dp : out std_logic );
end TopModule;

architecture Behavioral of TopModule is
--components making the top module--
component ADC_Controller is
    Port (clk, ready : in std_logic;
        dataIn : in std_logic_vector(15 downto 0);
        V1, V2 : out std_logic_vector(11 downto 0);
        addr_in : out std_logic_vector(6 downto 0));
end component;

component Main is
Port (
    clk     : in std_logic;
    ent     : in std_logic;
    wadd    : in std_logic_vector(2 downto 0);
    din     : in std_logic_vector(5 downto 0);
    En      : out std_logic_vector(7 downto 0);
    ca2cg   : out std_logic_vector (6 downto 0);
    dp      : out std_logic );
end component;

component B2BCD is
  Port (clk : in std_logic;
      V1, V2: in std_logic_vector(11 downto 0);
      DV13, DV12, DV11, DV10 : out std_logic_vector(3 downto 0); 
      DV23, DV22, DV21, DV20 : out std_logic_vector(3 downto 0));
end component;

component Display_controller is
 Port (clk : in std_logic;
      dv13, dv12, dv11, dv10 : in std_logic_vector(3 downto 0);
      dv23, dv22, dv21, dv20 : in std_logic_vector(3 downto 0);
      W : out std_logic;
      WADD : out std_logic_vector(2 downto 0);
      DIN : out std_logic_vector(5 downto 0) );
end component;

component xadc_wiz_0 is
   port
(
 daddr_in        : in  STD_LOGIC_VECTOR (6 downto 0);     -- Address bus for the dynamic reconfiguration port
 den_in          : in  STD_LOGIC;                         -- Enable Signal for the dynamic reconfiguration port
 di_in           : in  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');    -- Input data bus for the dynamic reconfiguration port
 dwe_in          : in  STD_LOGIC := '0';                         -- Write Enable for the dynamic reconfiguration port
 do_out          : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
 drdy_out        : out  STD_LOGIC;                        -- Data ready signal for the dynamic reconfiguration port
 dclk_in         : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
 reset_in        : in  STD_LOGIC := '0';                         -- Reset signal for the System Monitor control logic
 vauxp3          : in  STD_LOGIC;                         -- Auxiliary Channel 3
 vauxn3          : in  STD_LOGIC;
 vauxp11         : in  STD_LOGIC;                         -- Auxiliary Channel 11
 vauxn11         : in  STD_LOGIC;
 busy_out        : out  STD_LOGIC;                        -- ADC Busy signal
 channel_out     : out  STD_LOGIC_VECTOR (4 downto 0);    -- Channel Selection Outputs
 eoc_out         : out  STD_LOGIC;                        -- End of Conversion Signal
 eos_out         : out  STD_LOGIC;                        -- End of Sequence Signal
 ot_out          : out  STD_LOGIC;                        -- Over-Temperature alarm output
 vccaux_alarm_out : out  STD_LOGIC;                        -- VCCAUX-sensor alarm output
 vccint_alarm_out : out  STD_LOGIC;                        -- VCCINT-sensor alarm output
 user_temp_alarm_out : out  STD_LOGIC;                     -- Temperature-sensor alarm output
 alarm_out       : out STD_LOGIC;                         -- OR'ed output of all the Alarms
 vp_in           : in  STD_LOGIC := '0';                         -- Dedicated Analog Input Pair
 vn_in           : in  STD_LOGIC := '0'
);
end component;

signal ready, enable: std_logic;
signal addr_in: std_logic_vector(6 downto 0); 
signal dataIn : std_logic_vector(15 downto 0);
signal v1, v2 : std_logic_vector (11 downto 0);
signal dv13, dv12, dv11, dv10 : std_logic_vector (3 downto 0);
signal dv23, dv22, dv21, dv20 : std_logic_vector (3 downto 0);
signal wadd : std_logic_vector(2 downto 0);
signal din  : std_logic_vector(5 downto 0) := "000001";
signal w    : std_logic;

begin
        -- instantiate the component modules --

my_ADC_Controller: ADC_Controller port map(clk, ready, dataIn, v1, v2, addr_in);
my_B2BCD: B2BCD port map(clk, V1, V2, dv13, dv12, dv11, dv10, dv23, dv22, dv21, dv20);
my_Display_Controller: Display_Controller port map(clk, dv13, dv12, dv11, dv10, dv23, dv22, dv21, dv20, W, WADD, DIN);
my_Display_Interface: Main port map(clk, W, WADD, DIN, Ena, sevSeg, DP);
my_XADC: xadc_wiz_0 port map(addr_in,enable, open, open, dataIn, ready, clk, open, vauxp3, vauxn3, vauxp11,vauxn11, open, open, enable, open, open, open, open);

end Behavioral;
