@isTest
public class CheckNameTest {
    @isTest static void CheckTest(){
        
        
        Opportunity opp = new Opportunity(Name='Ram',StageName ='Closed Won',CloseDate= System.today(),Amount= 1200);
        insert opp; 
        Test.StartTest(); 
        opp.Amount = 1600;
        update opp;
        Contact con = [Select id From Contact where Opportunity__c=: opp.Id];
        System.assertNotEquals(null, con);
        Test.StopTest();
    }   
    }