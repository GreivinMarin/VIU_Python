SELECT
    A.ST_CASE,
    A.STATE,
	A.STATENAME,
    A.YEAR,
    A.MONTH,
    A.DAY,
    A.HOUR,
    A.WEATHER,
    A.WEATHERNAME,

    V.VEH_NO,
    V.BODY_TYP,
    V.MAN_COLLNAME,

    P.PER_NO,
    P.SEX,
    P.AGE,   
    P.HELM_USE,
	P.HELM_USENAME,
	 CASE
		WHEN P.HELM_USE IN (1,2,3) THEN 'Con casco'
		WHEN P.HELM_USE = 5 THEN 'Casco mal usado'
		WHEN P.HELM_USE IN (4,17) THEN 'Sin casco'
		WHEN P.HELM_USE = 19 THEN 'Casco tipo desconocido'
		WHEN P.HELM_USE IN (98,99) THEN 'No reportado / Desconocido'
		ELSE 'Otro'
	  END AS USO_CASCO_DETALLE,
	 P.INJ_SEV,
	 P.INJ_SEVNAME,
    CASE 
        WHEN P.INJ_SEV = 4 THEN 'Fatal'
        WHEN P.INJ_SEV = 3 THEN 'Lesión grave'
        WHEN P.INJ_SEV = 2 THEN 'Lesión leve'
        WHEN P.INJ_SEV = 0 THEN 'Sin lesión'
        ELSE 'Desconocido'
    END AS GRAVEDAD_LESION,
	  P.DRUGS,
	  P.DRUGSNAME,
	  CASE
		WHEN P.DRUGS = 0 THEN 'Sin drogas'
		WHEN P.DRUGS BETWEEN 1 AND 5 THEN 'Drogas detectadas'
		WHEN P.DRUGS = 6 THEN 'Sospecha de drogas, sin prueba'
		WHEN P.DRUGS = 8 THEN 'No se hizo prueba'
		WHEN P.DRUGS = 9 THEN 'Desconocido'
		ELSE 'Otro'
	  END AS USO_DROGAS_DETALLE
FROM Accident A
JOIN Vehicle V ON A.ST_CASE = V.ST_CASE
JOIN Person P ON A.ST_CASE = P.ST_CASE AND V.VEH_NO = P.VEH_NO
WHERE V.BODY_TYP BETWEEN 80 AND 89  -- motocicletas