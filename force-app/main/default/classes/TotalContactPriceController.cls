public with sharing class TotalContactPriceController {
     public static void totalPrice(List<Contact> triggerConList)
        {
            Set<Id> accIds=new Set<Id>();
                for(Contact con:triggerConList){
                accIds.add(con.AccountId);
            
            }
            List<Contact> conList =[Select Id,AccountId,Contact_Price__c From Contact Where AccountId In:accIds];
            Map<Id,Decimal>accPriceMap= new Map<Id,Decimal>();
            for(Contact con:conList){
                if(accPriceMap.containsKey(con.AccountId)){
                     Decimal price ;
                      if(con.Contact_Price__c != null){
                        price=accPriceMap.get(con.AccountId)+con.Contact_Price__c;
                    }
                    accPriceMap.put(con.AccountId,Price);
            
                }
                else{
                     if(con.Contact_Price__c != null){
                      accPriceMap.put(con.AccountId,con.Contact_Price__c);
                }
              }
            }
            List<Account> accList=new List<Account>();
            for(Id accId: accPriceMap.keySet()){
            Account acc = new Account();
            acc.Total_Contact_Price__c=accPriceMap.get(accId);
            acc.Id=accId;
            accList.add(acc);
            }
            update accList;
        }
     }