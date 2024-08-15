## Tarea Técnica: Posición Ruby on Rails + JavaScript

### Objetivo:
El candidato desarrollará una aplicación simple que demuestre su capacidad para trabajar con Ruby on Rails, tanto en el backend como en el frontend. La tarea está diseñada para evaluar sus habilidades en desarrollo full-stack, incluyendo diseño de API, gestión de bases de datos y desarrollo de interfaces de usuario.

### Descripción de la Tarea:
El candidato debe crear una aplicación de blog donde los usuarios puedan crear una cuenta, iniciar sesión y gestionar sus publicaciones. La aplicación debe incluir las siguientes funcionalidades:

#### Autenticación de Usuarios:
- Implementar el registro, inicio de sesión y cierre de sesión de usuarios.
- Usar Devise para la autenticación en Rails.
- Las contraseñas deben ser almacenadas de forma segura y encriptada.

#### Operaciones CRUD:
- Los usuarios deben poder crear, leer, actualizar y eliminar publicaciones de blog.
- Cada publicación debe tener un título, cuerpo y marcas de tiempo (timestamps).
- Solo los usuarios autenticados deben poder gestionar sus propias publicaciones.

#### Diseño de API:
- Implementar una API JSON en Ruby on Rails para gestionar las publicaciones del blog.
- La API debe soportar los siguientes endpoints:
  - `GET /api/posts`: Listar todas las publicaciones.
  - `POST /api/posts`: Crear una nueva publicación.
  - `GET /api/posts/:id`: Obtener una publicación específica.
  - `PATCH /api/posts/:id`: Actualizar una publicación.
  - `DELETE /api/posts/:id`: Eliminar una publicación.

#### Interfaz de Usuario:
- Crear una interfaz de usuario utilizando Rails para interactuar con la API.
- La interfaz debe incluir las siguientes páginas:
  - **Página Principal:** Lista de todas las publicaciones de blog con la capacidad de hacer clic y ver una publicación individual.
  - **Página de Inicio de Sesión:** Formulario para iniciar sesión.
  - **Página de Registro:** Formulario para registrar un nuevo usuario.
  - **Página de Gestión de Publicaciones:** Permitir a los usuarios autenticados crear, actualizar y eliminar sus publicaciones.

#### Integración Frontend-Backend:
- La interfaz de usuario debe comunicarse con la API de Rails de manera fluida.
- Implementar manejo de errores para las solicitudes a la API.
- La interfaz debe ser intuitiva y fácil de usar.

### Bonus (Opcional):
- Añadir paginación a la lista de publicaciones.
- Implementar validación de formularios en el servidor.
- Desplegar la aplicación en una plataforma como Heroku.

### Criterios de Evaluación:

#### Calidad del Código:
- Código limpio, legible y mantenible.
- Uso adecuado de la arquitectura MVC en Rails.
- Estructura correcta de las vistas y controladores.

#### Funcionalidad:
- Todas las funcionalidades requeridas deben estar completamente operativas.
- La aplicación debe manejar correctamente casos extremos (p.ej., entradas inválidas, errores de API).

#### Seguridad:
- Manejo adecuado de la autenticación y autorización.
- Almacenamiento seguro de las contraseñas de los usuarios.
- Protección contra vulnerabilidades web comunes (p.ej., CSRF, XSS).

#### Diseño de API:
- Endpoints API bien diseñados y RESTful.
- Uso correcto de códigos de estado HTTP y respuestas.

#### Integración Frontend-Backend:
- Interacción fluida entre la interfaz de usuario y el backend.
- Manejo adecuado de solicitudes asincrónicas y flujos de datos.

#### Experiencia del Usuario:
- Interfaz intuitiva y fácil de usar.
- Diseño responsivo (la aplicación debe funcionar bien en diferentes tamaños de pantalla).

#### Pruebas:
- Pruebas con RSpec para el backend de Rails (modelos, controladores).
- Validaciones y pruebas básicas de la interfaz.

