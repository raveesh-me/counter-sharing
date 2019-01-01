import 'dart:async';
import 'counter.dart';

class CounterBloc{
  Counter counter;
  CounterBloc({counter}){
    this.counter = counter ?? Counter();
  }



}