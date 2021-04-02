import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_events.dart';
import 'package:loook/bloc/add_advert_pages_blocs/chosed_details_bloc/chosed_details_states.dart';

class ChosedDetailsBloc extends Bloc<ChosedDetailsEvents, ChosedDetailsStates> {
  List<dynamic> chosedDetailsList = [];
  ChosedDetailsBloc(ChosedDetailsStates initialState) : super(initialState);

  @override
  Stream<ChosedDetailsStates> mapEventToState(
      ChosedDetailsEvents event) async* {
    if (event is DetailIsChosedEvent) {
      chosedDetailsList.add(event.chosedDetail);
      yield ChosedDetailsListState(chosedDetailsList: chosedDetailsList);
    }

    if (event is RemoveLastIndexOfChosedDetailsEvent) {
      if(chosedDetailsList.isNotEmpty) chosedDetailsList.removeLast();
    }
  }
}
