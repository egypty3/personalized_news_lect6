import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_app/utils/appcolors.dart';
import 'package:the_app/widgets/apptext.dart';
import 'package:the_app/widgets/news_widget.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class HomeSectionTab extends StatefulWidget {
  final String topic;
  const HomeSectionTab({super.key, required this.topic});

  @override
  State<HomeSectionTab> createState() => _HomeSectionTabState();
}

class _HomeSectionTabState extends State<HomeSectionTab> {
  RssFeed? feed;

  Future<void> loadFeed() async {
    try {
      var response = await http.get(Uri.parse(
          "https://news.google.com/rss/headlines/section/topic/${widget.topic.toUpperCase()}?ceid=US:EN&hl=en&gl=US"));
      if (response.statusCode == 200) {
        // print(response.body);
        feed = RssFeed.parse(response.body);
      }
    } catch (e) {
      print('Error loading RSS feed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    loadFeed();

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AppText(
                text: widget.topic,
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
              : ListView.builder(itemBuilder: (context, index) {
                  var item = feed!.items![index];

                  return NewsWidget(
                      title: item.title ?? '',
                      subtitle: item.description ?? '',
                      publishDate: item.pubDate.toString() ?? '',
                      author: item.source!.value ?? '',
                      link: item.link ?? '');
                }),
        )
      ],
    );
  }
}
