import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loook/bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_events.dart';
import 'package:loook/bloc/home_page_blocs/subcategories_tab_bloc/subcategories_tab_bar_states.dart';

class SubCategoriesTabBarBloc extends Bloc<SubCategoriesTabBarEvents, SubCategoriesTabBarStates>{
  SubCategoriesTabBarBloc(initialState) : super(initialState);

  @override
  Stream<SubCategoriesTabBarStates> mapEventToState(SubCategoriesTabBarEvents event) async*{
   if(event is CategoriesTabBarEvent) yield CategoriesTabBarState();
   if(event is SubCategoriesTabBarEvent) yield SubCategoriesTabBarState();
  }

}