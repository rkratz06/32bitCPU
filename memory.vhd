--memory module
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port(
		clk, reset, RAMwe, RAMen, REGwe : in std_logic;
		writeData, rs1, rs2 : in std_logic_vector(31 downto 0);
		rd_index : in std_logic_vector(4 downto 0);
		func3 : in std_logic_vector(2 downto 0);
		writeData_out : out std_logic_vector(31 downto 0);
		REGwe_out : out std_logic;
		rd_index_out : out std_logic_vector(4 downto 0)
	);
end memory;

architecture behavior of memory is

signal REGwe_internal, REGwe_reg : std_logic := '0';
signal RAMbyteEN_internal : std_logic_vector(3 downto 0) := (others => '0');
signal writeData_internal, writeData_reg, RAMData, RAMAddress: std_logic_vector(31 downto 0) := (others => '0');
signal rd_index_internal, rd_index_reg : std_logic_vector(4 downto 0) := (others => '0');

component CPURAM
	port(
		address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		byteena		: IN STD_LOGIC_VECTOR (3 DOWNTO 0) :=  (OTHERS => '1');
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

begin
	REGwe_internal <= REGwe;
	rd_index_internal <= rd_index;
	RAMAddress <= writeData;
	process(RAMen, RAMwe, func3)
	begin
		RAMbyteEN_internal <= "1111";
		if RAMen = '1'  and RAMwe = '1' then
			case func3 is
				when "000" => --store byte
					RAMbyteEN_internal <= "0001";
				when "001" => --store half word
					RAMbyteEN_internal <= "0011";
				when "010" => --store word
					RAMbyteEN_internal <= "1111";
				when others =>
			end case;
		end if;
	end process;
	RAM : CPURAM port map(address => RAMAddress(13 downto 0), byteena => RAMbyteEN_internal, clock => clk, data => rs2, wren => RAMwe, q => RAMData); 
	process(RAMen, RAMwe, func3, writeData)
	begin
		writeData_internal <= writeData;
		if RAMen = '1' and RAMwe = '0' then
				case func3 is
					when "000" => --load byte
						writeData_internal <= std_logic_vector(resize(signed(RAMData(7 downto 0)), 32));
					when "001" => --load half word
						writeData_internal <= std_logic_vector(resize(signed(RAMData(15 downto 0)), 32));
					when "010" => --load word
						writeData_internal <= RAMData;
					when "100" => --load byte unsigned
						writeData_internal <= std_logic_vector(resize(unsigned(RAMData(7 downto 0)), 32));
					when "101" => --load half word unsigned
						writeData_internal <= std_logic_vector(resize(unsigned(RAMData(15 downto 0)), 32));
					when others =>
				end case;
			end if;
	end process;
	process(clk, reset)
	begin
		if reset = '1' then
			rd_index_reg <= (others => '0');
			writeData_reg <= (others => '0');
			REGwe_reg <= '0';
		elsif rising_edge(clk) then
			rd_index_reg <= rd_index_internal;
			writeData_reg <= writeData_internal;
			REGwe_reg <= REGwe_internal;
		end if;
	end process;
	rd_index_out <= rd_index_reg;
	writeData_out <= writeData_reg;
	REGwe_out <= REGwe_reg;
end behavior;