

// class OrderCalculator {
//   num? totalAmount;
//   num? taxPercentage;
//   num? tip;
//   num? shipping;
//
//   // cant add this new feature addition for some need here , like adding balance for
//   // new feature requirement , this cannot be done , bad code practice
//   num? balance;
//
//
//   void calculateOrder(){
//     final orderValue = totalAmount! + tip! + taxPercentage! + shipping!;
//     print(orderValue);
//   }
//
//
// }



/////INSTEAD WILL DO LIKE THIS BELOW TO MAINTAIN Open closed principle

//// SHOULD NOT GET MODIFIED BUT CAN BE EXTENDED

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

class CustomerInfo extends OrderCalculator{ // so CustomerInfo has now all order related info plus new info
  num? balance = 100;
}



///// SEE THESE CODE BELOW , SO CLEAN TO READ AND DEVELOPE MORE
abstract class Shape{
  void area();
}
class Circle implements Shape{
  num? radius;
  @override
  void area(){
    print('PIE R^2');
  }
}

class Square implements Shape{
  num? length;
  @override
  void area(){
    print('4*r');
  }
}

class Rectangle implements Shape{
  num? length;
  num? breadth;
  @override
  void area(){
    print('Area of Rectangle');
  }
}

class AreaCalculator{
  Shape shape;
  AreaCalculator({
    required this.shape,
  });

  calculate(){
    shape.area();
  }
}
