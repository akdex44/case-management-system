global class AutoCloseCases implements Schedulable{
    global void execute(SchedulableContext sc){
        List<Case> oldCases = [SELECT Id, Status FROM Case WHERE Status != 'Closed' AND CreatedDate <= LAST_N_DAYS:7];
        
        for(case c: oldCases){
            c.Status = 'Closed';
        }
        update oldCases;

    }

}
