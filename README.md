# Keenetic OS 3.8.4 for Xiaomi Mi Router 4

0. [Download Here!!!](https://codeload.github.com/xiv3r/Xiaomi-Mi-Router-4A-100M-KeeneticOS-3.7.4/zip/refs/heads/main) the archive with scripts, unpack. There are many files in the folder, we are interested in the Breed Install folder, and in it the file !Start.bat

1. Run !Start.bat. If you have a stock , select items from 1 to 4 one by one. In the data folder there will be a backup in the factory.
If you have a different firmware , for example Padavan, skip this step
 

2. Unplug the router, press the reset button then power up while pressing the reset after that connect your pc using lamg cable and Go to Breed at 192.168.1.1. and make backups of your full and eeprom
 

3. In the archive, drag the Ultra2_Mod.bin file onto hfs.exe. Attention , someone else’s eeprom with poppies and calibrations is already built into Ultra2_Mod.bin, you can use it this way, or take it apart and change it yourself, if you wish.
look

4. Click Already in clipboard. Your computer's IP address will be copied to the clipboard. It should start with 192.168.1


5. Launch Putty from the archive, select TelNet and insert further commands (RMB) one by one, waiting for the previous command to complete . If it fails, repeat again
wget "router IP address obtained above" . It should output "wget http://192.168.1.xxx/Ultra2_Mod.bin "

`flash erase 0x40000 0x7f40000
flash write 0x40000 0x80001000 0x4FC0000
flash erase 0x1d40000 0x80000
flash erase 0x5d00000 0x80000`

If there are any difficulties at this point or something is not clear, write to QMS

6. Open Breed at 192.168.1.1. Go to the second tab and flash only Bootloader -> Breed-R3P_3G_universal.bin -> Automatic restart -> Upload
7. After the reboot, go to Environment, copy the contents of section 2 to autoboot.command -> Save -> Reboot. The router will reboot into Keenetic 3.7.0


Update to 3.8.4


Default access 192.168.1.1 login: admin password: 12345678. Wi-Fi: 12345678
