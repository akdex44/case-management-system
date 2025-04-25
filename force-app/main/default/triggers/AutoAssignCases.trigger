trigger AutoAssignCases on SOBJECT (before insert) {
     for (Case c : Trigger.new) {
        c.OwnerId = '005xxxxxxx';
}
