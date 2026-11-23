
-- =============================================
-- PROYECTO: SISTEMA DE RECURSOS HUMANOS
-- MOTOR DE BASE DE DATOS: POSTGRESQL
-- SCRIPT: CREACION DE TABLAS
-- =============================================

-- 1. TABLA PAISES
CREATE TABLE paises (
    pais_id INTEGER GENERATED ALWAYS AS IDENTITY,
    pais_nombre VARCHAR(100) NOT NULL,

    CONSTRAINT pk_paises PRIMARY KEY (pais_id)
);

-- 2. TABLA CIUDADES
CREATE TABLE ciudades (
    ciudad_id INTEGER GENERATED ALWAYS AS IDENTITY,
    pais_id INTEGER NOT NULL,
    ciudad_nombre VARCHAR(100) NOT NULL,

    CONSTRAINT pk_ciudades PRIMARY KEY (ciudad_id),
    CONSTRAINT fk_ciudades_paises
        FOREIGN KEY (pais_id)
        REFERENCES paises (pais_id)
);

-- 3. TABLA LOCALIZACIONES
CREATE TABLE localizaciones (
    localiz_id INTEGER GENERATED ALWAYS AS IDENTITY,
    ciudad_id INTEGER NOT NULL,
    localiz_direccion VARCHAR(200) NOT NULL,

    CONSTRAINT pk_localizaciones PRIMARY KEY (localiz_id),
    CONSTRAINT fk_localizaciones_ciudades
        FOREIGN KEY (ciudad_id)
        REFERENCES ciudades (ciudad_id)
);

-- 4. TABLA CARGOS
CREATE TABLE cargos (
    cargo_id INTEGER GENERATED ALWAYS AS IDENTITY,
    cargo_nombre VARCHAR(100) NOT NULL,
    cargo_sueldo_minimo NUMERIC(12, 2) NOT NULL,
    cargo_sueldo_maximo NUMERIC(12, 2) NOT NULL,

    CONSTRAINT pk_cargos PRIMARY KEY (cargo_id)
);

-- 5. TABLA DEPARTAMENTOS
CREATE TABLE departamentos (
    departamento_id INTEGER GENERATED ALWAYS AS IDENTITY,
    departamento_nombre VARCHAR(100) NOT NULL,

    CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id)
);

-- 6. TABLA EMPLEADOS
CREATE TABLE empleados (
    empleado_id INTEGER GENERATED ALWAYS AS IDENTITY,
    primer_nombre VARCHAR(100) NOT NULL,
    segundo_nombre VARCHAR(100),
    email VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sueldo NUMERIC(12, 2) NOT NULL,
    comision NUMERIC(12, 2),
    cargo_id INTEGER NOT NULL,
    gerente_id INTEGER,
    departamento_id INTEGER NOT NULL,

    CONSTRAINT pk_empleados PRIMARY KEY (empleado_id),

    CONSTRAINT fk_empleados_cargos
        FOREIGN KEY (cargo_id)
        REFERENCES cargos (cargo_id),

    CONSTRAINT fk_empleados_gerentes
        FOREIGN KEY (gerente_id)
        REFERENCES empleados (empleado_id),

    CONSTRAINT fk_empleados_departamentos
        FOREIGN KEY (departamento_id)
        REFERENCES departamentos (departamento_id)
);

-- 7. TABLA HISTORICO
CREATE TABLE historico (
    emphist_id INTEGER GENERATED ALWAYS AS IDENTITY,
    emphist_fecha_retiro DATE NOT NULL,
    emphist_cargo_id INTEGER NOT NULL,
    emphist_dpto_id INTEGER NOT NULL,

    CONSTRAINT pk_historico PRIMARY KEY (emphist_id),

    CONSTRAINT fk_historico_cargos
        FOREIGN KEY (emphist_cargo_id)
        REFERENCES cargos (cargo_id),

    CONSTRAINT fk_historico_departamentos
        FOREIGN KEY (emphist_dpto_id)
        REFERENCES departamentos (departamento_id)
);
