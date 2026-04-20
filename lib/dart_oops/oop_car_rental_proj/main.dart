void main(){
  Car car = Car('Skoda', 'Slavia 2026', 2026, 4);
  print('Car information');
  car.displayInfo();
  print('Rental price for 5 days: ${car.calculateRentalPrice(5)}');

}

class Vehicle {
  String brand;
  String model;
  int year;

  //constructor
  Vehicle(this.brand , this.model , this.year);

  void displayInfo(){
    print('Brand: $brand');
    print('Model: $model');
    print('Year: $year');
  }

  //method to calculate rental price
  double calculateRentalPrice(int days){
    return days * 5000;
  }
}


class Car extends Vehicle{
  int door;
  Car(String brand , String model , int year , this.door):super(brand , model , year);

  void displayInfo(){
    super.displayInfo();
    print('Doors: $door');
  }

  @override
  double calculateRentalPrice(int days){
    return super.calculateRentalPrice(days) + 800 * door;
  }
}