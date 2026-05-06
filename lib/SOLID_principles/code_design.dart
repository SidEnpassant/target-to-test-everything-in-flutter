

// import 'package:testapp/SOLID_principles/Open_closed_principle/liskov.dart';
// import 'package:testapp/SOLID_principles/Single_responsibility_principle/liskov.dart';
//

import 'dart:developer';

import 'package:testapp/SOLID_principles/Dependency_Inversion_principle/dependency_Inversion.dart';

import 'Liskov_substitution_principle/liskov.dart';

//// ---------- Single Responsibility Principle ---------------/////
// void main(){
//   final order = OrderCalculator();
//   order.totalAmount = 100;
//   order.taxPercentage = 122;
//   order.shipping = 20;
//   order.tip = 56;
//   order.calculateOrder();
//   EmailOrder.sendEmail();
// }
//


//// ---------- Open Closed Principle ---------------/////

// void main(){
//   final customerInfo = CustomerInfo();
//
//   customerInfo.totalAmount = 100;
//   customerInfo.taxPercentage = 122;
//   customerInfo.shipping = 20;
//   customerInfo.tip = 56;
//   customerInfo.calculateOrder();
//   EmailOrder.sendEmail();
//   print(customerInfo.balance);
// }


//// ------------------ Liskov substitution principle -----------------/////
//
// void main(){
//   // final rectangle = Rectangle();
//   // rectangle.setHeight(100);
//   // rectangle.setWidth(200);
//   // print(rectangle.width);
//   // print(rectangle.height);
//
//   // final square = Square();
//   // square.setHeight(100);
//   // square.setWidth(200);
//   // print(square.width);
//   // print(square.height);
//
//   final rectangle = Shape2();
//   rectangle.width = 100;
//   rectangle.height = 200;
//
//   print(rectangle.width);
//   print(rectangle.height);
//
//
// }


//// ----------- DEPENDENCY INVERSION --------------//

void main(){
  final service = Service();
  //service.connection = MyDBConnection();
  /// and if want to user firebase connection in near future then just cant replace
  /// this above and do like below
  service.connection = FirebaseConnection();
  service.attach();
}