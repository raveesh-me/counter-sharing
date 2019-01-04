import 'package:core/core.dart' as counter;
import 'package:angular/angular.dart';


@Component(
  selector: 'counter',
  styleUrls: ['counter_component.css'],
  template: '''
    <span>{{count}}</span>
    <button (click)="increment()">Increment</button>
  ''',
)
class CounterComponent implements OnInit {

  counter.CounterBloc bloc = counter.CounterBloc();
  int count = 0;

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
    bloc.countStream.listen((data) {
      count = data;
    });
  }
  increment() => bloc.increment();
}