global class CustomSOQLQuery {
    @InvocableMethod (label = 'Custom SOQL Query')
    global static List<Decimal> customQueries(List<QueryRequest> requests) {
        List<Decimal> results = new List<Decimal>();
        //loop through list of requests
        for (QueryRequest request : requests) {
            system.debug('request>>>'+request.querystring);
            results.add(customQuery(request));
        }
        return results;
    }
     
    //actual work happens inside this method
    public static Decimal customQuery(QueryRequest request) {
        System.assert(request.queryString != '');
         
        List<AggregateResult> result = Database.query('SELECT SUM(ExpectedAmount__c) totalAmount FROM Account WHERE Id = \'0015g00000w6sqcAAA\'');
            //(request.queryString);
         
        Decimal sumAmount = 0;
        for (AggregateResult ar : result) {
            sumAmount = (Decimal)ar.get('totalAmount');
        }
         
        return sumAmount;
    }
     
    //custom class for input
    global class QueryRequest {
        @InvocableVariable(required=true)
        public String queryString;
    }
}