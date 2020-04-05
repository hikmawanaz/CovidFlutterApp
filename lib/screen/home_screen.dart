import 'package:covidnineteenina/bloc/home/home_bloc.dart';
import 'package:covidnineteenina/model/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _buildAppbar(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
      child: Container(
        height: 41.w,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("assets/icons/ic_title.png", height: 20.w,fit: BoxFit.fitHeight,),
          Icon(Icons.notifications, color: Colors.white,size: 26.w,)
        ],)
      ),
    );
  }

  _buildAppBackground(BuildContext context){
    return Container(
      height: 287.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/ic_hero_section.png"),
            fit: BoxFit.cover
        )
      ),
    );
  }
  _buildSearchBox(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: Color(0xfffefefe),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.w),
            topRight: Radius.circular(36.w),
          )
      ),
      child: Image.asset("assets/icons/ic_search_box.png",fit: BoxFit.fitWidth,),
    );
  }

  _buildIndonesianCovidSummaryCase(BuildContext context, HomeState state){
    String positiveCase = "-";
    String recoveredCase = "-";
    String deathCase = "-";
    if(state is HomeSuccess){
      positiveCase = state.summaryIndonesiaCovidCaseResponse.positif;
      recoveredCase = state.summaryIndonesiaCovidCaseResponse.sembuh;
      deathCase = state.summaryIndonesiaCovidCaseResponse.meninggal;
      print(state.summaryIndonesiaCovidCaseResponse.meninggal);
    }

    return Container(
      color: Color(0xfffefefe),
      height: 220.w,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("Update Kasus COVID-19", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 12.sp),),
                Text("Diperbarui 3 jam yang lalu", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 10.sp),),
              ],), Container(
                  width: 72.w,
                  height: 26.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icons/ic_show_detail.png"), fit: BoxFit.fitWidth),
                  ),
                ),

            ],
          ),
          Padding(padding: EdgeInsets.all(0.w),
          child: Container(
            padding: EdgeInsets.all(20.w),
            height: 140.w,
            width: MediaQuery.of(context).size.width.w,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.w, // has the effect of softening the shadow
                    spreadRadius: 1.w, // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.w),
                  topRight: Radius.circular(18.w),
                  bottomLeft: Radius.circular(18.w),
                  bottomRight: Radius.circular(18.w),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/icons/ic_positive.png", width: 26.w, fit: BoxFit.fitWidth,),
                    Text(positiveCase, style: TextStyle(color: Color(0xFFFD9D00),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                    Text("Kasus Positif", style: TextStyle(color: Color(0xFFF5A623),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/icons/ic_recovered.png", width: 26.w, fit: BoxFit.fitWidth,),
                    Text(recoveredCase, style: TextStyle(color: Color(0xFF6CCE00),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                    Text("Sembuh", style: TextStyle(color: Color(0xFF6CCE00),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/icons/ic_death.png", width: 26.w, fit: BoxFit.fitWidth,),
                    Text(deathCase, style: TextStyle(color: Color(0xFFD0021B),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                    Text("Meninggal", style: TextStyle(color: Color(0xFFD0021B),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                  ],
                )
              ],
            ),
          ),)
        ],
      ),
    );
  }


  _buildGlobalCovidSummaryCase(BuildContext context, HomeState state){
    String positiveCase = "-";
    String recoveredCase = "-";
    String deathCase = "-";
    if(state is HomeSuccess){
      positiveCase = state.globalCovidPositiveCaseResponse.value;
      recoveredCase = state.globalCovidRecoveredCaseResponse.value;
      deathCase = state.globalCovidDeathCaseResponse.value;
    }

    return Container(
      color: Color(0xffFBF8FF),
      height: 390.w,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.w, top: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Data COVID-19 Dunia", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 12.sp),),
                  Text("Diperbarui 3 jam yang lalu", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 10.sp),),
                ],), Container(
                width: 72.w,
                height: 26.w,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/icons/ic_show_detail.png"), fit: BoxFit.fitWidth),
                ),
              ),

            ],
          ),
          Padding(padding: EdgeInsets.all(0.w),
            child: Container(
              padding: EdgeInsets.only(top: 16.w, bottom: 16.w),
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 20.w, // has the effect of softening the shadow
                      spreadRadius: 1.w, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        0, // vertical, move down 10
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.w),
                    topRight: Radius.circular(18.w),
                    bottomLeft: Radius.circular(18.w),
                    bottomRight: Radius.circular(18.w),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/icons/ic_positive.png", width: 26.w, fit: BoxFit.fitWidth,),
                        Padding(padding: EdgeInsets.only(left: 16.w),),
                        Text("Kasus Positif Seluruh Dunia", style: TextStyle(color: Color(0xFFF5A623),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                      ],),
                  ),
                  Padding(padding: EdgeInsets.only(left: 62.w, bottom: 4.w),
                  child: Text(positiveCase, style: TextStyle(color: Color(0xFFFD9D00),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                  ),
                  Container(
                    color: Color(0xA0D8D8D8),
                    height: 1.w,
                    width: MediaQuery.of(context).size.width.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 10.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/icons/ic_recovered.png", width: 26.w, fit: BoxFit.fitWidth,),
                        Padding(padding: EdgeInsets.only(left: 16.w),),
                        Text("Kasus Sembuh Seluruh Dunia", style: TextStyle(color: Color(0xFF6CCE00),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                      ],),
                  ),
                  Padding(padding: EdgeInsets.only(left: 62.w, bottom: 4.w),
                    child:   Text(recoveredCase, style: TextStyle(color: Color(0xFF6CCE00),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                  ),
                  Container(
                    color: Color(0xA0D8D8D8),
                    height: 1.w,
                    width: MediaQuery.of(context).size.width.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 10.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Image.asset("assets/icons/ic_death.png", width: 26.w, fit: BoxFit.fitWidth,),
                        Padding(padding: EdgeInsets.only(left: 16.w),),
                        Text("Meninggal", style: TextStyle(color: Color(0xFFD0021B),fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12.sp),),
                      ],),
                  ),
                  Padding(padding: EdgeInsets.only(left: 62.w),
                    child:   Text(deathCase, style: TextStyle(color: Color(0xFFD0021B),fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 32.sp),),
                  ),
                  ],
              )
            ),)
        ],
      ),
    );
  }

  _buildNews(BuildContext context){
    return Container(
      color: Color(0xfffefefe),
      height: 280.w,
      padding: EdgeInsets.only(bottom: 20.w, top: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.w),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Berita Terbaru", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 12.sp),),
                    Text("Diperbarui 3 jam yang lalu", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 10.sp),),
                  ],), Container(
                  width: 72.w,
                  height: 26.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icons/ic_show_detail.png"), fit: BoxFit.fitWidth),
                  ),
                ),
              ],
            ),
          ),
          _buildNewsList(context)
        ],
      ),
    );
  }

  _buildNewsList(BuildContext context){
    List<NewsModel> newsList = [
      NewsModel(title: "Melonjak Jadi 893, Ini Sebaran Kasus Positif Corona",imageUrl: "assets/icons/news1.png"),
      NewsModel(title: "Ini Grafik Kasus Positif Corona di RI, Kian Tinggi",imageUrl: "assets/icons/news2.png"),
      NewsModel(title: "Poin-poin Terkini Pemerintah soal Virus Corona",imageUrl: "assets/icons/news3.png"),
      NewsModel(title: "192 ribu peralatan kesehatan telah tiba di Indonesia",imageUrl: "assets/icons/news4.png"),

    ];
    return SizedBox(height:187.w,child: ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
        if(index == 0){
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: newsItem(newsList[index].imageUrl, newsList[index].title),
          );
        }else if(index == newsList.length-1){
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: newsItem(newsList[index].imageUrl, newsList[index].title),
          );
        }else{
          return newsItem(newsList[index].imageUrl, newsList[index].title);
        }
      }
    ),);
  }

  Widget newsItem(String assetImage, String title){
    return Container(
      margin: EdgeInsets.only(left: 12.w, bottom: 2.w),
      width: 142.w,
      height: 185.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18.w)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 1.w, // has the effect of softening the shadow
            spreadRadius: 1.w, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 142.w,
            height: 103.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18.w),topRight: Radius.circular(18.w)),
              image: DecorationImage(image: AssetImage(assetImage), fit: BoxFit.cover)
            ),
          ),
          Container(padding: EdgeInsets.fromLTRB(14.w, 14.w, 14.w, 14.w),
          width: 142.w,
          height: 82.w,
          child: Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontFamily: "Poppins", fontSize: 11.sp ), maxLines: 3, overflow: TextOverflow.ellipsis,),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 320, height: 568, allowFontScaling: true);
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()..add(HomeInitialized()),
        child: BlocListener<HomeBloc,HomeState>(
          listener: (context, state){
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state){
              return SafeArea(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 320.w,
                      child: Stack(
                        children: <Widget>[
                          _buildAppBackground(context),
                          Align(alignment: Alignment.topCenter,
                            child: _buildAppbar(context),),
                          Align(alignment: Alignment.bottomCenter,
                            child: _buildSearchBox(context),)
                        ],
                      ),
                    ),
                    _buildIndonesianCovidSummaryCase(context,state),
                    _buildNews(context),
                    _buildGlobalCovidSummaryCase(context, state),
                  ],
                )

              );
            },
          ),
        ),
      ),
    );
  }
}