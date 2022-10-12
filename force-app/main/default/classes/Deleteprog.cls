public class Deleteprog {
    public static void UpdateCreateContact(List<Account> accListNew,Map<Id,Account> accOldMap){
       
       // Set<Id> accId = new Set<Id>();
         List<Contact> conListNew = new List<contact>();
     	   Map<Id,decimal> accNewMap =new Map<Id,Decimal>();
           Set<Id> accId = new Set<Id>();
         //  List<Contact> conDelList = new  List<Contact>();

        	 for(Account acc : accListNew){
                 accId.add(acc.Id);  
                 accNewMap.put(acc.Id,acc.No_of_Contact__c);
             if(acc.No_of_Contact__c > accOldMap.get(acc.Id).No_of_Contact__c){
                
           		for( Decimal i = accOldMap.get(acc.Id).No_of_Contact__c+1; i <= acc.No_of_Contact__c ; i++){
                  
                     Contact con = new Contact();
                        
                        con.LastName = acc.Name + '_Contact '+ i;
                        
                        con.AccountId = acc.Id;
                        
                        conListNew.add(con);
                
                }
             }
               List<Contact> conList = [Select Id,Name,AccountId From Contact where AccountId In : accId];
                 for(Contact con : conList){
                     if(accNewMap.get(con.AccountId) < accOldMap.get(con.AccountId).No_of_Contact__c){
                         Decimal getConCount;
                     }
                 }
                 if(!conListNew.isEmpty()){
                insert conListNew;
            }
    }
}
}