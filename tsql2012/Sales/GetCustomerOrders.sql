CREATE PROCEDURE Sales.GetCustomerOrders
    @custid AS INT ,
    @orderdatefrom AS DATETIME = '19000101' ,
    @orderdateto AS DATETIME = '99991231' ,
    @numrows AS INT = 0 OUTPUT
AS
    BEGIN
        SET NOCOUNT ON;

        SELECT  o.orderid, o.custid, o.shipperid, o.orderdate, o.requireddate, o.shippeddate		
        FROM    Sales.Orders AS o
        WHERE  o.custid = COALESCE(@custid, 'unknown')
                AND o.orderdate >= @orderdatefrom
                AND o.orderdate < @orderdateto;
        SET @numrows = @@ROWCOUNT;
        RETURN;
    END;	