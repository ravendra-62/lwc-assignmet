public class exitAccountInsert {
    public static void CheckContact(List<Contact> contest ){
         Map<String,Contact> NameMap = new Map<string,Contact>(); 
         for(Contact conNew : contest){
            NameMap.put(conNew.LastName,conNew);
        }
         List<Contact> listOfCon= [Select LastName From Contact Where LastName In : NameMap.keySet()];
        for(Contact con : listOfCon){
            Contact exitingCont = NameMap.get(con.LastName);
            if(exitingCont != null){
                exitingCont.LastName.addError(' Contact with the Same Name is Exit');
            }
            
        }
        for(Contact conNew : contest){
            conNew.LastName = 'asd';
        }
    }
    }