# ACPI fix for D920L11K-2251K Windows/Linux boot

for Kunpeng Desktop Board D920L11K-2251K (HiSilicon Hi1620 / Kunpeng 920)

## Usage

```
Shell> .\d920l11k_tablesfix.efi
```

or save it to EFI\BOOT\bootaa64.efi to chainload

## Build

this depends on [POSIX-UEFI](https://gitlab.com/bztsrc/posix-uefi), build it first, then

```bash
POSIX_UEFI_PATH=<path to posix-uefi> ./buildaa64.sh
```

## Details

0. Added DBG2 and SPCR for debug (kernel debug / serial console)
1. PCCT table is corrupt, removed (prevents Windows boot on single-socket configs)
2. RTC0 missing _HID, patched with ssdt, source is in fix-rtc0-hid.dsl
3. DDRC DDR2 and DDR3 make linux hisi_pmu stuck, removed via ssdt, source is in remove-ddrc.dsl
4. D920L11K-2251K SMBIOS detection: board name contains "D920L11K" or "2251K"
5. When not invoked from cli, it chainloads bootmgr

## Difference from d920s10 version

- Board detection changed from W510/PGU-WBY0 to D920L11K/2251K
- W510-specific patches (COM1/COM2 _HID, WIFI disable) removed
- D920L11K placeholder SSDT added for future board-specific fixes
- Readable source references kept in the bytecode sections

## References

- Thanks d920s10 version: https://github.com/dixyes/d920s10-acpi-fix
- Based on firmware: BIOS_Hi1620_V200R002C20B017 for board D920L11K-2251K
- SoC: HiSilicon Hi1620 (Kunpeng 920 / Taishan cores)
- EC chip: ITE IT83201
- UART: ARM PL011 @ 0x94080000, GIC IRQ 141