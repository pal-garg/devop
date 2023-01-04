@isTest
public class CustomSOQLQueryTest {
    @isTest
    private static void customQueryTest() {
        List<CustomSOQLQuery.QueryRequest> requests = new List<CustomSOQLQuery.QueryRequest>();
        CustomSOQLQuery.QueryRequest request = new CustomSOQLQuery.QueryRequest();
         
        String testQuery = 'SELECT SUM(Amount) FROM Opportunity WHERE Id=\'0068c00000rTePSAA0\'';
        request.queryString = testQuery;
        requests.add(request);
         
        CustomSOQLQuery.customQueries(requests);
        Decimal summedField = CustomSOQLQuery.customQuery(request);
    }
}