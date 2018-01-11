--Prepend a nvarchar(255) colum conditionally
update EngineeringItems --Be careful on live database!!!
set Mark = '91' + Mark
where not Mark = ''
