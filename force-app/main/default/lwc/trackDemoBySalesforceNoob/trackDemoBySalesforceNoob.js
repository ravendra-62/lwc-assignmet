import { LightningElement,track } from 'lwc';

export default class TrackDemoBySalesforceNoob extends LightningElement {

@track fullName={firstname : " " ,lastname :" "};

handleChange(event){
    const field =event.target.name;
   // window.alert(field);
   if(field === 'firstname'){
     this.fullName.firstname = event.target.value;

   }
   if(field === 'lastname'){
    this.fullName.lastname = event.target.value;
    
  }
}

}