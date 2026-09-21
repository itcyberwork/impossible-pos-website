# MANUAL OFICIAL DE USUARIO Y GUÍA DE OPERACIÓN
## Impossible POS™ — Sistema Operativo Todo-en-Uno para Restaurantes, Bares y Panaderías
**Versión de Sistema:** v52.0 / Native Desktop POS  
**Desarrollador:** IT Cyber Work L.L.C. (Detroit, Michigan)  
**Sitio Web Oficial:** [impossiblepos.com](https://impossiblepos.com) | **Portal de Dueños:** [impossiblepos.com/portal.html](https://impossiblepos.com/portal.html)  
**Línea Directa de Soporte:** +1 (313) 312-9090 (WhatsApp & Llamadas)

---

## ÍNDICE GENERAL
1. [Instalación Rápida y Puesta en Marcha](#1-instalación-rápida-y-puesta-en-marcha)
2. [Apertura de Turno, Fondo Inicial y Control de Efectivo](#2-apertura-de-turno-fondo-inicial-y-control-de-efectivo)
3. [Roles de Estación: Modo Caja vs Modo Mesero](#3-roles-de-estación-modo-caja-vs-modo-mesero)
4. [Vinculación de Clientes y Letrero QR Imprimible por Caja](#4-vinculación-de-clientes-y-letrero-qr-imprimible-por-caja)
5. [Integración All-in-One de Delivery: DoorDash, Uber Eats y Grubhub](#5-integración-all-in-one-de-delivery-doordash-uber-eats-y-grubhub)
6. [Notificaciones a Clientes: Telegram Bot 100% Gratis vs Twilio SMS](#6-notificaciones-a-clientes-telegram-bot-100-gratis-vs-twilio-sms)
7. [Pantallas de Cocina (KDS) Ilimitadas y Ruteo de Impresión](#7-pantallas-de-cocina-kds-ilimitadas-y-ruteo-de-impresión)
8. [Seguridad Total: Cámaras CCTV NVR y Grabación de Pantalla](#8-seguridad-total-cámaras-cctv-nvr-y-grabación-de-pantalla)
9. [Respaldo en la Nube y Recuperación de Desastres](#9-respaldo-en-la-nube-y-recuperación-de-desastres)
10. [Portal Cloud de Dueños y Soporte Técnico](#10-portal-cloud-de-dueños-y-soporte-técnico)

---

## 1. INSTALACIÓN RÁPIDA Y PUESTA EN MARCHA

Impossible POS está diseñado para comenzar a operar en menos de 60 segundos sin requerir configuraciones técnicas complejas.

### A. Instalación en Windows (.exe Nativo)
1. Descarga el paquete `Impossible_POS_v1.0.zip`.
2. Haz clic derecho y selecciona **Extraer Todo** en `C:\Impossible_POS`.
3. Haz doble clic en `2_CREAR_ACCESO_DIRECTO.bat` para generar los iconos en el Escritorio.
4. Ejecuta `ABRIR_PUERTOS_FIREWALL.bat` como Administrador una sola vez para habilitar la comunicación de red local con tabletas y pantallas de cocina.
5. Abre el sistema haciendo doble clic en **Impossible_POS.exe**. ¡La caja registradora arranca inmediatamente en pantalla completa!

### B. Modo Kiosco en Tablets Android e iPads
1. Conecta la tableta a la misma red Wi-Fi del restaurante.
2. Abre Google Chrome y escribe la IP de la caja principal (ej. `http://192.168.1.50:3000`).
3. Toca los tres puntos `(⋮)` arriba a la derecha en Chrome y selecciona **"Instalar Aplicación"** o **"Agregar a pantalla principal"**.
4. Ábrela desde el Escritorio de Android: se ejecutará en **Modo Kiosco 100% Pantalla Completa** sin barras de navegador.

---

## 2. APERTURA DE TURNO, FONDO INICIAL Y CONTROL DE EFECTIVO

Para proteger las finanzas del negocio y garantizar una auditoría limpia, Impossible POS cuenta con un candado obligatorio de inicio de turno.

### A. ¿Por qué se bloquea el cobro sin abrir turno?
El sistema no permite cobrar órdenes ni abrir el cajón de dinero hasta que el cajero en turno abra formalmente su turno con su fondo de caja inicial. Esto evita ventas "anónimas" y descuadres de caja.

### B. Cómo abrir el turno paso a paso
1. Presiona el botón de cobro **Pay** en cualquier orden, o ve a `Opciones > Shift Management > Open Shift`.
2. Se abrirá la ventana de desglose de efectivo.
3. El cajero ingresa la cantidad exacta de billetes ($100, $50, $20, $10, $5, $1) y monedas (25¢, 10¢, 5¢, 1¢).
4. El sistema calcula en tiempo real el total en dólares del **Fondo Inicial (Cash Float)**.
5. Presiona **Abrir Turno / Open Shift**. A partir de este momento, la caja registradora queda 100% habilitada para procesar pagos en efectivo, tarjeta o crédito.

### C. Arqueo Ciego (Blind Drop) al Cierre de Turno
1. Al final del día, el cajero va a `Manager > Z-Report / Cierre de Turno`.
2. El cajero debe contar físicamente el dinero de su gaveta e ingresarlo en la pantalla.
3. **Seguridad Blind Drop:** La pantalla NUNCA le muestra al cajero cuánto dinero calcula la computadora que debería haber. Esto elimina por completo el robo hormiga o que el cajero se guarde dinero sobrante.
4. El sistema compara matemáticamente:
   $$\text{Fondo Inicial} + \text{Ventas en Efectivo} = \text{Total Esperado}$$
   $$\text{Efectivo Contado} - \text{Total Esperado} = \text{Diferencia (Sobrante o Faltante)}$$
5. El ticket Z imprime el desglose completo para la contabilidad del dueño.

---

## 3. ROLES DE ESTACIÓN: MODO CAJA VS MODO MESERO

En un restaurante moderno coexisten terminales principales de cobro y terminales de meseros en el comedor. Impossible POS permite definir el rol de cada pantalla en 1 clic.

### A. Terminal de Caja (Cashier Mode)
* **Ubicación:** Mostrador principal de atención y caja de salida.
* **Hardware:** Computadora con cajón de dinero físico RJ11, escáner e impresora térmica.
* **Funciones:** Apertura de turno con fondo inicial, cobro de órdenes en efectivo y tarjeta, apertura automática de cajón de dinero, descuentos autorizados y corte Z.

### B. Terminal de Mesero (Waiter Station / Order-Taking Only)
* **Ubicación:** Tablets en el salón, pasillos o terminales de servicio.
* **Hardware:** Pantalla táctil o tablet sin cajón de dinero.
* **Funciones:** Iniciar mesas, capturar comensales, mandar órdenes a la cocina/bar KDS e imprimir pre-cuentas de comensales.
* **Candado de Seguridad:** No permite cobrar dinero en efectivo ni dispara ningún cajón. Por esta razón, **las estaciones de mesero NO requieren abrir turno ni capturar fondo inicial**.

### C. Cómo cambiar el rol de una terminal
1. En la computadora que deseas configurar, abre el POS y ve a: `Setup > Hardware > Caja`.
2. En la sección **Rol de esta Estación**, selecciona:
   * `[X] Terminal de Caja (Con Cajón y Cobro)`
   * `[ ] Terminal de Mesero (Solo Comandas y Cocina)`
3. Presiona **Guardar**.

---

## 4. VINCULACIÓN DE CLIENTES Y LETRERO QR IMPRIMIBLE POR CAJA

### A. El problema de los monitores sencillos
Muchos negocios cuentan con computadoras de un solo monitor orientado a la cajera, sin pantalla secundaria de cara al comensal. Si tienes varias cajas juntas (Caja 1, Caja 2, etc.), surge la pregunta: *¿Cómo sabe el cliente qué código escanear para vincular su cuenta?*

### B. ¿Cada caja tiene un QR diferente?
**SÍ.** Cada terminal genera un código QR de emparejamiento dinámico y único. La Caja 1 tiene su propio código y la Caja 2 el suyo. Esto garantiza que si el cliente está frente a la Caja 2, su teléfono móvil se enlace con la orden que la cajera 2 le está tomando en ese instante.

### C. Cómo imprimir el letrero profesional
1. Dirígete a: `Setup > Hardware > Caja`.
2. Haz clic en el botón verde: **[ Print Customer QR Sign / Imprimir Letrero QR ]**.
3. Selecciona el número de caja deseado (ej. Caja 1 o Caja 2).
4. El sistema genera una plantilla de alta resolución lista para imprimir:
   * Formato para papel térmico de 80mm en impresora de recibos.
   * Formato para impresora estándar de oficina en tamaño Carta (8.5" x 11").
5. **Recomendación de Montaje:** Imprime el letrero, lamínalo o enmícalo para protegerlo del calor y la grasa, y fíjalo en el reverso del monitor de la caja apuntando hacia el cliente con la indicación:
   > *"Por favor escanee este código para vincular su cuenta en esta caja."*

---

## 5. INTEGRACIÓN ALL-IN-ONE DE DELIVERY: DOORDASH, UBER EATS Y GRUBHUB

Impossible POS erradica la pesadilla de tener 5 tabletas diferentes en la caja registradora.

### A. Flujo de Pedidos Unificado
1. Las órdenes de **DoorDash, Uber Eats, Grubhub y tu Tienda Web Online** ingresan directamente a la base de datos de la caja principal y a las pantallas de Cocina KDS.
2. Cada pedido se identifica en la pantalla de cocina con una alarma sonora y su color oficial:
   * **DoorDash:** Rojo (#FF3008)
   * **Uber Eats:** Verde (#06C167)
   * **Grubhub:** Naranja (#FF8000)
   * **Tienda Online Propia:** Azul (#0A84FF)

### B. Despacho Ultrarrápido con Escáner USB
Cuando el repartidor (Dasher o Uber Driver) llega al local:
1. El chofer muestra la pantalla de su celular con el código de barras o QR de la orden.
2. La cajera apunta el escáner USB estándar al teléfono del chofer.
3. El sistema busca la orden en 0.2 segundos, despliega los productos en pantalla para verificar que la bolsa esté completa y muestra el botón verde: **[ Entregar a Repartidor ]**.
4. Se registra la entrega con fecha y hora exacta, eliminando disputas por entregas erróneas.

### C. Simulador de Pruebas de 1 Clic
Para capacitar a tu personal sin costo:
1. Ve a `Opciones > Configuración > Negocio y Servicios > Canales y Delivery`.
2. Presiona **[ Probar Pedido DoorDash ]** o **[ Probar Pedido Uber Eats ]**.
3. Verás la orden entrar en vivo a la pantalla de cocina con timbre sonoro.

---

## 6. NOTIFICACIONES A CLIENTES: TELEGRAM BOT 100% GRATIS VS TWILIO SMS

Impossible POS ofrece máxima flexibilidad para avisar a clientes de pedidos para llevar (To-Go) o autoservicio.

### A. Telegram Bot (Recomendado — $0 Costo Mensual)
* **Ventajas:** Notificaciones instantáneas ilimitadas, cero tarifas por mensaje, cero contratos con telefónicas y sin bloqueos de operadoras (A2P 10DLC).
* **Configuración en 2 Minutos:**
  1. En la app de Telegram, busca el usuario oficial `@BotFather`.
  2. Envía el comando `/newbot`.
  3. Dale un nombre y usuario a tu bot (ej. `MiRestauranteBot`).
  4. Copia el **Bot Token** generado.
  5. En Impossible POS ve a: `Setup > Hardware > Food Hub`.
  6. Pega el Bot Token y escribe el nombre de usuario de tu bot. Haz clic en Guardar.
* **Uso del Cliente:** En el ticket impreso aparece el QR de Telegram. El cliente lo escanea, pulsa "Start" y recibe alertas automáticas en su celular cuando su comida entra a cocina y cuando está empacada lista para entrega.

### B. Twilio SMS (Mensajes de Texto Tradicionales)
* Si tu clientela prefiere recibir SMS directos a su línea celular:
* En `Setup > Hardware > Food Hub` ingresa tu **Account SID**, **Auth Token** y **Número de Twilio**.
* Sujeto a tarifas directas de telefonía cobradas por Twilio.

---

## 7. PANTALLAS DE COCINA (KDS) ILIMITADAS Y RUTEO DE IMPRESIÓN

A diferencia de otros sistemas que cobran $50 a $100 dólares mensuales por cada pantalla de cocina, Impossible POS incluye **pantallas KDS ilimitadas 100% Gratis**.

### A. Estaciones Disponibles
* **Cocina KDS (`START_KITCHEN_KDS.bat`):** Comandas calientes con temporizadores de color (Verde $\to$ Amarillo $\to$ Rojo).
* **Bar KDS (`START_BAR_KDS.bat`):** Bebidas y coctelería.
* **Runner KDS (`START_RUNNER_KDS.bat`):** Empaque y entrega de órdenes.
* **Pastelería KDS (`START_CUSTOM_ORDERS_KDS.bat`):** Pedidos especiales de pasteles con fotos.
* **Lobby TV (`START_LOBBY_TV.bat`):** Pantalla pública de turnos para clientes en sala de espera.

### B. Ruteo Inteligente por Impresora
En `Setup > Hardware > Impresoras`, puedes asignar qué categorías se imprimen en cada equipo: los tacos salen en la impresora de cocina, los tragos en la barra y las tortas en pastelería. Compatible con impresoras térmicas Epson, Star Micronics, Rongta y Munbyn (USB y Ethernet).

---

## 8. SEGURIDAD TOTAL: CÁMARAS CCTV NVR Y GRABACIÓN DE PANTALLA

Impossible POS erradica las mermas y el robo en caja mediante integración directa con tu sistema de videovigilancia.

### A. Sobreimpresión de Texto en Cámaras CCTV (NVR Text Overlay)
* Se conecta a grabadores NVR Annke, Hikvision o compatibles por puerto TCP 10010.
* Cada producto que la cajera marca en pantalla se estampa en letras blancas sobre el video en vivo de la cámara de seguridad apuntando al cajón de dinero.

### B. Grabación de Pantalla Anti-Fraude
* Registra en video continuo cada toque en pantalla de los cajeros.
* Si un empleado desconecta el disco duro externo para ocultar una transacción, el software bloquea automáticamente la caja registradora hasta que el disco sea reconectado.

### C. Lector Biométrico USB (ZKTeco)
* Permite inicio de sesión de cajeros y autorizaciones gerenciales mediante huella dactilar real en 0.2 segundos, eliminando el préstamo de contraseñas.

---

## 9. RESPALDO EN LA NUBE Y RECUPERACIÓN DE DESASTRES

Tu catálogo de menú, precios y recetas nunca se perderán.

### A. Respaldo a la Nube (Cloud Backup)
En `Opciones > Configuración > Database`, presiona **[ Cloud Menu Backup ]** para almacenar tus productos, precios y departamentos en el servidor seguro de Impossible POS.

### B. Restauración Rápida con PIN en el Local
Si por error se modificaron precios o productos en el local, haz clic en **[ Cloud Menu Restore ]** e ingresa tu PIN de Manager o el **PIN Maestro de Soporte (2026)** para recuperar el menú en 2 segundos.

### C. Recuperación en Computadora Nueva (Reemplazo)
Si la computadora se dañó físicamente, fue robada o se mojó:
1. Instala Impossible POS en cualquier computadora nueva.
2. Selecciona **New Machine Setup**.
3. Ingresa tu **Email y Contraseña de Dueño** (o tu Clave de Licencia).
4. El sistema descarga tu menú completo de la nube y queda listo para operar.

---

## 10. PORTAL CLOUD DE DUEÑOS Y SOPORTE TÉCNICO

### A. Portal Web de Dueños ([impossiblepos.com/portal.html](https://impossiblepos.com/portal.html))
Monitorea tu negocio en vivo desde tu celular, tablet o computadora en casa:
* Ventas brutas y netas en tiempo real.
* Desglose de efectivo vs tarjeta de crédito.
* Cortes Z de cada turno e historial de transacciones.
* Ranking de platillos más vendidos y horas pico.

### B. Canales Oficiales de Soporte Técnico
* **Asistente Virtual con IA:** En la caja registradora ve a `Opciones > Support Center` para chatear con el Experto en Diagnósticos Virtuales.
* **Soporte Remoto por RustDesk:** Solicita conexión remota segura de 1 clic para que un ingeniero configure tus impresoras o menú sin costo.
* **WhatsApp Directo:** Escríbenos las 24 horas al **+1 (313) 312-9090**.

---
*© 2026 IT Cyber Work L.L.C. Todos los derechos reservados. Impossible POS™ es una marca registrada.*
