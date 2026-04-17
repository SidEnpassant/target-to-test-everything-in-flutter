
void main() {
  Student student = Student(name: 'Siddhes' , age: 22 ,  email: 'hbmail@gmail.com');
  // Student student1 = Student('SAASASAS' , 22);
  student.displayInfo();
  // List<Student> name = [
  //   Student('Siddhes' , 22),
  //   Student('Siddhes' , 56),
  //   Student('Siddhes' , 89),
  // ];

  List<Student> name = [
  Student(name: 'Siddhes' ,  email: 'hbmail@gmail.com'),
  Student( age: 12 ,  email: 'dfgdf@gmail.com'),
  Student(name: 'asasas' , age: 44 ,  email: 'qweqwe@gmail.com'),
  ];


  //
  name.forEach((element){
    print('name ${element.name} age ${element.age} and email ${element.email}');
  });

}


class Student {
  String? name;
  int? age;
  String? email;

  // Student(String name , int age){ // constructor
  //   print('con called');
  //   this.name = name;
  //   this.age = age;
  // }


  // Student(this.name , this.age){ // constructor
  //   print('con called');
  // }

  Student({this.name = '' , this.age , required this.email}){ // constructor
    print('con called');
  }

  void displayInfo(){
    print('---------------------------------');
    print('Name: $name');
    print('Age: $age');
    print('Email: $email');
    print('---------------------------------');
  }


}