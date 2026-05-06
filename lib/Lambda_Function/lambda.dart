// lambda functions are name less function

// (parameters..){
// statements;
// }

void main(){
  // var cube = (int n){ // function has no name
    // up or down
  int Function(int) cube = (int n){
    return n * n * n;
  };

  print(cube(3));


  List names = ['sam' , 'jack' , 'mark'];

  names.forEach((name){
    print(name);
  });
}