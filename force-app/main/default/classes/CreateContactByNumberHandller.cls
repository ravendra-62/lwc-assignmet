public class CreateContactByNumberHandller {
    public static void totalContact(List<Account> listOfAcc){
 	 
    List<Contact> contList = new  List<Contact>();
    
    for( Account acc : listOfAcc){
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
    public static void UpdateCreateContact(List<Account> accListNew,Map<Id,Account> accOldMap){
        
           List<Contact> conListNew = new List<contact>();
     	   Map<Id,decimal> accNewMap =new Map<Id,Decimal>();
           List<Contact> conDelList = new  List<Contact>();

        	 for(Account acc : accListNew){
                 
                 
             if(acc.No_of_Contact__c > accOldMap.get(acc.Id).No_of_Contact__c){
                
           		for( Decimal i = accOldMap.get(acc.Id).No_of_Contact__c+1; i <= acc.No_of_Contact__c ; i++){
                  
                     Contact con = new Contact();
                        
                        con.LastName = acc.Name + '_Contact '+ i;
                        
                        con.AccountId = acc.Id;
                        
                        conListNew.add(con);
                
                }
             }
                 else if(acc.No_of_Contact__c < accOldMap.get(acc.Id).No_of_Contact__c){
                 //System.debug(accOldMap.get(acc.Id).No_of_Contact__c - acc.No_of_Contact__c);
                 accNewMap.put(acc.Id, accOldMap.get(acc.Id).No_of_Contact__c - acc.No_of_Contact__c);
             }
          }
        
       		 List<Account> accList = [Select Id,(Select id From Contacts) From Account Where Id In : accNewMap.keyset()];
        
                for(Account acc: accList){
                    
                    integer x= (Integer)accNewMap.get(acc.Id);
                    for(Integer i=0; i<x;i++){
                        conDelList.add(acc.contacts[i]);
                    }
            }
            if(!conListNew.isEmpty()){
                insert conListNew;
            }
             if(!conDelList.isEmpty()){
                delete conDelList;
            }        
    }

    public static void NotDeleteContact(Map<Id,Account> accOldMap){
        List<Contact> conList = [Select id,AccountId From Contact Where AccountId IN: accOldMap.keyset()];
        for(Contact cont : conList){
            Account acc = accOldMap.get(cont.AccountId);
            if(acc != Null){
                acc.addError(' Account cannot be deleted. ');
            }
        }
    }
    
}