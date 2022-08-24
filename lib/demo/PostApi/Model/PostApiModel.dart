class PostApiModel {
  String? firstName;
  String? phoneNumber;
  String? email;
  String? vehicle;
  String? jobTitle;
  int? id;

  PostApiModel(
      {this.firstName,
      this.phoneNumber,
      this.email,
      this.vehicle,
      this.jobTitle,
      this.id});

  PostApiModel.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    phoneNumber = json['PhoneNumber'];
    email = json['Email'];
    vehicle = json['Vehicle'];
    jobTitle = json['JobTitle'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['PhoneNumber'] = this.phoneNumber;
    data['Email'] = this.email;
    data['Vehicle'] = this.vehicle;
    data['JobTitle'] = this.jobTitle;
    data['id'] = this.id;
    return data;
  }
}
