import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_app/utils/appconstants.dart';
import 'package:the_app/utils/helper/data_functions.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

import '../../screens/viewmorescreen.dart';
import '../../utils/appcolors.dart';
import '../apptext.dart';
import '../news_widget.dart';

class HomeSectionCountry extends StatefulWidget {
  const HomeSectionCountry({super.key});

  @override
  State<HomeSectionCountry> createState() => _HomeSectionCountryState();
}

class _HomeSectionCountryState extends State<HomeSectionCountry> {
  RssFeed? feed;
  DataHandler dataHandler = DataHandler();

  String lang = "";
  String langCode = "";
  String country = "";
  String countryCode="";

  String uriString = "";


  @override
  void initState() {
    super.initState();
    readData();
  }
  void readData() async{
    country = await dataHandler.getStringValue(AppConstants.countryName);
    countryCode = await dataHandler.getStringValue(AppConstants.countryCode);

    lang = await dataHandler.getStringValue(AppConstants.langName);
    langCode = await dataHandler.getStringValue(AppConstants.langCode);
    setState(() {
      uriString =
        "https://news.google.com/rss?ceid=${countryCode}:${langCode.toLowerCase()}&hl=${lang}&gl=${langCode.toLowerCase()}";
    });
  }

  Future<void> loadFeed() async {

    try {
      var response = await http.get(Uri.parse(
          uriString
      ));

      // print (
      //     uriString
      // );

      if (response.statusCode == 200) {
        // print(response.body);
        setState(() {
          feed = RssFeed.parse(response.body);
        });
      }
    } catch (e) {
      print('Error loading RSS feed: $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    if (feed == null)
      {
        loadFeed();
      }


    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AppText(
                text: country,
                fontSize: 18.0,
                color: AppColors.blackColor,
                letterSpacing: 4,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.list,
                color: AppColors.blackColor.withOpacity(0.2),
              ),
            )
          ],
        ),
        SizedBox(
          child: (feed == null)
              ? Center(child: CupertinoActivityIndicator())
              : ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                var item = feed!.items![index];

                return NewsWidget(
                    title: item.title ?? '',
                    subtitle: item.description ?? '',
                    publishDate: item.pubDate.toString() ?? '',
                    author: item.source!.value ?? '',
                    link: item.link ?? '');
              }),
        ),
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ViewMore(
                      name: country,
                      getURL: uriString
                    ))
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: AppText(
                  text: "View More",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
