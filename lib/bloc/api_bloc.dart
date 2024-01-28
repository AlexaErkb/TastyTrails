import 'package:bloc/bloc.dart';
import 'api_events.dart';

class NavBloc extends Bloc<NavEvent, bool> {
  NavBloc() : super(false);

  @override
  Stream<bool> mapEventToState(NavEvent event) async* {
    if (event is GoToPageEvent) {
      yield true;
    } else if (event is GoBackEvent) {
      yield false;
    }
  }
}