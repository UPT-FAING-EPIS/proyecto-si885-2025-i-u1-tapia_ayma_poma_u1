-- Insertando más universidades para cubrir más ciudades
SET IDENTITY_INSERT [dbo].[universidad] ON;
GO

MERGE INTO [dbo].[universidad] AS target
USING (VALUES
    (11, 'Universidad Nacional de Ingeniería', 'Lima', 'PUBLICA'),
    (12, 'Universidad Nacional de San Antonio Abad del Cusco', 'Cusco', 'PUBLICA'),
    (13, 'Universidad Nacional de Piura', 'Piura', 'PUBLICA'),
    (14, 'Universidad Nacional de la Amazonía Peruana', 'Iquitos', 'PUBLICA'),
    (15, 'Universidad Nacional de Cajamarca', 'Cajamarca', 'PUBLICA'),
    (16, 'Universidad Católica de Santa María', 'Arequipa', 'PRIVADA'),
    (17, 'Universidad Nacional del Altiplano', 'Puno', 'PUBLICA'),
    (18, 'Universidad Nacional de Huancavelica', 'Huancavelica', 'PUBLICA'),
    (19, 'Universidad Nacional de Tumbes', 'Tumbes', 'PUBLICA'),
    (20, 'Universidad Nacional Daniel Alcides Carrión', 'Cerro de Pasco', 'PUBLICA')
) AS source ([id_universidad], [nombre], [ubicacion], [tipo])
ON target.[id_universidad] = source.[id_universidad]
WHEN NOT MATCHED THEN
    INSERT ([id_universidad], [nombre], [ubicacion], [tipo]) VALUES (source.[id_universidad], source.[nombre], source.[ubicacion], source.[tipo]);
GO

SET IDENTITY_INSERT [dbo].[universidad] OFF;
GO

-- Insertando más tesis para diferentes ciudades y años
SET IDENTITY_INSERT [dbo].[tesis] ON;
GO

MERGE INTO [dbo].[tesis] AS target
USING (VALUES
    (11, 2020, 'Machine Learning aplicado a agricultura', 14), -- Iquitos
    (12, 2021, 'Sistemas de recomendación para turismo', 12), -- Cusco
    (13, 2022, 'Análisis de datos climáticos', 17), -- Puno
    (14, 2023, 'Realidad aumentada para educación', 16), -- Arequipa
    (15, 2024, 'Blockchain para transacciones seguras', 11), -- Lima
    (16, 2020, 'IoT para monitoreo de cultivos', 13), -- Piura
    (17, 2021, 'Chatbots para atención al cliente', 15), -- Cajamarca
    (18, 2022, 'Visualización de datos geográficos', 18), -- Huancavelica
    (19, 2023, 'Aplicaciones móviles para salud', 19), -- Tumbes
    (20, 2024, 'Sistemas embebidos para minería', 20) -- Cerro de Pasco
) AS source ([id_tesis], [año_publicacion], [categoria], [id_universidad])
ON target.[id_tesis] = source.[id_tesis]
WHEN NOT MATCHED THEN
    INSERT ([id_tesis], [año_publicacion], [categoria], [id_universidad]) VALUES (source.[id_tesis], source.[año_publicacion], source.[categoria], source.[id_universidad]);
GO

SET IDENTITY_INSERT [dbo].[tesis] OFF;
GO

-- Insertando tecnologías para las nuevas tesis
INSERT INTO [dbo].[tesis_tecnologia] ([id_tesis], [id_tecnologia])
SELECT 11, 2 UNION ALL  -- Python para ML en agricultura (Iquitos)
SELECT 11, 14 UNION ALL -- TensorFlow
SELECT 11, 40 UNION ALL -- PyTorch
SELECT 11, 45 UNION ALL -- Hadoop
SELECT 12, 4 UNION ALL  -- JavaScript para sistema de turismo (Cusco)
SELECT 12, 12 UNION ALL -- React
SELECT 12, 30 UNION ALL -- MongoDB
SELECT 12, 34 UNION ALL -- Google Cloud
SELECT 13, 2 UNION ALL  -- Python para análisis climático (Puno)
SELECT 13, 16 UNION ALL -- Pandas
SELECT 13, 17 UNION ALL -- Matplotlib
SELECT 13, 33 UNION ALL -- AWS
SELECT 14, 4 UNION ALL  -- JavaScript para realidad aumentada (Arequipa)
SELECT 14, 26 UNION ALL -- Unity
SELECT 14, 27 UNION ALL -- Unreal Engine
SELECT 14, 34 UNION ALL -- Google Cloud
SELECT 15, 1 UNION ALL  -- Java para blockchain (Lima)
SELECT 15, 9 UNION ALL  -- C++
SELECT 15, 28 UNION ALL -- MySQL
SELECT 15, 36 UNION ALL -- Microsoft Azure
SELECT 16, 2 UNION ALL  -- Python para IoT (Piura)
SELECT 16, 24 UNION ALL -- Arduino
SELECT 16, 25 UNION ALL -- Raspberry Pi
SELECT 16, 32 UNION ALL -- SQLite
SELECT 17, 4 UNION ALL  -- JavaScript para chatbots (Cajamarca)
SELECT 17, 12 UNION ALL -- React
SELECT 17, 23 UNION ALL -- Flask
SELECT 17, 40 UNION ALL -- PyTorch
SELECT 18, 2 UNION ALL  -- Python para visualización geográfica (Huancavelica)
SELECT 18, 16 UNION ALL -- Pandas
SELECT 18, 17 UNION ALL -- Matplotlib
SELECT 18, 45 UNION ALL -- Hadoop
SELECT 19, 4 UNION ALL  -- JavaScript para apps de salud (Tumbes)
SELECT 19, 21 UNION ALL -- React Native
SELECT 19, 31 UNION ALL -- Firebase
SELECT 19, 34 UNION ALL -- Google Cloud
SELECT 20, 8 UNION ALL  -- C para sistemas embebidos (Cerro de Pasco)
SELECT 20, 9 UNION ALL  -- C++
SELECT 20, 24 UNION ALL -- Arduino
SELECT 20, 25;         -- Raspberry Pi
GO