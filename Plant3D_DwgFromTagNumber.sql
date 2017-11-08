select [Dwg Name] as DwgName
from PnPDrawings,
	(
		select DwgId
		from PnPDataLinks,
			(
				select RowId
				from PnPTagRegistry
				where Tag=@tagValue
			) as kompRowIdfromTag
		where PnPDataLinks.RowId=kompRowIdfromTag.RowId
	) as drawingIdfromTag
where PnPDrawings.PnPID=drawingIdfromTag.DwgId;
