//
//
// abstract class Shape{
//   void area();
// }
// class Circle implements Shape{
//   num? radius;
//   @override
//   void area(){
//     print('PIE R^2');
//   }
// }
//
// class Square extends Rectangle{
//   num? _width;
//   num? _height;
//   get width => _width;
//   get height => _height;
//
//   void setWidth(num value){
//     this._width = value;
//     this._height = value;
//   }
//   void setHeight(num value){s
//     this._height = value;
//     this._width = value;
//   }
//
//
// }
//
// class Rectangle {
//   num? _width;
//   num? _height;
//
//   get width => _width;
//   get height => _height;
//
//   void setWidth(num value){
//     this._width = value;
//   }
//   void setHeight(num value){
//     this._height = value;
//   }
// }
//
// class AreaCalculator{
//   Shape shape;
//   AreaCalculator({
//     required this.shape,
//   });
//
//   calculate(){
//     shape.area();
//   }
// }


////// ----------- SHOULD NOT DO LIKE THIS ABOVE ---------- /////




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

class Shape2{ /// THIS IS PARENT , THIS WILL HAVE NO PROBLEM WITH CHILD
  /// parent only saying its a shape with width and height not saying any specific shape
  num? width;
  num? height;
}

class Square extends Shape2{
}

class Rectangle extends Shape2{

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
