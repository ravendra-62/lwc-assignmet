trigger CreateContactByNumber on Account (after insert,after update,before  delete) {
    if(Trigger.isInsert && Trigger.isAfter){
    CreateContactByNumberHandller.totalContact(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
    CreateContactByNumberHandller.UpdateCreateContact(Trigger.new,Trigger.oldMap);
    }
    if(Trigger.isDelete){
        CreateContactByNumberHandller.NotDeleteContact(Trigger.oldMap);
    }
}