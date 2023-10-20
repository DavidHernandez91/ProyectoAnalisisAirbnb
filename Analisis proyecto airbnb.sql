-- Preguntas principales para analisis Historia de Usuario 

-- Cual es la cantidad de Airbnb por barrio?

SELECT
Neighbourhood as Barrio
COUNT(id) as Cantidad_Airbnb_xBarrio
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Barrio
ORDER BY 
Cantidad_Airbnb_xBarrio DESC

-- Cuál es el número de Airbnb por tipo de habitación?

SELECT
room_type as Tipo_Cuarto,
COUNT(id) as Cantidad_Airbnb_xTipo
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Tipo_Cuarto
ORDER BY Cantidad_Airbnb_xTipo DESC

-- Caul es el promedio de minimum_nights en los anuncios?

SELECT
AVG(minimum_nights) AS Promedio_Noches_Minimas
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`

--  TOP3 de los barrios con mayor cantidad de visitas (reviews) ?

SELECT
Neighbourhood as Barrio
SUM(number_of_reviews) as Total_reviews_xBarrio,
RANK() OVER (ORDER BY SUM(number_of_reviews) DESC) Ranking
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY
Barrio
ORDER BY 
Total_reviews_xBarrio DESC
LIMIT 3

-- Cuál es el número de Airbnb por propietario?

SELECT
host_id,
COUNT(id) as Cantidad_Airbnb_xPropietario
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
host_id
ORDER BY Cantidad_Airbnb_xPropietario DESC

-- Cuál es el promedio de disponibilidad que tienen los airbnb por barrio, en que barrio es menor?

SELECT
Neighbourhood as Barrio,
ROUND(AVG(,availability_365),1) as Promedio_Disponibilidad_Barrio
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Barrio
ORDER BY Promedio_Disponibilidad_Barrio

-- Preguntas secundarias realizadas durante el analisis 

-- Cuál es el número tal de Airbnb en la ciudad seleccionada?

SELECT
COUNT(id) as Cantidad_Airbnb
FROM
 `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
 
-- Cuál es el número tal de Airbnb en la ciudad seleccionada?

SELECT
COUNT(id) as Cantidad_Airbnb
FROM
 `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
 
-- Cuáles son los barrios que reciben mayor número de reviews y por lo tanto losmás visitados?

SELECT
Neighbourhood as Barrio
SUM(number_of_reviews) as Total_reviews_xBarrio
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Barrio
ORDER BY 
Total_reviews_xBarrio DESC

-- Cuál es el precio promedio por tipo de barrio?

SELECT
Neighbourhood as Barrio,
ROUND(AVG(price),2) as Precio_Promedio_Barrio
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Barrio
ORDER BY
Precio_Promedio_Barrio DESC

-- Cuál es el precio promedio por tipo de tipo habitación?

SELECT
room_tyoe as Tipo_Habitacion,
ROUND(AVG(price),2) as Precio_Promedio_xTipoHabitacion
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY 
Tipo_Habitacion
ORDER BY
Precio_Promedio_xTipoHabitacion DESC

-- Cuál es el top 10 de Airbnb x review?

SELECT
Id, name, number_of_reviews,
RANK() OVER (ORDER BY number_of_reviews DESC) as Ranking as 
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
ORDER BY 
number_of_reviews DESC
LIMIT 10

-- Cuál es el Top 5 por número de airbnb por neighbourhood?

SELECT
neighbourhood
COUNT(id)
RANK() OVER (ORDER BY COUNT(id) DESC) Ranking as Airbnb_XBarrio
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY
neighbourhood
ORDER BY 
Airbnb_XBarrio
LIMIT 5

-- Cuál es el top 5 de propietarios con más reseñas?

SELECT
host_id as Codigo_Propietario
host_name as Nombre_Propietario,
SUM(number_of_reviews) as Total_reviews_xBarrio,
RANK() OVER (ORDER BY SUM(number_of_reviews) DESC) Ranking
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY
Codigo_Propietario,
Nombre_Propietario
ORDER BY 
 Total_reviews_xBarrio
 
-- Cuál es el top 5 de propietarios con más reseñas?

SELECT
host_id as Codigo_Propietario
host_name as Nombre_Propietario,
SUM(number_of_reviews) as Total_reviews_xBarrio,
RANK() OVER (ORDER BY SUM(number_of_reviews) DESC) Ranking
FROM `david-hernandez-datapath.proyecto_datapath.airbnb_rio`
GROUP BY
Codigo_Propietario,
Nombre_Propietario
ORDER BY 
 Total_reviews_xBarrio