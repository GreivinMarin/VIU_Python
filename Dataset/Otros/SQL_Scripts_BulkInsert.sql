BULK INSERT dbo.Accident
FROM 'C:\temp\accident.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001' -- UTF-8
);



BULK INSERT dbo.Person
FROM 'C:\temp\person.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001',
    ERRORFILE = 'C:\temp\bulk_errors_person.txt',
    MAXERRORS = 100
);


BULK INSERT dbo.Vehicle
FROM 'C:\temp\vehicle.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,                    -- salta encabezados
    FIELDTERMINATOR = ',',          -- separador CSV
    ROWTERMINATOR = '0x0a',         -- salto de línea tipo UNIX
    CODEPAGE = '65001',             -- UTF-8
    --ERRORFILE = 'C:\temp\bulk_errors_vehicle.txt',
    MAXERRORS = 100
);
