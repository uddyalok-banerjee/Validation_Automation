/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [response_id] as SURVEY_ID_NUM
      ,Convert(date, [Survey_Date]) as SURVEY_DATE
	  ,'RUSH' as FACILITY_NAME
	  ,'IOP' as SERVICE_LINE
      ,convert(int, [satage]) as AGE
      ,case when [satgender] = 1 Then 'F'
	  when [satgender] = 2 then 'M'
	  when [satgender] = 3 then 'MTF' 
	  when [satgender] = 4 then 'FTM'
	  when [satgender] = 5 then 'NR' End as GENDER
      ,Case When [sateducation] = 0 then 'NS'
	  when [sateducation] = 1 then 'SMS'
	  when [sateducation] = 2 then 'SND'
	  when [sateducation] = 3 then 'HSG'
	  when [sateducation] = 4 then 'SCN'
	  when [sateducation] = 5 then 'TTV'
	  when [sateducation] = 6 then 'ASC'
	  when [sateducation] = 7 then 'BA'
	  when [sateducation] = 8 then 'MS'
	  when [sateducation] = 9 then 'PR'
	  when [sateducation] = 10 then 'DR' END as EDUCATION
      ,case when [satemployment] = 1 then 'E'
	  when [satemployment] = 0 then 'U' end as EMPLOYMENT
      , case when [satrace] = 1 Then 'WH' 
	  when [satrace] = 2 Then 'BL' 
	  When [satrace] = 3 Then 'AS' 
	  when [satrace] = 4 then 'PI' 
	  when [satrace] = 5 then 'AM' 
	  when [satrace] = 6 then 'MU' 
	  when [satrace] = 7 then 'U' end as RACE
      ,case when [sathispanic] = 0 then 'N'
	  when [sathispanic] = 1 then 'Y' end AS HISPANIC_FLAG
      ,case when [satbranch] = 1 then 'AF'
	  when [satbranch] = 2 then 'AR' 
	  when [satbranch]  = 3 then 'CG' 
	  when [satbranch] = 4 then 'MA' 
	  when [satbranch] = 5 then 'NAV' 
	  when [satbranch] = 6 then 'NA' end as BRANCH
      ,case when [satservicecom] = 1 then 'NG'
	  when [satservicecom] = 2 then 'REG' 
	  when [satservicecom] = 3  then 'RES' 
	  when [satservicecom] = 4 then 'NA' end as SERVICE_COMPONENT
      ,case when [satrank] = 1 Then 'E' 
	  when [satrank] = 2 then 'NCO' 
	  when [satrank] = 3 then 'O' 
	  when [satrank] = 4 then 'WO' 
	  when [satrank] = 5 then 'NA' end as RANK
      ,case when [satmilitaryst] = 1 then 'ACTV'
	  when [satmilitaryst] = 2 then 'RES' 
	  when [satmilitaryst] = 3 then 'NG'
	  when [satmilitaryst] = 4 then 'DISC'
	  when [satmilitaryst] = 5 then 'IACT'
	  when [satmilitaryst] = 6 then 'MRET'
	  when [satmilitaryst] = 7 then 'RET'
	  when [satmilitaryst] = 8 then 'NA' end as MILITARY_STATUS
	  ,Concat_WS(',',
	   Case when [sathearofprog___1] <> 0 THEN 'YRE' ELSE NULL END,
	   Case when [sathearofprog___2] <> 0 THEN 'VA' ELSE NULL END,
       case when [sathearofprog___3] <> 0 THEN 'VOC' ELSE NULL END,
	   case when [sathearofprog___4] <> 0 THEN 'P' ELSE NULL END,
	   case when [sathearofprog___5] <> 0 THEN 'F' ELSE NULL END,
	   case when [sathearofprog___6] <> 0 THEN 'FM' ELSE NULL END,
	   case when [sathearofprog___7] <> 0 THEN 'FUND' ELSE NULL END,
	   case when [sathearofprog___8] <> 0 THEN 'LVSO' ELSE NULL END,
	   case when [sathearofprog___9] <> 0 THEN 'U' ELSE NULL END,
	   case when [sathearofprog___10] <> 0 THEN 'VAH' ELSE NULL END,
	   case when [sathearofprog___11] <> 0 THEN 'WWP' ELSE NULL END,
	   case when [sathearofprog___12] <> 0 THEN 'OL' ELSE NULL END,
	   case when [sathearofprog___13] <> 0 THEN 'X' ELSE NULL END ) as HEAR_OF_PROGRAM
      ,'NA' as TWO_WEEKS_APPT
      ,'NA' as MISSED_APPT_FLAG
      ,'NA' as MISSED_APPT_FREQ
	  , convert (int, 8) as MISSED_APPT_REASON
	  ,(case when [satcare1] = 1 Then 'SD' 
	    when [satcare1] = 2 then 'D' 
		when [satcare1] = 3 then 'N' 
		when [satcare1] = 4 Then 'A' 
		when [satcare1] = 5 Then 'SA' 
		when [satcare1] = 6 then 'NA' End) as VET_SUPPORT
	   ,(case when [satcare2] = 1 Then 'SD' 
	    when [satcare2] = 2 then 'D' 
		when [satcare2] = 3 then 'N' 
		when [satcare2] = 4 Then 'A' 
		when [satcare2] = 5 Then 'SA' 
		when [satcare2] = 6 then 'NA' End) as TRUST_CLINICIAN
		, (case when [satcare3] = 1 Then 'SD' 
	    when [satcare3] = 2 then 'D' 
		when [satcare3] = 3 then 'N' 
		when [satcare3] = 4 Then 'A' 
		when [satcare3] = 5 Then 'SA' 
		when [satcare3] = 6 then 'NA' End) as IMPROVED_FUNCTION
		, (case when [satcare4] = 1 Then 'SD' 
	    when [satcare4] = 2 then 'D' 
		when [satcare4] = 3 then 'N' 
		when [satcare4] = 4 Then 'A' 
		when [satcare4] = 5 Then 'SA' 
		when [satcare4] = 6 then 'NA' End) as MADE_A_DIFFERENCE
		, (case when [satcare5] = 1 Then 'SD' 
	    when [satcare5] = 2 then 'D' 
		when [satcare5] = 3 then 'N' 
		when [satcare5] = 4 Then 'A' 
		when [satcare5] = 5 Then 'SA' 
		when [satcare5] = 6 then 'NA' End) as IMPROVED_PROBLEMS
		, (case when [satcare6] = 1 Then 'SD' 
	    when [satcare6] = 2 then 'D' 
		when [satcare6] = 3 then 'N' 
		when [satcare6] = 4 Then 'A' 
		when [satcare6] = 5 Then 'SA' 
		when [satcare6] = 6 then 'NA' End) as GAINED_SKILLS
		, (case when [satcare7] = 1 Then 'SD' 
	    when [satcare7] = 2 then 'D' 
		when [satcare7] = 3 then 'N' 
		when [satcare7] = 4 Then 'A' 
		when [satcare7] = 5 Then 'SA' 
		when [satcare7] = 6 then 'NA' End) as OVERALL_SATISFACTION
		,(case when [satfamconcern] = 0 Then 'N'
		when [satfamconcern] = 1 Then 'Y' END) as UNMET_CONCERNS_FLAG
		, (case when [satcare9] = 1 Then 'SD' 
	    when [satcare9] = 2 then 'D' 
		when [satcare9] = 3 then 'N' 
		when [satcare9] = 4 Then 'A' 
		when [satcare9] = 5 Then 'SA' 
		when [satcare9] = 6 then 'NA' End) as COMFORTABLE_TELLING_FAM
		, (case when [satcare10] = 1 Then 'SD' 
	    when [satcare10] = 2 then 'D' 
		when [satcare10] = 3 then 'N' 
		when [satcare10] = 4 Then 'A' 
		when [satcare10] = 5 Then 'SA' 
		when [satcare10] = 6 then 'NA' End) as WORRY_ABOUT_WEAKNESS
		, (case when [satcare8] = 1 Then 'SD' 
	    when [satcare8] = 2 then 'D' 
		when [satcare8] = 3 then 'N' 
		when [satcare8] = 4 Then 'A' 
		when [satcare8] = 5 Then 'SA' 
		when [satcare8] = 6 then 'NA' End) as OVERCOME_BARRIERS
		, (case when [satcare11] = 1 Then 'SD' 
	    when [satcare11] = 2 then 'D' 
		when [satcare11] = 3 then 'N' 
		when [satcare11] = 4 Then 'A' 
		when [satcare11] = 5 Then 'SA' 
		when [satcare11] = 6 then 'NA' End) as RECOMMEND_PROGRAM
	  ,Concat_WS(',',
	   Case when [satbarriers___1] <> 0 THEN 'NONE' ELSE NULL END,
	   Case when [satbarriers___2] <> 0 THEN 'HI' ELSE NULL END,
       case when [satbarriers___3] <> 0 THEN 'P' ELSE NULL END,
	   case when [satbarriers___4] <> 0 THEN 'D' ELSE NULL END,
	   case when [satbarriers___5] <> 0 THEN 'T' ELSE NULL END,
	   case when [satbarriers___6] <> 0 THEN 'NRT' ELSE NULL END,
	   case when [satbarriers___7] <> 0 THEN 'C' ELSE NULL END,
	   case when [satbarriers___8] <> 0 THEN 'FD' ELSE NULL END,
	   case when [satbarriers___9] <> 0 THEN 'X' ELSE NULL END) as BARRIERS_TO_CARE
  FROM [Stage].[RoadHome].[RHP_RED_CAP_Satisfaction_2_week_iop_vet_sat_arm_1]
  --Where [response_id] = 'SAT230203422'