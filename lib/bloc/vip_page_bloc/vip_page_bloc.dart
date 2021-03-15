import 'package:flutter_bloc/flutter_bloc.dart';

class VipPageBloc extends Bloc<int, int> {
  int index;
  VipPageBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async* {
    index = event + 1;
    print(index);
    yield index;
  }
}
