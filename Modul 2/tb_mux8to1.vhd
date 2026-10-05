library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux8to1 is
end tb_mux8to1;

architecture sim of tb_mux8to1 is
    signal sel_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal in0_tb : STD_LOGIC_VECTOR(3 downto 0) := "0001"; -- Nilai 1
    signal in1_tb : STD_LOGIC_VECTOR(3 downto 0) := "0010"; -- Nilai 2
    signal in2_tb : STD_LOGIC_VECTOR(3 downto 0) := "0011"; -- Nilai 3
    signal in3_tb : STD_LOGIC_VECTOR(3 downto 0) := "0100"; -- Nilai 4
    signal in4_tb : STD_LOGIC_VECTOR(3 downto 0) := "0101"; -- Nilai 5
    signal in5_tb : STD_LOGIC_VECTOR(3 downto 0) := "0110"; -- Nilai 6
    signal in6_tb : STD_LOGIC_VECTOR(3 downto 0) := "0111"; -- Nilai 7
    signal in7_tb : STD_LOGIC_VECTOR(3 downto 0) := "1000"; -- Nilai 8
    signal y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instansiasi DUT (Device Under Test)
    DUT: entity work.mux8to1
        port map (
            sel => sel_tb,
            in0 => in0_tb, 
            in1 => in1_tb, 
            in2 => in2_tb, 
            in3 => in3_tb,
            in4 => in4_tb, 
            in5 => in5_tb, 
            in6 => in6_tb, 
            in7 => in7_tb,
            y   => y_tb
        );

    -- Proses Stimulus & Assert Self-Checking
    stim_proc: process
    begin
        -- Skenario 0: sel = "000" (0 ns - 20 ns)
        sel_tb <= "000"; wait for 20 ns;
        assert (y_tb = in0_tb) report "Gagal: sel 000 tidak sesuai in0" severity error;

        -- Skenario 1: sel = "001" (20 ns - 40 ns)
        sel_tb <= "001"; wait for 20 ns;
        assert (y_tb = in1_tb) report "Gagal: sel 001 tidak sesuai in1" severity error;

        -- Skenario 2: sel = "010" (40 ns - 60 ns)
        sel_tb <= "010"; wait for 20 ns;
        assert (y_tb = in2_tb) report "Gagal: sel 010 tidak sesuai in2" severity error;

        -- Skenario 3: sel = "011" (60 ns - 80 ns)
        sel_tb <= "011"; wait for 20 ns;
        assert (y_tb = in3_tb) report "Gagal: sel 011 tidak sesuai in3" severity error;

        -- Skenario 4: sel = "100" (80 ns - 100 ns)
        sel_tb <= "100"; wait for 20 ns;
        assert (y_tb = in4_tb) report "Gagal: sel 100 tidak sesuai in4" severity error;

        -- Skenario 5: sel = "101" (100 ns - 120 ns)
        sel_tb <= "101"; wait for 20 ns;
        assert (y_tb = in5_tb) report "Gagal: sel 101 tidak sesuai in5" severity error;

        -- Skenario 6: sel = "110" (120 ns - 140 ns)
        sel_tb <= "110"; wait for 20 ns;
        assert (y_tb = in6_tb) report "Gagal: sel 110 tidak sesuai in6" severity error;

        -- Skenario 7: sel = "111" (140 ns - 160 ns)
        sel_tb <= "111"; wait for 20 ns;
        assert (y_tb = in7_tb) report "Gagal: sel 111 tidak sesuai in7" severity error;

        wait; -- Hentikan simulasi
    end process;

end sim;