----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:05 07/19/2019 
-- Design Name: 
-- Module Name:    LED_Blink - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Blink is
	port (
		-- FPGA_GCLK, 8MHz
		CLK: in std_logic;
		
		-- FPGA_LFC, 1Hz
		--CLK_LFC: in std_logic;
		
		-- LED outputs
		LED_0: out std_logic;
		LED_1: out std_logic;
		LED_2: out std_logic;
		LED_3: out std_logic
		
		-- BTN inputs
	--	BTN_0: in std_logic;
	--	BTN_1: in std_logic
	);
end LED_Blink;

architecture Behavioral of LED_Blink is
	signal Counter: std_logic_vector(21 downto 0);
	signal CLK_LFC: std_logic;
begin

	Downscaler: process(CLK)
	begin
		if rising_edge(CLK) then
			if Counter < "1111010000100100000000" then
				Counter <= Counter + 1;
			else
				CLK_LFC <= not CLK_LFC;
				Counter <= (others => '0');
			end if;
		end if;
	end process Downscaler;
	
	-- LED/Button testing
	
	LED_3 <= CLK_LFC;
	LED_2 <= not CLK_LFC;
	
	LED_0 <= CLK_LFC;
	LED_1 <= not CLK_LFC;

end Behavioral;

