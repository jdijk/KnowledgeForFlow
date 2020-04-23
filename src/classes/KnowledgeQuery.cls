global class KnowledgeQuery {

     	@InvocableMethod(label='Query Knowledge for Group and Category' )
  	global static List<KnowledgeQueryResult> GetKnowledgeIds(List<KnowledgeQueryRequest> Requests) {
    	List<KnowledgeQueryResult> Results = new List<KnowledgeQueryResult>();
        
        for (KnowledgeQueryRequest Request : Requests)
        {
            KnowledgeQueryResult Result = new KnowledgeQueryResult();
            
            String sSQL = 'select id from KnowledgeArticleVersion where PublishStatus=\'online\' ';
            if (Request.SearchFieldName1 != '')
            {
                sSQL += ' AND ';
                sSQL += Request.SearchFieldName1;
                sSQL += '=\'';
                sSQL += Request.SearchFieldValue1;
                sSQL += '\'';
            }
            if (Request.SearchFieldName2 != '')
            {
                sSQL += ' AND ';
                sSQL += Request.SearchFieldName2;
                sSQL += '=\'';
                sSQL += Request.SearchFieldValue2;
                sSQL += '\'';
            }
            if (Request.SearchFieldName2 != '')
            {
                sSQL += ' AND ';
                sSQL += Request.SearchFieldName2;
                sSQL += '=\'';
                sSQL += Request.SearchFieldValue2;
                sSQL += '\'';
            }
            sSQL += ' with data category ';
            sSQL += Request.GroupName;
            sSQL += '__c Above ';
            sSQL += Request.CategoryName;
            sSQL += '__c';
            
            List<SOBject> QueryResult = Database.query(sSQL);
            
            for (SObject SingleObject : QueryResult)
            {
                Result.KnowledgeIds.add((String)SingleObject.get('Id'));
            }
            Results.add(Result);
        }
        return Results;
    
    }
    
    
      global class KnowledgeQueryRequest {
          
         KnowledgeQueryRequest()
        {
          	SearchFieldName1 = '';
            SearchFieldName2 = '';
            SearchFieldName3 = '';
            
        }
          
        @InvocableVariable
        global String GroupName;
        
        @InvocableVariable
        global String CategoryName;
          
        @InvocableVariable
        global String SearchFieldName1;
          
        @InvocableVariable
        global String SearchFieldValue1;
          
        @InvocableVariable
        global String SearchFieldName2;
          
        @InvocableVariable
        global String SearchFieldValue2;
        
        @InvocableVariable
        global String SearchFieldName3;
          
        @InvocableVariable
        global String SearchFieldValue3;
        
    }
    
    
    global class KnowledgeQueryResult {
        
        global KnowledgeQueryResult()
        {
            KnowledgeIds = new List<String>();
        }
        
        @InvocableVariable
        global List<String> KnowledgeIds;
        
        @InvocableVariable
        global String ErrorText;
        
    }
}
