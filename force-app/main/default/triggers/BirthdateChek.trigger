trigger BirthdateChek on Contact (before insert) {
  if(Trigger.isInsert){
        birthDate.BirthDateCheck(Trigger.New);
    }
}