//MIXIN : it is a phenomena to share or use a code of a mixin class in different classes
// 1. Cant create objects of mixin class
// 2. Cant create constructor of mixin class
// 3, Cant extend mixin class
// 4. Have to use with keyword to use mixin


void main(){
  Person person = Person('asas@gmail.com', 'sdssdasdsad');
  person.displayInfo();
}

class Person with Logger , Validation{
  String email , password;

  Person(this.email , this.password);

  void displayInfo(){
    if(validatePassword(password) != null){
      log(validatePassword(password).toString());
    }
    else{
      log('User email ${email} and password is ${password}');
    }
  }
}


mixin Logger{
  void log(String message){
    print(message);
  }
}


mixin Validation{
  String? validatePassword(String value){
    if(value.isEmpty){
      return 'Password cannot be empty';
    }
    if(value.length < 6){
      return 'Password cannot be minimum 6 characters';
    }
    return null;
  }
}