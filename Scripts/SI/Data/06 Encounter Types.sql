IF not Exists(select * from LookupMaster where Name = 'EncounterType')
	insert into LookupMaster (Name,DisplayName,DeleteFlag)values('EncounterType','EncounterType','0')
GO

IF not exists(select * from LookupItem where Name = 'Adherence-Barriers')
	BEGIN
		insert into LookupItem(Name,DisplayName,DeleteFlag)values('Adherence-Barriers','Adherence Barriers','0')
	END
GO

IF  exists(select * from LookupItem where Name = 'Adherence-Barriers')
	BEGIN
		if not Exists (select * from LookupMasterItem  lmi inner join LookupMaster lm on lm.Id=lmi.LookupMasterId inner join LookupItem lit on lit.Id=lmi.LookupItemId where 
		lit.Name='Adherence-Barriers' AND lm.Name = 'EncounterType')
		BEGIN
			insert into LookupMasterItem select lm.Id,lit.Id,lit.DisplayName,'1.00' as OrdRank from LookupMaster lm,LookupItem lit where lm.Name='EncounterType' and lit.Name='Adherence-Barriers'
		END
	END
GO

IF not exists(select * from LookupItem where Name = 'Screening')
	BEGIN
		insert into LookupItem(Name,DisplayName,DeleteFlag)values('Screening','Screening','0')
	END
GO

IF  exists(select * from LookupItem where Name = 'Screening')
	BEGIN
		if not Exists (select * from LookupMasterItem  lmi inner join LookupMaster lm on lm.Id=lmi.LookupMasterId inner join LookupItem lit on lit.Id=lmi.LookupItemId where 
		lit.Name='Screening' AND lm.Name = 'EncounterType')
		BEGIN
			insert into LookupMasterItem select lm.Id,lit.Id,lit.DisplayName,'3.00' as OrdRank from LookupMaster lm,LookupItem lit where lm.Name='EncounterType' and lit.Name='Screening'
		END
	END
GO

IF not exists(select * from LookupItem where Name = 'EnhanceAdherence')
	BEGIN
		insert into LookupItem(Name,DisplayName,DeleteFlag)values('EnhanceAdherence','Enhance Adherence Counselling','0')
	END
GO

IF  exists(select * from LookupItem where Name = 'EnhanceAdherence')
	BEGIN
		if not Exists (select * from LookupMasterItem  lmi inner join LookupMaster lm on lm.Id=lmi.LookupMasterId inner join LookupItem lit on lit.Id=lmi.LookupItemId where 
		lit.Name='EnhanceAdherence' AND lm.Name = 'EncounterType')
		BEGIN
			insert into LookupMasterItem select lm.Id,lit.Id,lit.DisplayName,'3.00' as OrdRank from LookupMaster lm,LookupItem lit where lm.Name='EncounterType' and lit.Name='EnhanceAdherence'
		END
	END
GO