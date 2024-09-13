class UserEntity {
  final String? name;
  final String? email;
  final String? uId;
  final String? image;
  final String? carType;

  UserEntity(  {this.carType, this.image, this.name,  this.email,  this.uId});



  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
      'carType': carType,
    };
  }

}
