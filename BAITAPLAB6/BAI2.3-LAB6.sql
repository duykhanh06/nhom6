﻿CREATE TRIGGER trg_SumForDelete
   ON DEAN
   AFTER DELETE
AS
   SELECT MA_NVIEN, COUNT(MaDA) AS 'Tổng số đề án đã tham gia' FROM PHANCONG
      GROUP BY MA_NVIEN