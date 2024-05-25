import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_plus/domain/rss_feed.dart';

import '../utils/appcolors.dart';
import '../widgets/apptext.dart';
import '../widgets/news_widget.dart';

class ViewMore extends StatefulWidget {
  final String name;
  final String getURL;

  const ViewMore({super.key, required this.name, required this.getURL});

  @override
  State<ViewMore> createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  RssFeed? feed;

  Future<void> loadFeed() async {
    try {
      var response = await http.get(Uri.parse(widget.getURL));
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
  void initState() {
    super.initState();
    loadFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryColor,
        title: AppText(
          text: widget.name,
          fontSize: 18,
          letterSpacing: 6,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SizedBox(
        child: (feed == null)
            ? Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: feed!.items!.length,
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
    );
  }
}
