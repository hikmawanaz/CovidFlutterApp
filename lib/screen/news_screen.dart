import 'package:covidnineteenina/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  _buildNewsList(BuildContext context){
    List<NewsModel> newsList = [
      NewsModel(title: "Melonjak Jadi 893, Ini Sebaran Kasus Positif Corona",imageUrl: "assets/icons/news1.png"),
      NewsModel(title: "Ini Grafik Kasus Positif Corona di RI, Kian Tinggi",imageUrl: "assets/icons/news2.png"),
      NewsModel(title: "Poin-poin Terkini Pemerintah soal Virus Corona",imageUrl: "assets/icons/news3.png"),
      NewsModel(title: "192 ribu peralatan kesehatan telah tiba di Indonesia",imageUrl: "assets/icons/news4.png"),
      NewsModel(title: "Melonjak Jadi 893, Ini Sebaran Kasus Positif Corona",imageUrl: "assets/icons/news1.png"),
      NewsModel(title: "Ini Grafik Kasus Positif Corona di RI, Kian Tinggi",imageUrl: "assets/icons/news2.png"),
      NewsModel(title: "Poin-poin Terkini Pemerintah soal Virus Corona",imageUrl: "assets/icons/news3.png"),
      NewsModel(title: "192 ribu peralatan kesehatan telah tiba di Indonesia",imageUrl: "assets/icons/news4.png"),
      NewsModel(title: "Melonjak Jadi 893, Ini Sebaran Kasus Positif Corona",imageUrl: "assets/icons/news1.png"),
      NewsModel(title: "Ini Grafik Kasus Positif Corona di RI, Kian Tinggi",imageUrl: "assets/icons/news2.png"),
      NewsModel(title: "Poin-poin Terkini Pemerintah soal Virus Corona",imageUrl: "assets/icons/news3.png"),
      NewsModel(title: "192 ribu peralatan kesehatan telah tiba di Indonesia",imageUrl: "assets/icons/news4.png"),

    ];
    return Padding(padding: EdgeInsets.fromLTRB(20.w, 52.w, 20.w, 20.w),
      child: ListView.builder(itemCount: newsList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildNewsItem(
                context, newsList[index].imageUrl, newsList[index].title);
          }),);
  }
  _buildNewsItem(BuildContext context, assetImage, title){
    return Container(
      height: 83.w,
      margin: EdgeInsets.only(top: 12.w, right: 2.w),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 83.w,
            height: 83.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.w)),
                image: DecorationImage(image: AssetImage(assetImage), fit: BoxFit.cover)
            ),
          ),
          Container(height: 83.w, width: 150.w,margin: EdgeInsets.all(16.w),child: Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontFamily: "Poppins", fontSize: 11.sp ), maxLines: 3, overflow: TextOverflow.ellipsis,),)
        ],

      ),
    );
  }
  _buildAppBar(BuildContext context){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 52.w,
      padding: EdgeInsets.all(18.w),
      child: Stack(
        children: <Widget>[
          Align(child: InkWell(child: Icon(Icons.arrow_back_ios, color: Color(0xffA852CB), size: 14.sp,) ,onTap: (){print("asdasd");},),alignment: Alignment.centerLeft,),
          Align(child: Text("Daftar Berita", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 14.sp),),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 320, height: 568, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _buildAppBar(context),
            _buildNewsList(context)
          ],
        ),
      ),
    );
  }
}