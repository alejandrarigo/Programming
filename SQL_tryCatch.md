
# Try Catch

BEGIN TRY
	se a primeira linha desse bloco der erro ahí vai para a primeira linha do bloco catch

END TRY

BEGIN CATCH
	-- só executa se der erro
END CATCH

CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
GO



Dynamic procedures:

CREATE PROC usp_query (
    @table NVARCHAR(128)
)
AS
BEGIN

    DECLARE @sql NVARCHAR(MAX);
    -- construct SQL
    SET @sql = N'SELECT * FROM ' + @table; -- aqui pode ir qq select
    -- execute the SQL
    EXEC sp_executesql @sql;
    
END;

EXEC usp_query 'production.products';


_______________ aqui otro

CREATE OR ALTER PROC usp_query_topn(
    @table NVARCHAR(128),
    @topN INT,
    @byColumn NVARCHAR(128)
)
AS
BEGIN
    DECLARE 
        @sql NVARCHAR(MAX),
        @topNStr NVARCHAR(MAX);

    SET @topNStr  = CAST(@topN as nvarchar(max));--pois precisa no set sql que sejam varchar

    -- construct SQL
    SET @sql = N'SELECT TOP ' +  @topNStr  + 
                ' * FROM ' + @table + 
                    ' ORDER BY ' + @byColumn + ' DESC';
    -- execute the SQL
    EXEC sp_executesql @sql;
    
END;


EXEC usp_query_topn 
        'production.products',
        100, 
        'model_year';

EXEC usp_query_topn 
        'production.stocks',
        10, 
        'quantity';



