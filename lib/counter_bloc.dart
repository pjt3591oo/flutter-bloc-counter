import 'package:rxdart/rxdart.dart';
// import 'dart:async';

class CounterBloc {
  static final CounterBloc _instance = new CounterBloc._(count: 0);
  
  int count = 0;
  BehaviorSubject<int> _subjectCounter;

  // 외부에서의 호출 방지
  CounterBloc._({this.count}) {
    _subjectCounter = BehaviorSubject<int>.seeded(this.count);
  }
  
  factory CounterBloc() {
    return _instance;
  }

  // 스트림 객체
  Stream<int> get stream => _subjectCounter.stream;

  void increment() {
    print('[CALL] increment');
    count++;
    _subjectCounter.sink.add(count);
  }

  void decrement() {
    print('[CALL] decrement');
    count--;
    _subjectCounter.sink.add(count);
  }

  void reset() {
    count = 0;
    _subjectCounter.sink.add(count);
  }

  void dispose() {
    _subjectCounter.close();
  }
}