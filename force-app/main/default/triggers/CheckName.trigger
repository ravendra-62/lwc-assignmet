trigger CheckName on Opportunity (after update) {
    
	List<Contact> contacts = new List<Contact>();
		
     for(Opportunity opp :trigger.new){
         
       Opportunity oldOpp = trigger.OldMap.get(opp.Id);
         
        if(opp.Amount != oldOpp.Amount){
        
            Contact con = new Contact( FirstName = 'Unique ', LastName = 'lastName' );
           con.Opportunity__c = opp.Id;
            contacts.add( con );
            
        }
         
      }
    
    if(contacts.size()>0){
        insert contacts;
    }
    
       
}