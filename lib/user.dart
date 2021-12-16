class user{
  String name;
  String pass;
  user(this.name, this.pass);
  String getName(){
    return this.name;
  }
  void setName(String name){
    this.name = name;
  }
  String getPass(){
    return this.pass;
  }
  void setPass(String pass){
    this.pass = pass;
  }
}