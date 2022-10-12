trigger TotalContactPriceController on Contact(after insert,after update,after delete) {
    if(Trigger.isInsert || Trigger.isUpdate){
    TotalContactPriceController.totalPrice(Trigger.new);
    
    }
    if(Trigger.isDelete){
        TotalContactPriceController.totalPrice(Trigger.Old);
    }
}