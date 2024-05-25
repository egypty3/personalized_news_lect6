import 'package:flutter/material.dart';
import 'package:the_app/utils/onboarding_utils/topics.dart';
import 'package:the_app/widgets/subwidgets/home_section_country.dart';

import '../utils/appcolors.dart';
import '../widgets/apptext.dart';
import '../widgets/capsule_widget.dart';
import '../widgets/subwidgets/home_section_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex = 0;
  String tabName = "World";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const Text(""),
        backgroundColor: AppColors.primaryColor,
        title: const AppText(
          text: "H I G H L I G H T S",
          fontSize: 18,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                color: AppColors.blackColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .98,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topicList.length,
                  itemBuilder: (context, index) {
                    return CapsuleWidget(
                      name: topicList[index].value,
                      border: AppColors.primaryColor,
                      background: _selectedItemIndex == index
                          ? AppColors.primaryColor.withOpacity(0.8)
                          : Colors.white,
                      currentIndex: index,
                      onTabIndex: (int index) {
                        setState(() {
                          if (_selectedItemIndex == index)
                            {
                              _selectedItemIndex = -1; // Deselect if tapped again
                            }else {
                            _selectedItemIndex = index;
                          }
                        });
                      },
                      onTapCallback: (String namedTaped){
                        print(namedTaped);
                        setState(() {
                          tabName = namedTaped;
                        });
                      },
                    );
                  }),
            ),
            HomeSectionTab(topic: tabName),
            HomeSectionCountry(),
          ],
        ),
      ),
    );
  }
}

