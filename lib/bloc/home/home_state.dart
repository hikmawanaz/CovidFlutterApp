part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  final GlobalCovidRecoveredCaseResponse globalCovidRecoveredCaseResponse;
  final GlobalCovidDeathCaseResponse globalCovidDeathCaseResponse;
  final GlobalCovidPositiveCaseResponse globalCovidPositiveCaseResponse;
  final SummaryIndonesiaCovidCaseResponse summaryIndonesiaCovidCaseResponse;
  const HomeSuccess(this.globalCovidPositiveCaseResponse, this.summaryIndonesiaCovidCaseResponse, this.globalCovidDeathCaseResponse, this.globalCovidRecoveredCaseResponse);
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}

