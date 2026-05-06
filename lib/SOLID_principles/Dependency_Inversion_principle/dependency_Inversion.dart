


// class Service{
//   MyDBConnection? connection; // have to change here if in near future want to change or introduce
//   // firebase , SO THIS BREAKS DEPENDENCY INVERSION , Service should not be depended on MyDBConnection
//
//   void attach(){
//     connection!.connect(); // will connect connection
//   }
// }
//
// class MyDBConnection{
//   void connect(){
//
//   }
// }


// SO HAVE TO DO THIS OTHER WAY , SEE THE CODE BELOW //


class Service{
  ConnectionInterface? connection;
  void attach(){
    connection!.connect(); // will connect connection
  }
}
abstract class ConnectionInterface{
  void connect();
}

class MyDBConnection implements ConnectionInterface{
  void connect(){

  }
}

// if tomorrow wants to implement firebase then will do like this below

class FirebaseConnection implements ConnectionInterface{
  @override
  void connect() {
  }

}
