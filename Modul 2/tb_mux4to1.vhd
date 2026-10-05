library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4to1 is
end tb_mux4to1;

architecture sim of tb_mux4to1 is
    -- Deklarasi sinyal internal
    signal sel_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal in0_tb, in1_tb, in2_tb, in3_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal y_tb   : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instansiasi Device Under Test (DUT)
    DUT: entity work.mux4to1
        port map (
            sel => sel_tb,
            in0 => in0_tb,
            in1 => in1_tb,
            in2 => in2_tb,
            in3 => in3_tb,
            y   => y_tb
        );

    -- Process Stimulus & Self-Checking
    stim_proc: process
    begin
        -- 1. Inisialisasi Nilai Input Data (4-bit)
        in0_tb <= "0001"; -- Dec: 1
        in1_tb <= "0010"; -- Dec: 2
        in2_tb <= "0011"; -- Dec: 3
        in3_tb <= "0100"; -- Dec: 4

        -- 2. Skenario sel = "00" (harus mengeluarkan in0_tb = "0001")
        sel_tb <= "10";
        wait for 20 ns;
        assert (y_tb = "0001") 
            report "ERROR Skenario 00: Output y_tb salah!" severity error;

        -- 3. Skenario sel = "01" (harus mengeluarkan in1_tb = "0010")
        sel_tb <= "01";
        wait for 20 ns;
        assert (y_tb = "0010") 
            report "ERROR Skenario 01: Output y_tb salah!" severity error;

        -- 4. Skenario sel = "10" (harus mengeluarkan in2_tb = "0011")
        sel_tb <= "10";
        wait for 20 ns;
        assert (y_tb = "0011") 
            report "ERROR Skenario 10: Output y_tb salah!" severity error;

        -- 5. Skenario sel = "11" (harus mengeluarkan in3_tb = "0100")
        sel_tb <= "11";
        wait for 20 ns;
        assert (y_tb = "0100") 
            report "ERROR Skenario 11: Output y_tb salah!" severity error;

        -- 6. Laporan jika seluruh pengujian berhasil
        report "SIMULASI SELESAI: Semua skenario MUX 4-to-1 BERHASIL (Self-checking Passed)!";
        wait; -- Menghentikan simulasi
    end process;

end sim;