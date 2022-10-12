trigger CreateContactController on Account (after insert,after update) {
    System.debug('Insertion Value: '+Trigger.IsInsert);
    if(Trigger.IsInsert){
        List<Contact>conList=new List<Contact>();
    for(Account acc:Trigger.New){
        Contact con=new Contact();
        con.LastName=acc.Name+'_Contact';
        con.AccountId=acc.Id;
        conList.add(con);
    }
    Insert conList;

    }
 }