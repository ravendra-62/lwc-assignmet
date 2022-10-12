import { LightningElement, track} from 'lwc';
import getObjectsName from '@salesforce/apex/ExploreCustomContactController.getObjectsName';

import getAllFields from '@salesforce/apex/ExploreCustomContactController.getAllFields';
import getDb from '@salesforce/apex/ExploreCustomContactController.getDb';

export default class ExploreCustomContactController extends LightningElement {
    value='';
    @track options='';
   
    @track fields='';
       connectedCallback(){
        getObjectsName({

        })
           .then(result=>{
               this.options=result
           })
           .catch(error=>{
               console.log('error');
           }); 
       }

       handleChange(event) {
        this.value = event.detail.value;

        getAllFields({
            objectName:  event.detail.value
        })
        .then(result => {
            this.fields=result;
        })
        .catch(error =>{
            console.log('error');
        });

       }
       @track query =[];
       @track stringQuery = '';
       
       changeMethod(event){
   
        this.query=event.detail.value;

        this.stringQuery ='SELECT '+ this.query + ' FROM ' + this.value;
    
       }

       @track some='';
       @track getData =[];
       handleClick(){
        getDb({
            query:this.stringQuery
        })
        .then(result =>{
            this.some=result;
            this.getData=[];
            for(var i=0 ; i<this.query.length;i++){
                this.getData.push({

                    label:this.query[i],
                    fieldName:this.query[i],
                    type:'text'
                })
            }
        })
        .catch(error => {
            console.log('error');
        });
        
       }    
    }