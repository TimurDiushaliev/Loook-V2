import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertDetailsImagesBloc extends Bloc<int, int>{
  AdvertDetailsImagesBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(int event) async*{
    yield event;
  }

}