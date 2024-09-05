class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String image;

  UserEntity( {required this.image,required this.name, required this.email, required this.uId});



  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image
    };
  }

}
