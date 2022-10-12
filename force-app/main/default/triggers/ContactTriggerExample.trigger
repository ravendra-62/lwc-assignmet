trigger ContactTriggerExample on Contact (before insert) {
 List<Account> accListToInsert = new List<Account>();
    for(Contact con:Trigger.New){
        if(con.Account == null){
            Account acc = new Account();
            acc.Name = con.LastName;
            acc.Phone = con.Phone;
            accListToInsert.add(acc);
            
        }
    }
    if(accListToInsert.isEmpty()){
        insert accListToInsert;
    }
}