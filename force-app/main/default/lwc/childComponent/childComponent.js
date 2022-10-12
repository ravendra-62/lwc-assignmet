import { LightningElement ,api} from 'lwc';

export default class ChildComponent extends LightningElement {
   @api itemName="Salse Force Noob";
   @api handleChangeValue(){
    this.itemName="SalseForce Lwc Demo";
   }
}