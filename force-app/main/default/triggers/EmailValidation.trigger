trigger EmailValidation on Contact (before insert) {
 Set<String> emailSet = new Set<String>();
    for(Contact con : Trigger.New){
        emailSet.add(con.Email);
    }
    Integer ConNumber = [Select Count() From Contact Where Email In : emailSet];
    if(conNumber>0){
        for(Contact con : Trigger.New){
            con.addError('This Email is already used !');
        }
    }
}