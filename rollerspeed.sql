-- Creación de la base de datos
CREATE DATABASE rollerspeed CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rollerspeed;

-- Tabla de Estudiantes
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero ENUM('M','F','Otro') NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    medio_pago VARCHAR(50),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Instructores
CREATE TABLE instructores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    correo VARCHAR(150) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Clases
CREATE TABLE clases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel VARCHAR(50),
    horario VARCHAR(100),
    id_instructor INT,
    FOREIGN KEY (id_instructor) REFERENCES instructores(id)
);

-- Relación Estudiantes - Clases
CREATE TABLE estudiantes_clases (
    id_estudiante INT,
    id_clase INT,
    PRIMARY KEY (id_estudiante, id_clase),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_clase) REFERENCES clases(id)
);

-- Tabla de Pagos
CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    estado ENUM('Pendiente','Pagado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);
