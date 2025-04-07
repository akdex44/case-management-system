public with sharing class CaseController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getOpenCases() {
        return [SELECT Id, CaseNumber, Status, Subject FROM Case WHERE Status != 'Closed'];
    }

    @AuraEnabled
    public static void updateCaseStatus(Id caseId, String status) {
        Case c = [SELECT Id, Status FROM Case WHERE Id = :caseId LIMIT 1];
        c.Status = status;
        update c;
    }
}
