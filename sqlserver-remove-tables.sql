/*
Removendo todas as tabelas criadas para o treinamento iniciadas com "tbl_"
*/

DECLARE @table_name NVARCHAR(100)
DECLARE @sql_stmt NVARCHAR(MAX)

-- Desabilitar a verificação de chaves estrangeiras temporariamente
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

DECLARE table_cursor CURSOR FOR
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_name LIKE 'tbl_%' AND table_type = 'BASE TABLE'

OPEN table_cursor

FETCH NEXT FROM table_cursor INTO @table_name

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @sql_stmt = 'DROP TABLE ' + QUOTENAME(@table_name)
    BEGIN TRY
        EXEC sp_executesql @sql_stmt
        PRINT 'Tabela ' + @table_name + ' excluída com sucesso.'
    END TRY
    BEGIN CATCH
        PRINT 'Erro ao excluir a tabela ' + @table_name + ': ' + ERROR_MESSAGE()
    END CATCH

    FETCH NEXT FROM table_cursor INTO @table_name
END

CLOSE table_cursor
DEALLOCATE table_cursor

-- Habilitar a verificação de chaves estrangeiras novamente
EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all'
