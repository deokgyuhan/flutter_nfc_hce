# flutter_nfc_hce

"flutter_nfc_hce plugin project"

## Introduction

"This project was initiated during the process of exploring methods for exchanging data
between cross-platforms using NFC." 

"The flutter_nfc_hce plugin project was created to utilize the functionality in flutter, 
using Qifan Yang's NFCAndroid's com.qifan.nfcbank.cardEmulation.KHostApduService." 

"Regarding the Android 13 version issues related to NFC HCE operation, 
modifications were made to the following section with reference to
https://github.com/MichaelsPlayground/NfcHceNdefEmulator."

````xml
// KHostApduService.kt
private val READ_CAPABILITY_CONTAINER_RESPONSE = byteArrayOf(
0x00.toByte(), 0x0F.toByte(), // CCLEN length of the CC file
0x20.toByte(), // Mapping Version 2.0
0x00.toByte(), 0x3B.toByte(), // MLe maximum
0x00.toByte(), 0x34.toByte(), // MLc maximum
0x04.toByte(), // T field of the NDEF File Control TLV
0x06.toByte(), // L field of the NDEF File Control TLV
0xE1.toByte(), 0x04.toByte(), // File Identifier of NDEF file
0x00.toByte(), 0xFF.toByte(), // Maximum NDEF file size of 65534 bytes
0x00.toByte(), // Read access without any security
0xFF.toByte(), // Write access without any security
0x90.toByte(), 0x00.toByte(), // A_OKAY
)
````
"The NFC HCE operation works from Android 11 to 13, and we would like to inform you that in the current initial project,
the supported AID is fixed to D2760000850101 for usage."

"For NFC HCE Reader, you can refer to the example created using flutter_manager at
https://github.com/deokgyuhan/flutter_nfc_hce_reader."
