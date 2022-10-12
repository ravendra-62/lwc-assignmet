trigger updateStudent on Student__c (after update) {
    Schema.SObjectType targetType = Schema.getGlobalDescribe().get('Student__c');
    
	Map<String, Schema.SObjectField> fieldMap = targetType.getDescribe().fields.getMap();
    
    String stdField = '';
    
    List<Student_History__c> stdHisList = new List<Student_History__c>();
    
    for(Student__c std:trigger.new){
        
        Student__c oldstd = Trigger.OldMap.get(std.Id); 
        
       //Sudent_History__c stuhs = new Student_History__c();
        
   		 for (Schema.SObjectField field : fieldMap.values()) {
             if (field.getDescribe().isCustom()){ 
                 
        	   stdField = field.getDescribe().getName();
                 
             	String newValue = (String)std.get(stdField);
             	String oldValue = (String)oldstd.get(stdField);
             if(newValue != oldValue){
                 Student_History__c stdHis = new Student_History__c();
                 
                 stdHis.Old_Value__c = oldValue;
                 stdHis.Name = stdField;
                 stdHis.New_Value__c = newValue;
                 stdHis.Record_Id__c = std.Id;
                 stdHisList.add(stdHis);
                 
              }
             }
         }
    }
    
    if(stdHisList.size() > 0){
        insert stdHisList;
    }
    
}