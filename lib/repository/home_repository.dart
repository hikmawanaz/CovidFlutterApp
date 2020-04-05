import 'dart:convert';

import 'package:covidnineteenina/model/global_covid_death_case_response.dart';
import 'package:covidnineteenina/model/global_covid_positive_case_response.dart';
import 'package:covidnineteenina/model/global_covid_recovered_case_response.dart';
import 'package:covidnineteenina/model/summary_indonesia_covid_case_response.dart';
import 'package:dio/dio.dart';

class HomeRepository{
  static Dio _dio;
  HomeRepository() {
    initDio();
  }

  initDio() async {
    _dio = Dio();
  }

  Future<SummaryIndonesiaCovidCaseResponse> getSummaryIndonesianCovidCase() async {
    try{
      Response<String> response = await _dio.get("https://api.kawalcorona.com/indonesia/");
      var jsonObject = jsonDecode(response.data) as List;
      List<SummaryIndonesiaCovidCaseResponse> listSummaryIndonesiaCovidCaseResponse = jsonObject.map((response)=> SummaryIndonesiaCovidCaseResponse.fromJson(response)).toList();
      SummaryIndonesiaCovidCaseResponse summaryIndonesiaCovidCaseResponse = listSummaryIndonesiaCovidCaseResponse[0];
      return summaryIndonesiaCovidCaseResponse;
    } catch(e){
      print(e);
      throw Exception();
    }
  }

  Future<GlobalCovidDeathCaseResponse> getGlobalCovidDeathCase() async {
    try{
      Response response = await _dio.get("https://api.kawalcorona.com/meninggal/");
      GlobalCovidDeathCaseResponse globalCovidDeathCaseResponse = GlobalCovidDeathCaseResponse.fromJson(response.data);
      return globalCovidDeathCaseResponse;
    } catch(e){
      throw Exception();
    }
  }

  Future<GlobalCovidPositiveCaseResponse> getGlobalCovidPositiveCase() async {
    try{
      Response response = await _dio.get("https://api.kawalcorona.com/positif/");
      GlobalCovidPositiveCaseResponse globalCovidPositiveCaseResponse = GlobalCovidPositiveCaseResponse.fromJson(response.data);
      return globalCovidPositiveCaseResponse;
    } catch(e){
      throw Exception();
    }
  }

  Future<GlobalCovidRecoveredCaseResponse> getGlobalCovidRecoveredCase() async {
    try{
      Response response = await _dio.get("https://api.kawalcorona.com/sembuh/");
      GlobalCovidRecoveredCaseResponse globalCovidRecoveredCaseResponse = GlobalCovidRecoveredCaseResponse.fromJson(response.data);
      return globalCovidRecoveredCaseResponse;
    } catch(e){
      throw Exception();
    }
  }

  Future<GlobalCovidRecoveredCaseResponse> getHomeNews() async {
    try{
      Response response = await _dio.get("https://api.kawalcorona.com/sembuh");
      GlobalCovidRecoveredCaseResponse globalCovidRecoveredCaseResponse = GlobalCovidRecoveredCaseResponse.fromJson(response.data);
      return globalCovidRecoveredCaseResponse;
    } catch(e){
      throw Exception();
    }
  }
}