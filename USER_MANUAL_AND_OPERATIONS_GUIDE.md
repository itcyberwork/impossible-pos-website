# OFFICIAL USER MANUAL & OPERATIONS GUIDE
## Impossible POS™ — The All-in-One Operating System for Restaurants, Bars & Bakeries
**System Version:** v52.0 / Native Desktop POS  
**Developer:** IT Cyber Work L.L.C. (Detroit, Michigan)  
**Official Website:** [impossiblepos.com](https://impossiblepos.com) | **Owner Portal:** [impossiblepos.com/portal.html](https://impossiblepos.com/portal.html)  
**Direct Support Line:** +1 (313) 312-9090 (WhatsApp & Voice)

---

## TABLE OF CONTENTS
1. [Quick Installation & Launch](#1-quick-installation--launch)
2. [Shift Opening, Starting Cash Float & Cash Drawer Control](#2-shift-opening-starting-cash-float--cash-drawer-control)
3. [Station Roles: Cashier Mode vs Waiter Station](#3-station-roles-cashier-mode-vs-waiter-station)
4. [Customer Pairing & Printable Station QR Signs](#4-customer-pairing--printable-station-qr-signs)
5. [All-in-One Delivery Integration: DoorDash, Uber Eats & Grubhub](#5-all-in-one-delivery-integration-doordash-uber-eats--grubhub)
6. [Customer Notifications: 100% Free Telegram Bot vs Twilio SMS](#6-customer-notifications-100-free-telegram-bot-vs-twilio-sms)
7. [Unlimited Kitchen Displays (KDS) & Thermal Printer Routing](#7-unlimited-kitchen-displays-kds--thermal-printer-routing)
8. [Total Security: CCTV NVR Overlay & Screen Recording](#8-total-security-cctv-nvr-overlay--screen-recording)
9. [Cloud Backup & Disaster Recovery](#9-cloud-backup--disaster-recovery)
10. [Cloud Owner Portal & Technical Support](#10-cloud-owner-portal--technical-support)

---

## 1. QUICK INSTALLATION & LAUNCH

Impossible POS is built for immediate deployment in under 60 seconds with zero technical complexity.

### A. Windows Setup (Native .exe Application)
1. Download the `Impossible_POS_v1.0.zip` package.
2. Right-click and choose **Extract All** to `C:\Impossible_POS`.
3. Double-click `2_CREATE_DESKTOP_SHORTCUT.bat` to place official high-resolution shortcuts on your desktop.
4. Run `OPEN_FIREWALL_PORTS.bat` as Administrator once to permit local Wi-Fi communication with waiter tablets and kitchen displays.
5. Launch the POS by double-clicking **Impossible_POS.exe**. The register opens immediately in full screen!

### B. Android Tablets & iPads (Kiosk Mode)
1. Connect the tablet to the restaurant's local Wi-Fi router.
2. Open Google Chrome and navigate to the Main Server IP (e.g. `http://192.168.1.50:3000`).
3. Tap the Chrome menu icon `(⋮)` in the upper-right corner and choose **"Install App"** (or "Add to Home Screen").
4. Launch it from the Android home screen: it opens in **100% Full-Screen Kiosk Mode** without browser navigation bars.

---

## 2. SHIFT OPENING, STARTING CASH FLOAT & CASH DRAWER CONTROL

To protect restaurant revenue, prevent employee theft, and maintain audit-compliant books, Impossible POS features an active shift gate.

### A. Why is Checkout Blocked Before Opening a Shift?
The POS strictly forbids tendering payments or popping the cash drawer until the active cashier formally opens their shift with their initial cash float. This prevents off-the-books cash transactions and unexplained drawer shortages.

### B. Step-by-Step Shift Opening
1. Tap the **Pay** button on any order, or go to `Options > Shift Management > Open Shift`.
2. The Cash Breakdown window will appear.
3. The cashier inputs the exact counts of physical bills ($100, $50, $20, $10, $5, $1) and coins (25¢, 10¢, 5¢, 1¢).
4. The system calculates the total dollar value of the **Starting Cash Float** automatically.
5. Tap **Open Shift**. Checkout is now unlocked and cash/card payments can be processed immediately.

### C. Blind Drop Audit at Shift Closeout
1. At the end of the shift, the cashier navigates to `Manager > Z-Report / Close Register`.
2. The cashier counts the physical currency inside the drawer and inputs the totals.
3. **Blind Drop Security:** The terminal NEVER displays how much money the computer calculates should be in the drawer. This completely eliminates cash skimming or pocketing surplus money.
4. The system compares mathematical figures:
   $$\text{Starting Float} + \text{Cash Sales} = \text{Expected Total}$$
   $$\text{Actual Count} - \text{Expected Total} = \text{Variance (Overage / Shortage)}$$
5. The Z-Report prints the comprehensive audit summary for the owner.

---

## 3. STATION ROLES: CASHIER MODE VS WAITER STATION

In high-volume venues, counter registers and floor order-taking stations serve different purposes. Impossible POS lets you assign station roles in 1 click.

### A. Cashier Mode (Full Register)
* **Location:** Front counter, drive-thru, and checkout lanes.
* **Hardware:** PC with physical RJ11 cash drawer, 2D barcode scanner, and thermal receipt printer.
* **Capabilities:** Shift opening with starting cash float, tendering payments (Cash, Credit Card, Tabs), automatic cash drawer kick, authorized discounts, and Z-Report closing.

### B. Waiter Station (Order Taking & Kitchen Only)
* **Location:** Dining floor touchscreens, server stands, and server handheld tablets.
* **Hardware:** Touchscreen terminal or tablet without a cash drawer.
* **Capabilities:** Starting tables, seating guests, sending tickets to Kitchen/Bar KDS, and printing guest pre-check bills.
* **Security Lockout:** Taking cash payments and drawer kicks are disabled. Consequently, **waiter stations do NOT require opening a shift or entering a starting cash float**.

### C. How to Set Station Roles
1. On the specific terminal you wish to configure, open: `Setup > Hardware > Caja`.
2. Under **Station Role**, select:
   * `[X] Cashier Terminal (Full Register with Cash Drawer & Checkout)`
   * `[ ] Waiter Station (Order Taking & Kitchen Only)`
3. Tap **Save**.

---

## 4. CUSTOMER PAIRING & PRINTABLE STATION QR SIGNS

### A. The Single Monitor Challenge
Many restaurants utilize single-monitor POS terminals facing the cashier, without an expensive customer-facing secondary monitor. If your counter has multiple registers side-by-side (Station 1, Station 2, Station 3), customers need a clear way to pair their smartphones.

### B. Does Each Station Have a Unique QR Code?
**YES.** Every station generates a unique pairing code. Station 1 has its Station 1 QR code, and Station 2 has its Station 2 QR code. This guarantees that when a customer is standing at Station 2, their mobile phone links directly with the cashier serving them at Station 2, avoiding mixups with Station 1.

### C. How to Print the Official Station Sign
1. Go to: `Setup > Hardware > Caja`.
2. Click the green button: **[ Print Customer QR Sign ]**.
3. Select your terminal number (e.g. Station 1 or Station 2).
4. The system generates a high-resolution, print-ready layout:
   * Formatted for 80mm thermal receipt printers.
   * Formatted for standard desktop printers on Letter paper (8.5" x 11").
5. **Mounting Recommendation:** Print the sign, laminate it to protect against spills and grease, and affix it to the back of the monitor facing the guest:
   > *"Please scan this code to link your account to this register."*

---

## 5. ALL-IN-ONE DELIVERY INTEGRATION: DOORDASH, UBER EATS & GRUBHUB

Impossible POS completely eradicates counter clutter caused by maintaining 5 separate delivery vendor tablets.

### A. Unified Order Flow
1. Orders from **DoorDash, Uber Eats, Grubhub, and your Web Storefront** inject directly into the main POS terminal and Kitchen KDS displays in real time.
2. Kitchen displays announce incoming delivery tickets with an audible chime and platform-branded header colors:
   * **DoorDash:** Red (#FF3008)
   * **Uber Eats:** Green (#06C167)
   * **Grubhub:** Orange (#FF8000)
   * **Web Online Store:** Blue (#0A84FF)

### B. Barcode / QR Driver Dispatch
When the delivery driver (Dasher or Uber Driver) arrives at your restaurant:
1. The driver presents their smartphone showing the order barcode or QR code.
2. The cashier scans the driver's phone with any standard USB 2D barcode scanner.
3. Impossible POS pulls up the order in 0.2 seconds, allowing the cashier to verify bag contents, and displays the green **[ Hand Over to Driver ]** button.
4. Tapping it timestamps the handover, eliminating third-party missing order disputes.

### C. 1-Click Simulation Sandbox
To train your team with zero risk:
1. Navigate to `Options > Settings > Business & Services > Channels & Delivery`.
2. Click **[ Test DoorDash Order ]** or **[ Test Uber Eats Order ]**.
3. Watch the live color-coded order card pop into the Kitchen KDS immediately.

---

## 6. CUSTOMER NOTIFICATIONS: 100% FREE TELEGRAM BOT VS TWILIO SMS

Impossible POS gives you complete autonomy over customer order-ready alerts for takeout and drive-thru.

### A. Telegram Bot (Recommended — $0 Ongoing Fees)
* **Advantages:** Unlimited instant notification pings, zero per-message charges, zero monthly carrier subscriptions, and zero A2P 10DLC telco registration red tape.
* **2-Minute Setup:**
  1. Open Telegram on your smartphone or PC and search for `@BotFather`.
  2. Send the `/newbot` command.
  3. Choose a name and username for your restaurant bot (e.g. `MyTavernAlertsBot`).
  4. Copy the generated **Bot Token**.
  5. In Impossible POS, go to: `Setup > Hardware > Food Hub`.
  6. Paste your Bot Token and type your bot's username. Tap Save.
* **Guest Flow:** The printed receipt includes a Telegram QR code. The customer scans it, taps "Start", and receives live automatic alerts when their meal enters the kitchen and when it is packaged for pickup.

### B. Twilio SMS (Carrier Text Messages)
* For customers who prefer traditional SMS carrier text messages:
* In `Setup > Hardware > Food Hub`, input your **Account SID**, **Auth Token**, and **Twilio Phone Number**.
* Standard per-message telco rates and carrier compliance policies apply.

---

## 7. UNLIMITED KITCHEN DISPLAYS (KDS) & THERMAL PRINTER ROUTING

While competitor POS companies charge $50 to $100 per kitchen screen, Impossible POS includes **unlimited Kitchen Displays 100% Free**.

### A. Included Station Display Modes
* **Kitchen KDS (`START_KITCHEN_KDS.bat`):** Hot line tickets with color-coded wait timers (Green $\to$ Yellow $\to$ Red).
* **Bar KDS (`START_BAR_KDS.bat`):** Cocktails, beer, and beverages.
* **Runner KDS (`START_RUNNER_KDS.bat`):** Expeditor and order staging screen.
* **Custom Orders KDS (`START_CUSTOM_ORDERS_KDS.bat`):** Specialty items and custom cakes.
* **Lobby TV (`START_LOBBY_TV.bat`):** Public queue board for waiting guests.

### B. Intelligent Printer Routing
In `Setup > Hardware > Printers`, assign category destinations: kitchen items print to the kitchen ticket printer, drinks route to the bar printer, and bakery orders print to the bakery station. Compatible with Epson, Star Micronics, Munbyn, and Rongta ESC/POS printers over USB and Ethernet.

---

## 8. TOTAL SECURITY: CCTV NVR OVERLAY & SCREEN RECORDING

Impossible POS eliminates shrinkage and internal theft through direct integration with your security camera infrastructure.

### A. CCTV NVR Line-Item Text Overlay
* Connects over TCP port 10010 to Annke, Hikvision, and compatible NVR security recorders.
* As cashiers ring up items, ticket text stamps directly across the video feed monitoring the cash drawer in real time.

### B. Anti-Fraud Continuous Screen Recording
* Silently records all cashier touchscreen actions.
* If someone unplugs the external surveillance drive to evade auditing, the POS automatically locks the screen until the drive is reconnected.

### C. Biometric Fingerprint Login (ZKTeco USB)
* Authorize manager overrides and cashier logins via physical fingerprint scans in 0.2 seconds, preventing shared PIN codes.

---

## 9. CLOUD BACKUP & DISASTER RECOVERY

Your menu items, modifier recipes, and prices are always safe in the cloud.

### A. 1-Click Cloud Menu Backup
In `Options > Settings > Database`, click **[ Cloud Menu Backup ]** to safeguard your entire food catalog in our secure cloud storage.

### B. In-Store Fast PIN Restore
If a menu item or price is accidentally modified, tap **[ Cloud Menu Restore ]** and enter your Manager PIN or the **Master Support PIN (2026)** to restore the master catalog in 2 seconds.

### C. New Terminal Disaster Recovery
If your computer experiences hardware failure, theft, or water damage:
1. Extract Impossible POS on a blank replacement computer.
2. Select **New Machine Setup**.
3. Input your **Owner Email & Password** (or License Key).
4. The system downloads your menu and settings from the cloud instantly.

---

## 10. CLOUD OWNER PORTAL & TECHNICAL SUPPORT

### A. Cloud Owner Portal ([impossiblepos.com/portal.html](https://impossiblepos.com/portal.html))
Monitor your restaurant live from any smartphone, tablet, or home PC:
* Live gross and net revenue graphs.
* Real-time cash versus credit card tender splits.
* Z-Reports and transaction ticket logs.
* Peak hourly volume and best-selling item rankings.

### B. Technical Support Channels
* **Virtual Diagnostics Expert AI:** Open `Options > Support Center` inside the POS to troubleshoot printers, network, and hardware instantly.
* **1-Click Remote Support:** Launch built-in RustDesk for instant, zero-cost remote support from our engineering team.
* **Direct WhatsApp Support:** Text or call our 24/7 developer hotline at **+1 (313) 312-9090**.

---
*© 2026 IT Cyber Work L.L.C. All rights reserved. Impossible POS™ is a registered trademark.*
