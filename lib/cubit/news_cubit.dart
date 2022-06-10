import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api/cubit/news_state.dart';

import '../api/dio_api.dart';
// import '../screens/business_screen.dart';
// import '../screens/science_screen.dart';
// import '../screens/sport_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> BusinessList = [];

  List<dynamic> SportList = [];

  List<dynamic> ScienceList = [];

  // List<Widget> Screens = [BusinessScreen(), ScienceScreen(), SportScreen()];

  int currentIndex = 0;

  void BottomNavIndex(int index) {
    emit(NewsNavigatorIndex());
    currentIndex = index;
    if (currentIndex == 0) {
      getSportData();
    } else if (currentIndex == 1) {
      getBusinessData();
    } else if (currentIndex == 2) {
      getScienceData();
    }
  }

  Future<void> getBusinessData() async {
    emit(NewsLoadingBusiness());
    DioHelper.getData(
            query: {
          'country': 'us',
          'category': 'business',
          'apiKey': '0da823f7f6fd44609f7cd8dfb903c87b'
        },
            Url: 'v2/top-headlines')
        .then((value) {
      BusinessList = value.data['articles'];

      emit(NewsGetBusiness());
    }).catchError((onError) {
      print("error is ${onError}");
      emit(NewsGetBusinessWError());
    });
  }

  //----------------------------------------------------------------------------------------------
  Future<void> getSportData() async {
    emit(NewsLoadingSports());

    DioHelper.getData(Url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sport',
      'apiKey': '0da823f7f6fd44609f7cd8dfb903c87b'
    }).then((value) {
      SportList = value.data['articles'];
      emit(NewsGetSport());
      print(SportList);
    }).catchError((onError) {
      print("error is ${onError}");
      emit(NewsGetSportWError());
    });
  }

  //----------------------------------------------------------------------------------------------
  Future<void> getScienceData() async {
    emit(NewsLoadingScience());

    DioHelper.getData(Url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '0da823f7f6fd44609f7cd8dfb903c87b'
    }).then((value) {
      ScienceList = value.data['articles'];
      emit(NewsGetScience());
      print(ScienceList);
    }).catchError((onError) {
      print("error is ${onError}");
      emit(NewsGetScienceWError());
    });
  }
}
