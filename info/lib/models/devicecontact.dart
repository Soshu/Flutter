// Model object for orders.
class DeviceContact {
  String id;
  String phonenumber;
  String displayName;
  //SharedPreferences sharedPreferences;
  //Order({this.id, this.phonenumber, this.details,this.vendor, this.amount, this.currency, this.status, this.created_ts});
  DeviceContact(String id,String phonenumber,String displayName) {
    this.id = id;
    this.phonenumber = phonenumber;
    this.displayName = displayName;
  }
  Map<String, dynamic> toJson() =>
      {
        "id" : id,
        "phonenumber" : phonenumber,
        "displayName" : displayName,
      };
  DeviceContact.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    phonenumber = json['phonenumber'] as String;
    displayName = json['displayName'] as String;
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'phonenumber': this.phonenumber,
      'displayName': this.displayName,
    } as Map<String, dynamic>;
  }


}
