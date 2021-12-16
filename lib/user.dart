// class user{
//   String name;
//   String pass;
//   user(this.name, this.pass);
//   String getName(){
//     return this.name;
//   }
//   void setName(String name){
//     this.name = name;
//   }
//   String getPass(){
//     return this.pass;
//   }
//   void setPass(String pass){
//     this.pass = pass;
//   }
// }
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}