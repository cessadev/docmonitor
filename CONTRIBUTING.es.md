# Contribuir a DocMonitor

¡Gracias por tu interés en DocMonitor! Esta página explica cómo puedes ayudar y, igual de importante, qué permite y qué no permite la licencia.

> Esta es la traducción al español de [CONTRIBUTING.md](CONTRIBUTING.md). Si las dos versiones difieren, prevalece la versión en inglés.

## Lee esto primero: la licencia

DocMonitor se publica bajo la [PolyForm Strict License 1.0.0](LICENSE). Es de **código disponible** (*source-available*), no de código abierto. En resumen:

- **Puedes** leer el código y usar la app con fines no comerciales.
- **No puedes** distribuirla, modificarla ni usarla comercialmente sin el permiso del autor.

Por eso las contribuciones de código funcionan distinto a las de un proyecto de código abierto típico. Consulta [Contribuciones de código](#contribuciones-de-código) más abajo.

## Formas de ayudar

### Reportar errores

Abre un issue e incluye todo lo que puedas de esto:

- Versión de DocMonitor (se ve en la información del paquete de la app) y de dónde la obtuviste.
- Versión de macOS y tipo de Mac (Apple silicon o Intel).
- Motor de Docker y su versión (Docker Desktop, Colima, OrbStack, etc.).
- Pasos para reproducirlo, lo que esperabas y lo que ocurrió en su lugar.
- Capturas de pantalla o mensajes de error, si los hay.

Busca primero en los issues existentes y elimina cualquier dato sensible (nombres de contenedores, variables de entorno, credenciales de registros) antes de publicar.

### Sugerir funciones o mejoras

Abre un issue y describe el problema que quieres resolver antes de proponer una solución. Las sugerencias son bienvenidas, pero el autor decide qué encaja en el proyecto y no hay garantía de que una sugerencia se implemente.

### Probar y dar tu opinión

Probar DocMonitor en distintas configuraciones (otros motores de Docker, otros modelos de Mac, otras versiones de macOS 26) y contar qué funciona y qué no es muy valioso.

### Mejorar la documentación

Los errores tipográficos, los pasos poco claros y la información que falta en el README o en este archivo son bienvenidos como issues. Las traducciones siguen las mismas reglas que las contribuciones de código descritas abajo.

### Difundir el proyecto

Darle una estrella al repositorio y enlazarlo, o enlazar el [último release](https://github.com/cessadev/docmonitor/releases/latest), ayuda mucho. Por favor enlaza el release en lugar de volver a subir la app (consulta [Qué no está permitido](#qué-no-está-permitido)).

## Contribuciones de código

La licencia no permite modificar el software por defecto, así que las contribuciones de código se gestionan así:

1. **Abre primero un issue** y espera a que el autor esté de acuerdo con el cambio. Por favor no envíes un pull request que no se haya hablado antes.
2. **Permiso para preparar la contribución.** Una vez acordado el cambio, puedes hacer una copia privada del repositorio (por ejemplo, un fork en GitHub) y modificarla **únicamente** para preparar esa contribución. Este permiso no te deja publicar ni distribuir tu copia modificada con ningún otro fin que no sea tu fork en GitHub y el pull request a este repositorio.
3. **Tu contribución.** Al abrir un pull request confirmas que:
   - la escribiste tú, o tienes derecho a enviarla, y no incluye código bajo términos que entren en conflicto con la licencia de este proyecto o con los derechos de tu empleador;
   - conservas los derechos de autor de tu contribución, y le concedes al autor una licencia perpetua, mundial, irrevocable, libre de regalías y no exclusiva para usarla, copiarla, modificarla, distribuirla y sublicenciarla como parte de DocMonitor, bajo la licencia actual o cualquier licencia futura.
4. **El autor decide.** Cualquier contribución puede ser aceptada, modificada o rechazada. Las contribuciones aceptadas se distribuyen como parte de DocMonitor bajo su licencia.

### Pautas para los pull requests

- Compila con Xcode 26 o posterior (consulta [Compilar desde el código fuente](README.es.md#compilar-desde-el-código-fuente)) y comprueba que la app compila y se ejecuta.
- Mantén cada pull request centrado en un solo cambio.
- Sigue el estilo del código Swift y SwiftUI que lo rodea y la estructura de carpetas existente (`App`, `Core`, `Features`, `UI`).
- Usa mensajes de commit cortos que empiecen con un prefijo como `add:`, `fix:` o `improve:`, igual que el historial actual.
- Explica qué hace el cambio y cómo lo probaste.

## Qué no está permitido

Sin el permiso escrito del autor, no puedes:

- Redistribuir DocMonitor, ni en código fuente ni compilado. Eso incluye volver a subir los builds de los releases, hacer mirrors e incluirlo en otros productos o repositorios de paquetes.
- Publicar versiones modificadas de DocMonitor ni releases compilados desde tu fork.
- Usar DocMonitor con fines comerciales, por ejemplo como parte de un producto o servicio de pago.
- Quitar o cambiar los avisos de licencia.

GitHub permite que cualquiera haga un fork de un repositorio público dentro de GitHub. Eso es una función de la plataforma y no concede ninguna licencia adicional para usar el fork en otro lugar.

## Uso comercial y otros permisos

Si quieres usar DocMonitor comercialmente, empaquetarlo, redistribuirlo o hacer cualquier otra cosa que la licencia no cubra, abre un issue con el título **"Permission request"** explicando lo que tienes en mente. El autor puede conceder permisos caso por caso.

## Sé respetuoso

Por favor sé amable y constructivo en los issues y pull requests. Los reportes y comentarios abusivos o fuera de tema pueden cerrarse o eliminarse.
