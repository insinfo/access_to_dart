dbMemo "SQL" ="SELECT DISTINCT TbBeneficioEmergencial.CodFam\015\012FROM TbBeneficioEmergencial"
    "\015\012GROUP BY TbBeneficioEmergencial.CodFam, TbBeneficioEmergencial.DataBenef"
    "\015\012HAVING (((TbBeneficioEmergencial.DataBenef) Between [DATA INICIAL] And ["
    "DATA FINAL]))\015\012ORDER BY TbBeneficioEmergencial.CodFam;\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="-1"
Begin
    Begin
        dbText "Name" ="TbBeneficioEmergencial.CodFam"
        dbLong "AggregateType" ="2"
    End
End
