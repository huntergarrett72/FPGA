----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:18 07/24/2019 
-- Design Name: 
-- Module Name:    LED_Counter - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_Counter is
	Port ( CLK : in STD_LOGIC;
			 DIR : in STD_LOGIC; --Direction of Counter
			 LED : out STD_LOGIC_VECTOR (3 downto 0));
end LED_Counter;

architecture Behavioral of LED_Counter is
--For Downscaler
signal Counter: STD_LOGIC_VECTOR(21 downto 0);
signal CLK_LFC: STD_LOGIC;
signal pulse  : STD_LOGIC;

--For Counter
signal Count   : STD_LOGIC_VECTOR (3 downto 0);


begin
	--Downscaling 8MHz to 1 Hz
	Downscaler: process(CLK)
	begin
		if rising_edge(CLK) then
			if Counter < x"3D0900" then
				Counter <= Counter + 1;
				pulse   <= '0';
			else
				CLK_LFC <= not CLK_LFC;
				pulse   <= '1';
				Counter <= (others => '0');
			end if;
		end if;
	end process Downscaler;
	
	--up/down counter
	process(CLK, DIR)
	begin
		if rising_edge(CLK) then
			if (DIR = '1' and pulse = '1') then
				Count <= Count + '1';
			elsif (DIR = '0' and pulse = '1') then
				Count <= Count - '1';
			end if;
		end if;
	end process;
	
	--display results
	LED <= not Count;

end Behavioral;
