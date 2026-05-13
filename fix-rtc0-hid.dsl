
DefinitionBlock ("", "SSDT", 2, "DIXYES", "RTC0_HID", 0)
{
    External (_SB.I2C4.RTC0, DeviceObj)
    
    Scope (\_SB.I2C4.RTC0)
    {
        Name (_HID, "DIXY0000")
    }
}
