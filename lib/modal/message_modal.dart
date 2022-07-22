

class SendMessageModal{
  SendMessageModal({
    // this.user_id,
    this.message,

});

  // String? user_id;
  String? message;


  Map<String, dynamic> toJson() => {


    "message": message,



  };


}