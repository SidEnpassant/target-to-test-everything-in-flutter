

import 'package:testapp/SOLID_principles/Open_closed_principle/order_calc.dart';
import 'package:testapp/SOLID_principles/Single_responsibility_principle/order_calc.dart';


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

void main(){
  final customerInfo = CustomerInfo();

  customerInfo.totalAmount = 100;
  customerInfo.taxPercentage = 122;
  customerInfo.shipping = 20;
  customerInfo.tip = 56;
  customerInfo.calculateOrder();
  EmailOrder.sendEmail();
  print(customerInfo.balance);
}
