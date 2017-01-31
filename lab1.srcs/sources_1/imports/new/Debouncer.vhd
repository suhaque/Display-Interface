----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2016 02:37:14 PM
-- Design Name: 
-- Module Name: debouncer - debouncerA
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
    Port ( clk : in STD_LOGIC;
           pb : in STD_LOGIC;
           ent : out STD_LOGIC);
end debouncer;

architecture debouncerA of debouncer is
type state_type is (s0,s1,s2,s3,s4,s5);
signal state: state_type:=s0;
signal dpb: std_logic;
signal spb: std_logic;
signal SDC: std_logic_vector( 19 downto 0):= (others =>'0');-- has to be 10 downto 0
signal D7ms :std_logic_vector (19 downto 0):= "10101010111001100000";
begin
dev:process
begin
wait until(clk'event and clk ='1');
dpb <= pb;
spb <= dpb;

case state is
when s0 => if (spb = '1') then SDC <= D7ms; state <= s1; end if;
when s1 =>   SDC <= SDC -"00000000000000000001"; if (SDC = "00000000000000000000") then  state <= s2; else state <=s1; end if; --SDC <= SDC - "00000000000000000001";
when s2 => if (spb = '1') then state <= s3; else state <= s0; end if;
when s3 => if (spb = '1') then state <= s3; else SDC <= D7ms; state <= s4; end if;
when s4 =>  SDC <= SDC - "00000000000000000001"; if ( SDC = "00000000000000000000") then state <= s5; end if;
when s5 => state <= s0;
end case;
end process;

--SDC <= SDC - "001" when ( state = s1 );
--SDC <= SDC - "001" when ( state = s4);
ent <= '1' when (state = s5) else '0';

end debouncerA;
