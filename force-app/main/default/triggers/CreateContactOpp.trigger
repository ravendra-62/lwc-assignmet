trigger CreateContactOpp on Account (after insert) {
List<Contact> contList = new  List<Contact>();
    
    for( Account  acc : Trigger.New){
        for( Integer i=1;i<=acc.No_of_Contact__c;i++){
        Contact con = new Contact();
        con.LastName = acc.Name + '_Contact '+ i;
        con.AccountId = acc.Id;
        contList.add(con);
            
    }
    }
    if(contList.size()>0){
        insert contList;
    }
    
}