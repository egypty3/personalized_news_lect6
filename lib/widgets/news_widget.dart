import 'package:flutter/material.dart';
import 'package:the_app/utils/appcolors.dart';
import 'package:the_app/widgets/apptext.dart';
import 'package:the_app/widgets/expanded_button_widget.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String publishDate;
  final String author;
  final String link;

  const NewsWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.publishDate,
      required this.author,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppText(
              text: title,
              fontSize: 16,
              color: Colors.black,
              maxlines: 4,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: publishDate,
                      fontSize: 12,
                      color: AppColors.blackColor.withOpacity(.5),
                    ),
                    Row(
                      children: [
                        AppText(
                          text: 'By ',
                          fontSize: 12,
                          color: AppColors.blackColor.withOpacity(.5),
                        ),
                        AppText(
                          text: author,
                          fontSize: 12,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                      onPressed: () {},
                      child: const AppText(
                        text: "VISIT",
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      )),
                ),

                // ExpandedButton(
                //     child: AppText(
                //       text: "VISIT",
                //       letterSpacing: 3,
                //     ),
                //     buttonColor: AppColors.primaryColor,
                //     onPressed: () {})
              ],
            ),
            SizedBox(height: 10,),
            Divider( )
          ],
        ),
      ),
    );
  }
}
