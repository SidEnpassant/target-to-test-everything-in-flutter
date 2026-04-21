// polymorphism allows the object of different classes inherit from parent class


void main(){
  Animal myDog = Dog();
  Dog dog = Dog();

  Animal myCat = Cat();

  List<Animal> myList = [Dog() , Cat()];
  myDog.sound();
  myCat.sound();
}


// base class
class Animal{

  void sound(){
    print('The animal is making a sound');
  }
}


class Dog extends Animal {
  @override
  void sound() {
    print('bark');
  }

}


class Cat extends Animal {
  @override
  void sound() {
    print('meow');
  }
}