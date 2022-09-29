import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_projects/logic/chat/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  bool showingSpinner = false;

  void showingSpinnerMethod(){
    showingSpinner = true;
    emit(ShowingSpinner());
  }
  void nonshowingSpinnerMethod(){
    showingSpinner = false;
    emit(NonShowingSpinner());
  }

  String invalid = '';

  void showingInvalid(String value){
    invalid = value;
    emit(ShowingInvalid());
  }


}




/// draft

  /// darkMode
  // bool? isDark=CacheHelper.getBool(key: 'isDark');
  // void light(){
  //   isDark = !isDark!;
  //   CacheHelper.setBool(key: 'isDark', value: isDark!);
  //   emit(Brightness());
  // }