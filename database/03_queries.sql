


-- =============================================
-- PROYECTO: SISTEMA DE RECURSOS HUMANOS
-- MOTOR DE BASE DE DATOS: POSTGRESQL
-- SCRIPT: CONSULTAS DE VERIFICACION
-- =============================================


-- 1. CONSULTAR TODOS LOS PAISES
SELECT *
FROM public.paises;


-- 2. CONSULTAR CIUDADES Y SUS PAISES
SELECT
    c.ciudad_id,
    c.ciudad_nombre,
    p.pais_nombre
FROM public.ciudades AS c
INNER JOIN public.paises AS p
    ON c.pais_id = p.pais_id;


-- 3. CONSULTAR LOCALIZACIONES, CIUDADES Y PAISES
SELECT
    l.localiz_id,
    l.localiz_direccion,
    c.ciudad_nombre,
    p.pais_nombre
FROM public.localizaciones AS l
INNER JOIN public.ciudades AS c
    ON l.ciudad_id = c.ciudad_id
INNER JOIN public.paises AS p
    ON c.pais_id = p.pais_id;


-- 4. CONSULTAR EMPLEADOS CON SUS CARGOS Y DEPARTAMENTOS
SELECT
    e.empleado_id,
    e.primer_nombre,
    e.segundo_nombre,
    e.email,
    e.sueldo,
    c.cargo_nombre,
    d.departamento_nombre
FROM public.empleados AS e
INNER JOIN public.cargos AS c
    ON e.cargo_id = c.cargo_id
INNER JOIN public.departamentos AS d
    ON e.departamento_id = d.departamento_id;


-- 5. CONSULTAR EMPLEADOS Y SUS GERENTES
SELECT
    e.empleado_id,
    e.primer_nombre AS empleado,
    g.primer_nombre AS gerente
FROM public.empleados AS e
LEFT JOIN public.empleados AS g
    ON e.gerente_id = g.empleado_id;


-- 6. CONSULTAR HISTORICO CON CARGOS Y DEPARTAMENTOS
SELECT
    h.emphist_id,
    h.emphist_fecha_retiro,
    c.cargo_nombre,
    d.departamento_nombre
FROM public.historico AS h
INNER JOIN public.cargos AS c
    ON h.emphist_cargo_id = c.cargo_id
INNER JOIN public.departamentos AS d
    ON h.emphist_dpto_id = d.departamento_id;


-- 7. CONTAR LOS REGISTROS DE CADA TABLA
SELECT 'paises' AS tabla, COUNT(*) AS total_registros
FROM public.paises

UNION ALL

SELECT 'ciudades', COUNT(*)
FROM public.ciudades

UNION ALL

SELECT 'localizaciones', COUNT(*)
FROM public.localizaciones

UNION ALL

SELECT 'cargos', COUNT(*)
FROM public.cargos

UNION ALL

SELECT 'departamentos', COUNT(*)
FROM public.departamentos

UNION ALL

SELECT 'empleados', COUNT(*)
FROM public.empleados

UNION ALL

SELECT 'historico', COUNT(*)
FROM public.historico;


-- 8. CONSULTAR EMPLEADOS CON SUELDOS DENTRO DEL RANGO DEL CARGO
SELECT
    e.primer_nombre,
    e.sueldo,
    c.cargo_nombre,
    c.cargo_sueldo_minimo,
    c.cargo_sueldo_maximo
FROM public.empleados AS e
INNER JOIN public.cargos AS c
    ON e.cargo_id = c.cargo_id
WHERE e.sueldo BETWEEN c.cargo_sueldo_minimo
                   AND c.cargo_sueldo_maximo;


-- 9. CONSULTAR EL PROMEDIO SALARIAL POR DEPARTAMENTO
SELECT
    d.departamento_nombre,
    AVG(e.sueldo) AS promedio_salarial
FROM public.empleados AS e
INNER JOIN public.departamentos AS d
    ON e.departamento_id = d.departamento_id
GROUP BY d.departamento_nombre
ORDER BY promedio_salarial DESC;


-- 10. CONSULTAR EMPLEADOS QUE NO TIENEN GERENTE ASIGNADO
SELECT
    empleado_id,
    primer_nombre,
    email
FROM public.empleados
WHERE gerente_id IS NULL;
