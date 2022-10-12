public with sharing class ExploreCustomContactController {
   
    @AuraEnabled(cacheable=true)
    public static List<wrapper> getObjectsName(){
        
        List<wrapper> objects = new List<wrapper>();
       List<Schema.SObjectType> objLis = Schema.getGlobalDescribe().values();
         
        for(SObjectType s: objLis){
            wrapper wp = new wrapper();
            wp.value=s.getDescribe().getName();
            wp.label=s.getDescribe().getLabel();
            objects.add(wp);
        }
    
        return objects;
       }
    
    public class wrapper{
        @AuraEnabled
        public string value;
        @AuraEnabled
        public String label;
    }
   @AuraEnabled
    public static List<FieldWrapper> getAllFields(string objectName){
        list<FieldWrapper> allFields = new List<FieldWrapper>();
        map<string,Schema.SObjectType> objMap = Schema.getGlobalDescribe();
        SObjectType objType = objMap.get(objectName);
        
        map<string,Schema.SObjectField> objField = objType.getDescribe().fields.getMap();
        for(String name: objField.keySet()){
            FieldWrapper fw = new FieldWrapper();
           fw.label = objField.get(name).getDescribe().getlabel();
            fw.value = objField.get(name).getDescribe().getName();
            allFields.add(fw);
        }
        return allFields;
        
    }
    public class FieldWrapper{
        @AuraEnabled public string label;
        @AuraEnabled public string value;
    }
    @AuraEnabled
    public static List<sObject> getDb(String query){
        return Database.query(query);
    }
    
}
