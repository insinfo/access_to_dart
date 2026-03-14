SELECT
  *
FROM
  TbAtend
WHERE
  (
    (
      (TbAtend.VDLFR)= Yes
    )
    AND (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDCDL)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDDCP)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDDPAF)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDAMF)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDFVI)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDAMD)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDASF)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDPBF)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDSCFV)= Yes
    )
  )
  OR (
    (
      (TbAtend.Data) Between [DATA INICIAL]
      And [DATA FINAL]
    )
    AND (
      (TbAtend.VDOUT)= Yes
    )
  );
