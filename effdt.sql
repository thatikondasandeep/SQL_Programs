select * FROM JOB JB
WHERE JB.EFFSEQ       = (SELECT max(JB1.EFFSEQ)
                           FROM JOB JB1
                          WHERE JB1.EFFDT        = JB.EFFDT
                            AND JB1.EMPL_RCD_NBR = <input empl_rcd_nbr>
                            AND JB1.EMPLID       = <input emplid>)
  AND JB.EFFDT        = (SELECT max(JB2.EFFDT)
                            FROM JOB JB2
                           WHERE JB2.EFFDT       <= sydate
                             AND JB2.EMPL_RCD_NBR = <input empl_rcd_nbr>
                             AND JB2.EMPLID       = <input emplid>)
  AND JB.EMPL_RCD_NBR = <input empl_rcd_nbr>
  AND JB.EMPLID       = <input emplid>