import 'package:meta/meta.dart';

class Counter{
  int _count;
  Counter({int initialValue}){
    this._count = initialValue ?? 0;
  }
  get count => _count;
  increment()=> _count+=1;
}