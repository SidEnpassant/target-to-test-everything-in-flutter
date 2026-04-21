import 'package:equatable/equatable.dart';

// CounterEvent is the base class 
abstract class CounterEvent extends Equatable{

  const CounterEvent(); // constructor
  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {
}

class DecrementCounter extends CounterEvent {
}