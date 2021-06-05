import 'dart:async';
enum CounterAction{
  Increment,
  Decrement,
  Reset
}

class CounterBlock{
  int counter=0;

  final stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => stateStreamController.sink;
  Stream<int> get counterStream => stateStreamController.stream;

  final eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventStreamController.sink;
  Stream<CounterAction> get eventStream => eventStreamController.stream;

  CounterBlock(){
    counter = 0;
    eventStream.listen((event) {
      if (event==CounterAction.Increment)
      counter++;
      else if (event==CounterAction.Decrement) counter--;
      else if (event==CounterAction.Reset) counter = 0;
      counterSink.add(counter);
    });
  }

}