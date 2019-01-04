import 'package:angular/angular.dart';
import 'src/counter/counter_component.dart';


@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [CounterComponent],
)
class AppComponent {
}
