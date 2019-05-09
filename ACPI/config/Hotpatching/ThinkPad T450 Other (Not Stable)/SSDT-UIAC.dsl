// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | Proper XHC USB Port Injection When Using RehabMan's USBInjectAll.kext For Proper USB Port Functionality...
//
// Proper USB Ports Injection Mapping | 8086:9cb3 | XHCI USB 3.0 Controller...
//
//DefinitionBlock ("", "SSDT", 1, "TP-T450", "_UIAC", 0)
//{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        Name(RMCF, Package()
        {
            "XHC", Package()
            {
                "port-count", Buffer() { 15, 0, 0, 0 },
                "ports", Package()
                {
                    "HSP0", Package() // USB 2.0 | External Port | Left Side Near Power Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HSP1", Package() // USB 2.0 | External Port | Left Side Near Mini Display Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HSP2", Package() // USB 2.0 | External Port | Right Side Near SDHC Card Reader |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    //"HSP3", Package() // Internal USB Input | Internal SDHC Card Reader Control |
                    //{ 
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 4, 0, 0, 0 },
                    //},
                    //"HSP4", Package() // Internal USB | Internal | Motorola LTE Modem | M.2 SATA NGFF WWAN Port |
                    //{
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 5, 0, 0, 0 },
                    //},
                    //"HSP5", Package() //  Internal USB | Fingerprint Reader | Onboard |
                    //{
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HSP6", Package() // Internal USB | Broadcom BCM2070280 BLUETOOTH 4.0 Controller | M.2 SATA NGFF WLAN Port |
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HSP7", Package() // Internal USB | Lenovo 720P HD WebCamera | Onboard |
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SSP0", Package() // USB3 3.0 | External Port | Left Side Near Power Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                    "SSP1", Package() // USB 3.0 | External Port | Left Side Near Mini Display Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 13, 0, 0, 0 },
                    },
                    "SSP2", Package() // USB 3.0 | External Port | Right Side Near SDHC Card Reader |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 14, 0, 0, 0 },
                    },
                   // "SSP3", Package() // Internal USB | Not Sure What It Controls | Possibly Docking Port |
                   // {
                   //     "UsbConnector", 255,
                   //     "port", Buffer() { 15, 0, 0, 0 },
                   // },
                },
            },
        })
    }
    
    External(_SB.PCI0.XHC, DeviceObj)
    // In DSDT, native ESEL is renamed ESEX
    // As a result, calls to it land here.
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
    
//}
//EOF