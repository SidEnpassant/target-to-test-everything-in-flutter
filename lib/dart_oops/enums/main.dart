// enum is a special type that represent constant value


void main(){
  Person person = Person('Siddhes', Gender.Male);
  

  switch(person.gender){
    case Gender.Male:
      print('Gender is Male');
    case Gender.Female:
      print('Gender is Female');
    case Gender.Other:
      print('Gender is Other');
  }
}

enum Gender{
  Male ,
  Female ,
  Other,
}

enum Status{
  loading ,
  error ,
  success,
}

class Person {
  String name;
  Gender gender;

  Person(this.name , this.gender);
}