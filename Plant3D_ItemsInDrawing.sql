select PnPClassName, _04_Snr, _05_Nr, _06_Komponent, ClassName
from EngineeringItems_PNP,
	(
		select PnPDataLinks.RowId
		from PnPDataLinks,
			(
				select PnPID
				from PnPDrawings
				where [Dwg Name]='BSPB_51.dwg'
			) AS drawingId
		where PnPDataLinks.DwgId=drawingId.PnPID
	) AS itemsInDrawing
where (PnPID=RowId) AND (PnPID NOT IN (select PnPID from Lines))
