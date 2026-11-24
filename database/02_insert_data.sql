
-- =============================================
-- PROYECTO: SISTEMA DE RECURSOS HUMANOS
-- MOTOR DE BASE DE DATOS: POSTGRESQL
-- SCRIPT: INSERCION DE DATOS DE PRUEBA
-- =============================================

-- 1. DATOS DE PAISES
INSERT INTO public.paises (pais_nombre)
VALUES
    ('Colombia'),
    ('Argentina'),
    ('Chile'),
    ('Peru'),
    ('Uruguay'),


-- 2. DATOS DE CIUDADES
INSERT INTO public.ciudades (pais_id, ciudad_nombre)
VALUES
    (1, 'Bogota'),
    (1, 'Medellin'),
    (1, 'Cali'),
    (2, 'Buenos Aires'),
    (2, 'Cordoba'),
    (3, 'Santiago'),
    (3, 'Valparaiso'),
    (4, 'Lima'),
    (4, 'Cusco'),
    (5, 'Montevideo');


-- 3. DATOS DE LOCALIZACIONES
INSERT INTO public.localizaciones (ciudad_id, localiz_direccion)
VALUES
    (1, 'Calle 80, Bogota'),
    (1, 'Carrera 7, Bogota'),
    (2, 'Avenida Oriental, Medellin'),
    (2, 'Calle 10, Medellin'),
    (4, 'Avenida 9 de Julio, Buenos Aires'),
    (4, 'Calle Florida, Buenos Aires'),
    (6, 'Avenida Libertador, Santiago'),
    (6, 'Calle Providencia, Santiago'),
    (8, 'Avenida Arequipa, Lima'),
    (8, 'Jiron de la Union, Lima');


-- 4. DATOS DE CARGOS
INSERT INTO public.cargos (
    cargo_nombre,
    cargo_sueldo_minimo,
    cargo_sueldo_maximo
)
VALUES
    ('Desarrollador Junior', 2000000, 3500000),
    ('Desarrollador Senior', 4500000, 8000000),
    ('Analista de Calidad', 2500000, 4500000),
    ('Gerente de Proyectos', 5000000, 9000000),
    ('Administrador de Bases de Datos', 3500000, 6500000);


-- 5. DATOS DE DEPARTAMENTOS
INSERT INTO public.departamentos (departamento_nombre)
VALUES
    ('Tecnologia'),
    ('Recursos Humanos'),
    ('Finanzas'),
    ('Operaciones'),
    ('Marketing');


-- 6. DATOS DE EMPLEADOS
-- Primero se registra el gerente principal.
-- Los demas empleados lo referencian mediante gerente_id.

INSERT INTO public.empleados (
    primer_nombre,
    segundo_nombre,
    email,
    fecha_nacimiento,
    sueldo,
    comision,
    cargo_id,
    gerente_id,
    departamento_id
)
VALUES (
    'Carlos',
    'Andres',
    'carlos.andres@empresa.com',
    '1985-04-12',
    7000000,
    NULL,
    4,
    NULL,
    1
);

-- Se insertan los cuatro empleados subordinados.

INSERT INTO public.empleados (
    primer_nombre,
    segundo_nombre,
    email,
    fecha_nacimiento,
    sueldo,
    comision,
    cargo_id,
    gerente_id,
    departamento_id
)
VALUES
    ('Neider', 'Andres', 'neider.andres@empresa.com',
     '2006-05-18', 6000000, NULL, 2, 1, 1),

    ('Martin', 'David', 'martin.david@empresa.com',
     '2002-08-21', 3000000, NULL, 1, 1, 1),

    ('Laura', 'Sofia', 'laura.sofia@empresa.com',
     '1998-11-03', 3500000, 200000, 3, 1, 4),

    ('Diana', 'Marcela', 'diana.marcela@empresa.com',
     '1995-02-14', 5000000, NULL, 5, 1, 3);


-- 7. DATOS DEL HISTORICO
INSERT INTO public.historico (
    emphist_fecha_retiro,
    emphist_cargo_id,
    emphist_dpto_id
)
VALUES
    ('2023-03-15', 1, 1),
    ('2023-06-20', 2, 1),
    ('2023-09-10', 3, 4),
    ('2024-01-31', 4, 1),
    ('2024-05-18', 5, 3);
