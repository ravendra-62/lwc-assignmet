public class birthDate {
   public static void BirthDateCheck(List<Contact> CheckBirth ){
       
        for(Contact con : CheckBirth){
            Integer birth = (con.Birthdate.daysBetween(System.today())/365);
            if(birth<18){
				con.Birthdate.addError(' BirthDate is Must Be Greater Then 18 !');
            }
            
        }
   
   
   
   } 
 }