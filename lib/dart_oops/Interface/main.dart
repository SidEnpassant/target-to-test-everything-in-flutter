void main() {
  // Macbook macbook = Macbook();
  // macbook.turnOn();
  // macbook.turnOff();

  Dog dog = Dog();

  List<Animal> name  = [Dog() , Cat()]; // polymorphism

  dog.sound();
}

// interface class , concrete class
// class Laptop {
//
//   void turnOn(){
//     print('Laptop turn on');
//   }
//
//   void turnOff(){
//     print('Laptop turn off');
//   }
//
// }
// class Macbook implements Laptop{
//   @override
//   void turnOff() {
//     print('Laptop turn off');
//   }
//
//   @override
//   void turnOn() {
//     print('Laptop turn on');
//   }
//
// }



//Interface
abstract class Animal{

  //abstract method as no body
  void sound();

  // this is not abstract method as it has body , NON-ABSTRACT
  void eat(){
    print('The animal is eating');
  }
}


class Dog extends Animal {
  @override // polymorphism
  void sound() {
    super.eat();
    print('bark');
  }

}


class Cat extends Animal {
  @override
  void sound() {
    print('meow');
  }
}