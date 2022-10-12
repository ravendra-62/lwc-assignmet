public with sharing class wireDemoClassBySalesforceNoob {
    @AuraEnabled(cacheable=true)
    public static List<player__c> getPlayerList(){
        List<player__c> playerDetail=
        [
            Select Id ,Name from player__c 
        ];
        return playerDetail;
    }
   
}
