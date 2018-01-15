--Prepend a nvarchar(255) colum conditionally
update EngineeringItems --Be careful on live database!!!
set Mark = '91' + Mark
where not Mark = ''

--Find all tables with column 'Tag' to be able to modify tag value directly
SELECT      c.name  AS 'ColumnName', t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
WHERE       c.name = 'Tag' AND NOT (t.name = 'PnPTagRegistry' OR t.name = 'PipeLines' OR t.name = 'PipeLineGroup')
ORDER BY    TableName, ColumnName;
