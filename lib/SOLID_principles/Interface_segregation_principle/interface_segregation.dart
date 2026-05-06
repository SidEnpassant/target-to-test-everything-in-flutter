
abstract class Mammal{
  void eat();
  void see();
  // FLY SHOULD NOT BE HERE BECAUSE DOG DOESNT FLY WHICH IS IMPLEMENTING THIS FUNCTION
  //void fly();

}

abstract class FlyInterface{
  void fly(); //  FLY WILL BE DISTINCTIVELY IMPLEMENTED HERE
}

class Bird implements Mammal , FlyInterface{ // BIRD DOES FLY , SO IT WILL IMPLEMENT FlyInterface
  /// TO FLY , IT WILL IMPLEMENT FlyInterface ALSO TO FLY
  @override
  void eat() {
  }

  @override
  void fly() {
  }

  @override
  void see() {
  }

}

class Dog implements Mammal{ // DOG NO NEED TO IMPLEMENT FlyInterface BECAUSE IT WILL OF NO
  // USE DOG DOES NOT FLY
  @override
  void eat() {
  }

  @override
  void fly() { //// PROBLEM HERE IS DOG DONT FLY , THIS IS NOT GOING TO BE USED
  }

  @override
  void see() {
  }

}