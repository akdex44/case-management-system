@RestResource(urlMapping='/cases')
global with sharing class CaseRestService {
    
    @HttpGet
    global static List<Case> getCases() {
        return [SELECT Id, CaseNumber, Subject, Status FROM Case LIMIT 5];
    }

    @HttpPost
    global static String createCase(String subject, String status) {
        Case c = new Case(Subject = subject, Status = status);
        insert c;
        return 'Case Created with ID: ' + c.Id;
    }
}
