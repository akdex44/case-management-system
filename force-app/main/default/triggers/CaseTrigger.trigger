trigger CaseTrigger on SOBJECT (before insert) {
    list<User> availableAgents =[SELECT Id FROM User WHERE Profile.Name = 'Support Agent' ORDER BY LastLoginDate ASC LIMIT 1];

    for(case c ; trigger.new){
        if(availableAgents.size() > 0){
            c.OwnerId = availableAgents[0].Id;
        } else {
            // Handle the case where no available agents are found
            // You can set a default owner or take other actions as needed
            c.OwnerId = '005dM00$$$$$$4$'; // Replace with the actual User ID
        }
    }

}