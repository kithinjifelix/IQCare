/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveLockpatientForDispensing]    Script Date: 8/15/2018 12:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[pr_SCM_SaveLockpatientForDispensing]
@ptn_pk int,
@ptn_pharmacy_pk int,
@UserName varchar(200),
@StartDate varchar(30),
@LockPatient bit

as

if(@LockPatient = 1)
begin
	if(exists(select * from dtl_PatientLockedRecordsForDispensing where @ptn_pk = ptn_pk and ptn_pharmacy_pk=@ptn_pharmacy_pk))
	begin
		delete from dtl_PatientLockedRecordsForDispensing where @ptn_pk = ptn_pk and ptn_pharmacy_pk=@ptn_pharmacy_pk
	end

	insert into dtl_PatientLockedRecordsForDispensing(ptn_pk, ptn_pharmacy_pk, UserName, StartDate)
	values(@ptn_pk, @ptn_pharmacy_pk, @UserName, @StartDate)
end
else
begin
	delete from dtl_PatientLockedRecordsForDispensing where @ptn_pk = ptn_pk and ptn_pharmacy_pk=@ptn_pharmacy_pk
end

