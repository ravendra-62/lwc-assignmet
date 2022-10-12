trigger exitAccountInsert on Contact (before insert) {
    
    if(Trigger.isInsert){
        exitAccountInsert.CheckContact(Trigger.New);
    }
}