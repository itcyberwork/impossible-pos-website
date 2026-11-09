# Impossible POS - Guia Universal de Configuracion de Hardware y Pantallas

## Resumen
Esta guia visual rapida explica como conectar y configurar todas las estaciones de hardware secundarias (Pantalla de Cocina KDS, Panaderia, Bar, Ordenes Especiales, Estacion de Fotos, Pantalla de Turnos Lobby TV, Despachador Runner, Recepcion Hostess, Kioscos de Autoservicio e Impresoras Termicas) sin memorias USB y con maxima facilidad.

---

## 3 Pasos Sencillos para Conectar Cualquier Pantalla

### Paso 1: Descargar el Instalador en la Pantalla Secundaria
1. Abre el navegador web en tu monitor tactil, tableta o computadora secundaria (Cocina, Bar, Turnos, Kiosco).
2. Entra a la direccion de la Caja Principal (ejemplo: `http://192.168.1.100:3000`) o visita `https://impossiblepos.com`.
3. Descarga el archivo instalador unico:
   **`Impossible_POS_Hardware_Setup.bat`**

### Paso 2: Elegir el Numero de Estacion (Opciones 1 al 13)
1. Haz doble clic en **`Impossible_POS_Hardware_Setup.bat`**.
2. Escribe el numero de la estacion que deseas:
   - **`1`** Pantalla de Cocina (KDS)
   - **`2`** KDS Panaderia y Pasteles
   - **`3`** KDS Bar y Bebidas
   - **`4`** Ordenes Especiales y Banquetes
   - **`5`** Estacion de Fotos (Photo Hub)
   - **`6`** Pantalla de Turnos y Sala (Lobby TV)
   - **`7`** Monitor Despachador (Runner Hub)
   - **`8`** Recepcion y Mesas (Hostess)
   - **`9`** Kiosco de Autoservicio para Clientes
   - **`10`** Caja Registradora Secundaria
   - **`11`** Impresoras Termicas y Cajon de Dinero
   - **`12`** Emparejamiento Smart TV por Codigo de 4 Digitos
   - **`13`** Instalar Accesos para Todas las Estaciones
3. Presiona **Enter**. El acceso directo de escritorio se crea inmediatamente con reconexion automatica al servidor.

### Paso 3: Emparejamiento Inteligente de 4 Digitos (Plug and Play)
1. Abre el acceso creado o entra a `http://[IP_SERVIDOR]:3000/pair.html` en la pantalla.
2. La pantalla mostrara un codigo grande de 4 numeros (ejemplo: **`7421`**).
3. En la Caja Registradora Principal aparecera un aviso inmediato:
   *"Nueva Pantalla Desea Conectarse: Pantalla de Cocina (Codigo: 7421)"*
4. Haz clic en **Aceptar y Conectar**.
5. La pantalla comenzara a trabajar al instante sin escribir direcciones IP ni contraseñas.

---

## Tabla de Referencia de Estaciones

| Opcion | Nombre de Estacion | Hardware Recomendado | Proposito Operativo | Enlace Directo |
|---|---|---|---|---|
| **1** | Pantalla de Cocina (KDS) | Monitor Tactil 15"-21" / Tableta | Comandas calientes, tiempos de cocina, despachos | `/cocina.html` |
| **2** | KDS Panaderia y Pasteles | PC Todo-en-Uno / Tactil | Pedidos de panaderia, pasteles personalizados, fotos | `/cocina.html?dept=bakery` |
| **3** | KDS Bar y Bebidas | Pantalla Tactil 10"-15" Resistente | Cocteles, cervezas, cafes y bebidas para cantineros | `/kds_bar.html` |
| **4** | Ordenes Especiales | PC de Oficina / Tableta | Pedidos a futuro, anticipos, logistica y entregas | `/cocina.html?dept=special` |
| **5** | Estacion de Fotos (Photo Hub) | Tableta / Telefono / Camara Web | Tomar fotos de pasteles listos y adjuntar al ticket | `/comanda_pastel.html` |
| **6** | Pantalla de Turnos (Lobby TV) | Smart TV 32"-65" / HDMI Stick | Estado para clientes: Preparando y Listo para recoger | `/espera.html` |
| **7** | Despachador (Runner Hub) | Pantalla de 15" para Empaque | Armado de bolsas, escaneo y entrega a choferes | `/cocina.html?role=runner` |
| **8** | Recepcion y Mesas (Hostess) | Tableta de 10" en Entrada | Plano de mesas, lista de espera, avisos por SMS | `/hostess.html` |
| **9** | Kiosco de Autoservicio | Kiosco Vertical Tactil 21"-32" | El cliente ordena y paga solo con tarjeta | `/kiosco.html` |
| **10** | Caja Registradora Secundaria | Cajon de Dinero + Lector Codigo | Caja de cobro adicional con la misma base de datos | `/caja_v14.html` |
| **11** | Impresoras Termicas y Cajon | Impresora Termica USB (80mm/58mm)| Servicio de impresion local en Windows y pulso de cajon| Servicio Local Windows |
| **12** | Emparejamiento por Codigo | Cualquier Navegador / Smart TV | Abre el portal para emparejar la pantalla por codigo | `/pair.html` |
| **13** | Instalar Todas las Estaciones | Computadora de Uso Multiple | Crea los accesos directos de todas las pantallas a la vez | Paquete Completo |

---

## Configuracion de Impresoras Termicas y Cajon

### Impresoras Termicas de Recibos (USB ESC/POS)
1. Conecta la impresora termica a un puerto USB.
2. Instala el controlador del fabricante (Epson, Star, MUNBYN, Rongta, etc.).
3. Ejecuta la Opcion **`11`** en `Impossible_POS_Hardware_Setup.bat` para registrar el servicio de impresion.
4. En Impossible POS, ve a **Ajustes > Hardware** y selecciona tu impresora.

### Apertura Automatica del Cajon de Dinero (RJ11)
1. Conecta el cable RJ11 desde abajo del cajon al conector trasero de la impresora termica (puerto DK).
2. Al cobrar una venta en efectivo, la impresora envia la señal electrica y el cajon se abre solo.
3. Tambien puedes abrir el cajon en cualquier momento usando el boton **Abrir Cajon** de la barra superior del POS.

---

## Lista de Verificacion de Red y Solucion de Problemas
- **Misma Red Local:** Todas las pantallas, tabletas y kioscos deben estar conectados al mismo modem o router que la Caja Principal.
- **Excepciones de Firewall:** El instalador abre automaticamente los puertos `3000` y `8080` en el Firewall de Windows para asegurar la comunicacion sin bloqueos.
- **Mover Pantallas de Lugar:** Si cambias una pantalla de habitacion o de red, solo abre `/pair.html` en la pantalla y aprueba el nuevo codigo de 4 digitos en la Caja Principal.
