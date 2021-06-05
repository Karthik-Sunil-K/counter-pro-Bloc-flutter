import 'dart:async';

class CounterBloc{

  final stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => stateStreamController.sink;
  
  Stream<int> get counterStream => stateStreamController.stream;
}