import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covidnineteenina/model/global_covid_death_case_response.dart';
import 'package:covidnineteenina/model/global_covid_positive_case_response.dart';
import 'package:covidnineteenina/model/global_covid_recovered_case_response.dart';
import 'package:covidnineteenina/model/summary_indonesia_covid_case_response.dart';
import 'package:covidnineteenina/repository/home_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if(event is HomeInitialized){
      yield HomeLoading();
      try{
        GlobalCovidPositiveCaseResponse globalCovidPositiveCaseResponse = await HomeRepository().getGlobalCovidPositiveCase();
        GlobalCovidRecoveredCaseResponse globalCovidRecoveredCaseResponse = await HomeRepository().getGlobalCovidRecoveredCase();
        GlobalCovidDeathCaseResponse globalCovidDeathCaseResponse = await HomeRepository().getGlobalCovidDeathCase();
        SummaryIndonesiaCovidCaseResponse summaryIndonesiaCovidCaseResponse = await HomeRepository().getSummaryIndonesianCovidCase();
        yield HomeSuccess(globalCovidPositiveCaseResponse, summaryIndonesiaCovidCaseResponse, globalCovidDeathCaseResponse, globalCovidRecoveredCaseResponse);
      }catch(e){
        yield HomeError();
      }
    }
  }
}
