import 'package:core/core.dart' as counter;
import 'package:angular/angular.dart';
import 'package:web/src/web_counter_store.dart';


@Component(
  selector: 'counter',
  styleUrls: ['counter_component.css'],
  template: '''
    <span>{{count}}</span>
    <button (click)="increment()">Increment</button>
  ''',
)
class CounterComponent implements OnInit, OnDestroy {

  counter.CounterBloc bloc;
  int count = 0;

  @override
  void ngOnInit() async {
    // TODO: implement ngOnInit
    bloc = await counter.CounterBloc.fromStore(WebCounterStore());
    bloc.countStream.listen((data) {
      count = data;
    });
  }

  @override
  void ngOnDestroy(){
    bloc.dispose();
  }
  increment() => bloc.increment();
}