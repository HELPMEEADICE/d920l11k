
DefinitionBlock ("", "SSDT", 2, "DIXYES", "D920L11K", 0)
{
    /*
     * D920L11K-2251K 特定修正
     *
     * 基于固件分析: BIOS_Hi1620_V200R002C20B017
     * - 板名: Kunpeng Desktop Board D920L11K-2251K
     * - SoC: HiSilicon Hi1620 (鲲鹏 920)
     * - EC: ITE IT83201 (通过 I2C)
     * - TPM: SPI TPM
     * - UART: PL011 @ 0x94080000, IRQ=141
     *
     * 已知问题 (与 D920S10 共通):
     * 1. PCCT 表损坏 -> 由主程序处理 (卸载)
     * 2. RTC0 缺少 _HID -> 由 fix-rtc0-hid.aml 处理
     * 3. DDRC DDR2/DDR3 导致 hisi_pmu 卡死 -> 由 remove-ddrc.aml 处理
     */
}
