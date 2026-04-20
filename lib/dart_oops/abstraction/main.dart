/// An abstract class is a restricted class in object-oriented programming that cannot be instantiated (used to create objects) and is designed to be a blueprint for subclasses. It allows sharing common code while enforcing specific implementations for certain methods in subclasses, using the abstract keyword.




// LESSON 01 ////


// void main() {
//   NetworkServicesApi networkServicesApi = NetworkServicesApi('Crucial');
//   Map<String,String> data = {
//     'email': 'asasas@gmail.com',
//     'password': '12121212',
//   };
//   networkServicesApi.postApi(data);
//   networkServicesApi.getApi();
// }
//
// abstract class BaseApiService{
//   void postApi(var data);
//
//   void getApi();
// }
//
// class NetworkServicesApi extends BaseApiService{
//   String need;
//   NetworkServicesApi(this.need);
//   @override
//   void getApi() async{
//     print('Api called');
//     await Future.delayed(Duration(seconds: 3));
//     print('Got credentials and logged in');
//   }
//
//   @override
//   void postApi (var data) async{
//     print('Api hit');
//     await Future.delayed(Duration(seconds: 2));
//     print('user successfully login');
//     print(data['email']);
//   }
//
// }


/// ------------------------------------------------ ------------------------ ------------------------

/// LESSON 02



void main(){
  Car car = Car();
  car.start();
  car.stopped();

  Bike bike = Bike();
  bike.start();
  bike.stopped();
}

abstract class Vehicle{
  void start();
  void stopped();
}


class Car extends Vehicle{
  @override
  void start() {
    print('Engines start');
  }

  @override
  void stopped() {
    print('Engines stopped');
  }

}



class Bike extends Vehicle{
  @override
  void start() {
    print('Bike Engines start');
  }

  @override
  void stopped() {
    print('Bike Engines stopped');
  }

}