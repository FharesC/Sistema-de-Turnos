# Sistema de Turnos (Full-Stack)

Bienvenido al repositorio oficial del **Sistema de Turnos**, una solución integral moderna y eficiente para la gestión de colas, atención al cliente y administración operativa. Este proyecto está dividido en una arquitectura de frontend y backend desacoplados.

## 📁 Estructura del Repositorio

El proyecto se organiza de la siguiente manera:

- **[`sistema-de-turnos/`](./sistema-de-turnos/)**: El cliente frontend desarrollado con **Next.js 16**, Tailwind CSS y Redux Toolkit.
- **[`turnos-backend/`](./turnos-backend/)**: La API REST desarrollada con **Node.js**, Express y Sequelize (MySQL/PostgreSQL).
- **[`db.sql`](./db.sql)**: Script de inicialización de la base de datos con el esquema necesario.

---

## 🚀 Características Principales

- **Gestión de Turnos en Tiempo Real**: Creación y seguimiento granular del estado de cada turno.
- **Pantallas Especializadas**:
  - **Pantalla de Espera**: Interfaz visual para que los clientes consulten su turno.
  - **Pantalla de Atención**: Interfaz optimizada para el llamado de turnos desde las mesas.
- **Administración Operativa**: Gestión de Mesas (puestos de atención) y Tipos de Servicio.
- **Seguridad**: Autenticación basada en roles (Admin/Operador) mediante JWT.
- **Estadísticas**: Panel de control con métricas del día actual.

---

## 🛠️ Stack Tecnológico

### Frontend

- **Framework**: Next.js 16 (App Router) + TypeScript.
- **Estado**: Redux Toolkit.
- **Estilos**: Tailwind CSS + Radix UI + Lucide Icons.
- **Validación**: React Hook Form + Zod.
- **Comunicación**: Axios.

### Backend

- **Entorno**: Node.js + Express.
- **Base de Datos**: MySQL/PostgreSQL (gestionado con Sequelize ORM).
- **Seguridad**: JWT (JSON Web Tokens) y Bcrypt para hashing de contraseñas.
- **Documentación**: API REST estructurada.

---

## ⚙️ Configuración e Instalación

### 1. Base de Datos

1.  Asegúrate de tener un servidor SQL (MySQL recomendado) corriendo.
2.  Importa el archivo `db.sql` para crear las tablas necesarias.

### 2. Backend (`turnos-backend/`)

1.  Entra a la carpeta: `cd turnos-backend`.
2.  Instala dependencias: `npm install`.
3.  Copia el archivo `.env.example` a `.env` y configura tus credenciales de base de datos y el `JWT_SECRET`.
4.  Inicia el servidor: `npm run dev` (por defecto en `http://localhost:5000`).

### 3. Frontend (`sistema-de-turnos/`)

1.  Entra a la carpeta: `cd sistema-de-turnos`.
2.  Instala dependencias: `npm install`.
3.  Crea un archivo `.env` y configura la variable `NEXT_PUBLIC_API_URL=http://localhost:5000/api`.
4.  Inicia la aplicación: `npm run dev` (por defecto en `http://localhost:3000`).

---

## 📖 Documentación Detallada

Para obtener información específica sobre los endpoints de la API o la arquitectura detallada del frontend, por favor consulta los README individuales en cada subdirectorio:

- [Documentación del Frontend](./sistema-de-turnos/README.md)
- [Documentación de la API (Backend)](./turnos-backend/README.md)

---

## 🤝 Contribución

Si deseas contribuir:

1.  Haz un Fork del proyecto.
2.  Crea una rama para tu característica (`git checkout -b feature/NuevaMejora`).
3.  Haz commit de tus cambios (`git commit -m 'Añade nueva mejora'`).
4.  Push a la rama (`git push origin feature/NuevaMejora`).
5.  Abre un Pull Request.
