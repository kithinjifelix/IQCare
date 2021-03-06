/****** Object:  StoredProcedure [dbo].[Pr_FormBuilder_SavedtlHomePageIndicatorQuery_Futures]    Script Date: 11/29/2015 09:00:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Pr_FormBuilder_SavedtlHomePageIndicatorQuery_Futures]                  
@Id int,                  
@HomePageId int,                  
@IndicatorName varchar(100),           
@Query varchar(max),                
@Seq int,           
@DeleteFlag int,                
@UserId int                 
                 
as                  
Begin                
  Declare @PageId as int                       
  if exists(select * from dtl_HomePage where Id=@Id)                    
  begin                  
      update dtl_HomePage set HomePageId=@HomePageId,IndicatorName=@IndicatorName,Query = @Query,                 
      Seq=@Seq,DeleteFlag = @DeleteFlag,UserId=@UserId,UpdateDate=getdate()                  
      where id=@Id          
      set @PageId = @Id        
            
  end                  
  else if(@Id = 0)                  
  begin                  
      insert into dtl_HomePage(HomePageId,IndicatorName,Query ,Seq,DeleteFlag,UserId,CreateDate)                  
      values(@HomePageId,@IndicatorName,@Query ,@Seq,@DeleteFlag,@UserId,getdate())                  
      set @PageId= scope_identity()            
  end                  
End
