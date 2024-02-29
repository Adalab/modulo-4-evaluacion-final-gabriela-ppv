### Bienvenidos a mi Ejercicio de Evaluación Final, Modulo 4.

Este proyecto forma parte del Módulo 4 y tiene como objetivo desarrollar un API que permita realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) utilizando Express.js, Node.js y una base de datos, que puede ser MongoDB o MySQL.
En mi caso, elegi, desarrollar una API de peliculas de Tim Burton.

#### Bonus:
Además de implementar los endpoints básicos, he  agregado funcionalidades extras:

- **Registro de Usuarios:**
  - La contraseña se encripta antes de almacenarla en la base de datos.
  - Se genera y devuelve un token JWT al usuario registrado para autenticación.

- **Inicio de Sesión (Login):**
  - Permite que un usuario existente inicie sesión.
  - Verifica las credenciales proporcionadas con los registros de la base de datos.
  - Genera y devuelve un token JWT para autenticar al usuario.
  - Implementa un middleware de autenticación que verifique el token JWT en cada solicitud del API. Si
    el token es válido, permite que la solicitud continúe; de lo contrario, devuelve un error de
    autenticación.
    
**Cierre  de Sesión (Logout):**
- Permite que un usuario existente cierre su sesión.

#### Configuración:

1. **Instalación de Dependencias:**
   - Asegúrate de tener Node.js instalado en tu sistema.
   - Clona este repositorio en tu máquina local.
   - Ejecuta `npm install` para instalar todas las dependencias necesarias.

2. **Variables de Entorno:**
   - Utiliza una librería como dotenv para gestionar las contraseñas y los datos de acceso a la base de datos con variables de entorno. Crea un archivo `.env` en la raíz del proyecto y agrega las variables necesarias.

3. **Despliegue:**
   - Puedes desplegar el servidor de la API en un servicio como Render para que esté disponible en Internet.

4. **Frontend:**
   - Agrega una carpeta configurada con un servidor de archivos estáticos que contiene una landing donde aparecen la lista de las peliculas desde la base de datos.

5. **Documentación:**
   - Instalacion y configuracion de la librería Swagger para generar una página web con la documentación de los endpoints de mi API.

#### Uso:

Una vez que el servidor esté en funcionamiento, puedes realizar solicitudes HTTP al API para registrar e iniciar sesión. Aquí tienes los puntos finales disponibles:

- **Registro de Usuario:** 
  - `POST /register`
  - Envía una solicitud con el correo electrónico (`email`) y la contraseña (`password`) del usuario que deseas registrar.
  - Recibirás un token JWT como respuesta si el registro es exitoso.

- **Inicio de Sesión (Login):** 
  - `POST /login`
  - Envía una solicitud con el correo electrónico (`email`) y la contraseña (`password`) del usuario para iniciar sesión.
  - Recibirás un token JWT como respuesta si las credenciales son correctas.

#### Contribución:

Si deseas contribuir a este proyecto, ¡no dudes en abrir un problema o enviar una solicitud de extracción!

#### Clonar Repositorio:

Puedes clonar este repositorio desde [aquí](https://github.com/Adalab/modulo-4-evaluacion-final-gabriela-ppv.git).

#### Licencia:

Este proyecto está licenciado bajo la [Licencia MIT](LICENSE).



