# Impossible POS - Universal Hardware Setup & Screen Pairing Guide

## Overview
This visual quick-start guide explains how to connect and configure all secondary hardware stations (Kitchen KDS, Bakery Display, Bar KDS, Special Orders, Photo Hub, Lobby Queue TV, Order Runner, Hostess, Customer Self-Ordering Kiosks, and Thermal Receipt Printers) with zero friction and no USB drives needed.

---

## 3 Simple Steps to Connect Any Screen

### Step 1: Download Setup Tool on the Screen Computer
1. Open the web browser on your secondary monitor, touchscreen, or tablet.
2. Navigate to your Main Cash Register IP (e.g. `http://192.168.1.100:3000`) or visit `https://impossiblepos.com`.
3. Download the single installer file:
   **`Impossible_POS_Hardware_Setup.bat`**

### Step 2: Choose Your Hardware Station (Options 1 to 13)
1. Double-click **`Impossible_POS_Hardware_Setup.bat`**.
2. Select your desired station number:
   - **`1`** Kitchen Display (KDS)
   - **`2`** Bakery & Cake KDS
   - **`3`** Bar & Drinks KDS
   - **`4`** Special Orders & Catering
   - **`5`** Photo Hub Station
   - **`6`** Lobby TV & Queue Display
   - **`7`** Runner & Expediter Hub
   - **`8`** Hostess & Table Seating
   - **`9`** Customer Self-Ordering Kiosk
   - **`10`** Secondary Cash Register
   - **`11`** Thermal Printers & Cash Drawer Service
   - **`12`** Smart TV 4-Digit Code Pairing
   - **`13`** Install All Station Shortcuts
3. Press **Enter**. The desktop shortcut is generated immediately with automatic server reconnection.

### Step 3: 4-Digit Smart Pairing (Plug and Play)
1. Launch the shortcut or open `http://[SERVER_IP]:3000/pair.html` in the screen's browser.
2. The screen displays a glowing 4-digit code (e.g., **`7421`**).
3. On the Main Cash Register, an instant notification appears:
   *"New Screen Requesting Connection: Kitchen Display (Code: 7421)"*
4. Tap **Accept and Connect**.
5. The screen immediately transitions into your live interactive station. No manual IP typing or passwords required.

---

## Hardware Stations Quick Reference

| Option | Station Name | Recommended Hardware | Primary Purpose | Direct URL |
|---|---|---|---|---|
| **1** | Kitchen Display (KDS) | 15"-21" Touchscreen / Tablet | Hot kitchen orders, prep timers, cook bump bar | `/cocina.html` |
| **2** | Bakery & Cake KDS | All-in-One PC / Touchscreen | Custom cake specs, decoration timers, photos | `/cocina.html?dept=bakery` |
| **3** | Bar & Drinks KDS | 10"-15" Waterproof Touchscreen | Cocktails, beers, coffee, and beverage orders | `/kds_bar.html` |
| **4** | Special Orders & Catering | Office PC / Tablet | Future bookings, fulfillment dates, deposits | `/cocina.html?dept=special` |
| **5** | Photo Hub Station | Tablet / Smartphone / Webcam | Take photos of finished cakes, attach to tickets | `/comanda_pastel.html` |
| **6** | Lobby TV & Queue Display | 32"-65" Smart TV / HDMI Stick | Customer pickup orders: Preparing & Ready to Pickup | `/espera.html` |
| **7** | Runner & Expediter Hub | 15" Packing Station Screen | Bag assembly, barcode check, DoorDash handoff | `/cocina.html?role=runner` |
| **8** | Hostess & Table Seating | 10" Entrance Tablet | Table floorplan, waitlists, party seating, SMS alerts | `/hostess.html` |
| **9** | Self-Ordering Kiosk | 21"-32" Vertical Touch Kiosk | Customer self-ordering, payment, direct to kitchen | `/kiosco.html` |
| **10** | Secondary Cash Register | Cash Drawer + Barcode Scanner | Additional checkout lane sharing central database | `/caja_v14.html` |
| **11** | Thermal Printers & Drawer | USB ESC/POS Printer (80mm/58mm) | Local Windows background print & drawer kick service | Local Windows Service |
| **12** | Smart TV Code Pairing | Any Browser / Smart TV | Open pairing portal to link screen by 4-digit code | `/pair.html` |
| **13** | Install All Stations | Multi-Purpose PC | Installs desktop shortcuts for all stations at once | Full Suite |

---

## Thermal Printers & Cash Drawer Setup

### Thermal Receipt Printers (USB ESC/POS)
1. Plug your thermal printer into any USB port.
2. Install the manufacturer driver (Epson, Star, MUNBYN, Rongta, etc.).
3. Run Option **`11`** in `Impossible_POS_Hardware_Setup.bat` to register the local printing service.
4. In Impossible POS, go to **Settings > Hardware** and select your printer.

### Automatic Cash Drawer Kick (RJ11)
1. Plug the drawer's RJ11 phone-style cable into the back of your receipt printer (DK port).
2. When a cash sale is completed, the printer sends a pulse to open the drawer automatically.
3. You can also open the drawer at any time using the **Open Drawer** button in the POS top menu.

---

## Network & Troubleshooting Checklist
- **Same Local Network:** Ensure all screens, tablets, and kiosks are connected to the same WiFi router or Ethernet switch as the Main Cash Register.
- **Firewall Exceptions:** Windows Firewall ports `3000` and `8080` are opened automatically by the setup tool.
- **Relocating Screens:** If you move a screen to a new room or change Wi-Fi, simply open `/pair.html` on the screen and approve the new 4-digit code on the Main Cash Register.
