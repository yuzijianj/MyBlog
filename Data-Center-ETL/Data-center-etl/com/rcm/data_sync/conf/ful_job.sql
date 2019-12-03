--odps sql
--********************************************************************--
--author:{0}
--create time:{1}
--********************************************************************--

INSERT OVERWRITE TABLE dc_ods.{2} partition(ts='${3}')
  SELECT  {5}
  FROM    (
    SELECT  t.*
    ,ROW_NUMBER() OVER(PARTITION BY id ORDER BY update_time DESC) AS num
    FROM    (
      SELECT  {4}
      ,0 AS del_flag
      FROM    dc_ods.{2}
      where ts ='${5}'
      UNION ALL
      SELECT  {6}
      ,del_flag
      FROM    dc_ods.{7} AS t
      WHERE   t.ts = '${3}'
    ) AS t
  ) AS t
  WHERE   t.num = 1
  AND     t.del_flag = 0;
