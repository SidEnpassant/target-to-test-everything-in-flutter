

// class OrderCalculator {
//   num? totalAmount;
//   num? taxPercentage;
//   num? tip;
//   num? shipping;
//
//
//   void calculateOrder(){
//     final orderValue = totalAmount! + tip! + taxPercentage! + shipping!;
//     print(orderValue);
//     sendEmail();
//   }
//
//   void sendEmail(){
//     final email = 'sid@gmail.com';
//     print('Sending email to $email with amount');
//   }
// }

///// THIS ABOVE IS WRONG WHICH BREAKS Single responsibility principle as OrderCalculator
/// has only one job to calculate order value not sending email so this breaks the principle
/// so if needs to change something in sendEmail then need to change in order calculator which
/// is wrong as order calculator has nothing to do with mail
/// SO TO SOLVE THIS CODE SHOULD BE LIKE THIS BELOW


class OrderCalculator {
  num? totalAmount;
  num? taxPercentage;
  num? tip;
  num? shipping;


  void calculateOrder(){
    final orderValue = totalAmount! + tip! + taxPercentage! + shipping!;
    print(orderValue);
  }


}
class EmailOrder{
  static final email = 'Sid@gmail.com';
  static void sendEmail(){
    print('Sending email to $email with amount');
  }
}

