import 'package:flutter/material.dart';
import 'package:the_app/utils/appconstants.dart';
import 'package:the_app/utils/helper/data_functions.dart';
import 'package:the_app/utils/onboarding_utils/countryCodes.dart';
import 'package:the_app/utils/onboarding_utils/languages.dart';
import 'package:the_app/widgets/apptext.dart';
import 'package:the_app/widgets/expanded_button_widget.dart';

import '../utils/appcolors.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  DataHandler dataHandler = DataHandler();

  String name = '';
  String? gender ;
  CountryCodes? selectedCountry;
  Language? selectedLanguage;

  final List<String> genders = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {

    // var Iterable = languages.map((Language language) {
    //   return DropdownMenuItem(
    //       value: language,
    //       child: AppText(
    //         text: language.name,
    //         color: AppColors.blackColor,
    //       ));
    // });
    //
    // var IterableAfterFilteration = Iterable.where((element) =>
    //           element.value!.name!.startsWith('a'));
    //
    // var IterableAfterGettingTop3 = IterableAfterFilteration.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: const Text(""),
        backgroundColor: AppColors.primaryColor,
        title: const AppText(
          text: "O n b o a r d i n g",
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: AppColors.blackColor),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.blackColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor))),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: "Gender",
              fontSize: 12,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(color: AppColors.blackColor.withOpacity(0.7)),
              ),
              child: DropdownButton(
                value:gender,
                items: genders.map((value) {
                  return DropdownMenuItem(
                      value: value,
                      child: AppText(
                        text: value,
                        color: AppColors.blackColor,
                      ));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    gender = newValue;
                  });
                },
                underline: Container(),
                icon: Icon(Icons.arrow_drop_down,color: AppColors.blackColor,),
                elevation: 8,
                isExpanded: true,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: "Country",
              fontSize: 12,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border:
                Border.all(color: AppColors.blackColor.withOpacity(0.7)),
              ),
              child: DropdownButton(
                value:selectedCountry,
                items: countries.map((CountryCodes country) {
                  return DropdownMenuItem(
                      value: country,
                      child: AppText(
                        text: country.name,
                        color: AppColors.blackColor,
                      ));
                }).toList(),
                onChanged: (CountryCodes? newValue) {
                  setState(() {
                    selectedCountry = newValue!;
                  });
                },
                underline: Container(),
                icon: Icon(Icons.arrow_drop_down,color: AppColors.blackColor,),
                elevation: 8,
                isExpanded: true,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: "Language",
              fontSize: 12,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border:
                Border.all(color: AppColors.blackColor.withOpacity(0.7)),
              ),
              child: DropdownButton(
                value:selectedLanguage,
                items: languages.map((Language language) {
                  return DropdownMenuItem(
                      value: language,
                      child: AppText(
                        text: language.name,
                        color: AppColors.blackColor,
                      ));
                }). toList(),
                onChanged: (Language? newValue) {
                  setState(() {
                    selectedLanguage = newValue!;
                  });
                },
                underline: Container(),
                icon: Icon(Icons.arrow_drop_down,color: AppColors.blackColor,),
                elevation: 8,
                isExpanded: true,
                dropdownColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ExpandedButton(
              buttonColor: AppColors.primaryColor,
              onPressed: () async {

                print('Button Pressed');
                print(name);
                print(gender);
                print(selectedCountry!.name);
                print(selectedLanguage!.code);

                await dataHandler.setStringValue(AppConstants.userName, name);
                await dataHandler.setStringValue(AppConstants.genderValue, gender.toString());

                await dataHandler.setStringValue(AppConstants.countryCode, selectedCountry!.code);
                await dataHandler.setStringValue(AppConstants.countryName, selectedCountry!.name);

                await dataHandler.setStringValue(AppConstants.langCode, selectedLanguage!.code);
                await dataHandler.setStringValue(AppConstants.langName, selectedLanguage!.name);

                await dataHandler.setStringValue(AppConstants.doneOnboarding, "YES");

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: AppText(
              text: "Submit Data",
              fontSize: 18,
              color: AppColors.blackColor,
            ),),
          ],
        ),
      ),
    );

  }
}
