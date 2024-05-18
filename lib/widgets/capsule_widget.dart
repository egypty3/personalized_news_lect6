import 'package:flutter/material.dart';
import 'package:the_app/utils/appcolors.dart';
import 'package:the_app/widgets/apptext.dart';

class CapsuleWidget extends StatefulWidget {
  final String name;
  final Color border;
  final Color background;
  final  Function(String)? onTapCallback;
  final int currentIndex;
  final ValueChanged<int>? onTabIndex;

  const CapsuleWidget({super.key,
    required this.name,
    required this.border,
    required this.background,
    this.onTapCallback,
    required this.currentIndex,
    this.onTabIndex});

  @override
  State<CapsuleWidget> createState() => _CapsuleWidgetState();
}

class _CapsuleWidgetState extends State<CapsuleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20,left: 10),
      child: GestureDetector(
        onTap: () {
          if ( widget.currentIndex != null && widget.onTabIndex != null){
            widget.onTabIndex!(widget.currentIndex);
          }
          widget.onTapCallback!(widget.name);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(25),
            border:  Border.all(
              color: widget.border,
              width: 1
            )
          ),
          child: Center(
            child: AppText(
              text: widget.name,
            fontSize: 16.0,
            color: AppColors.blackColor,
            overflow: TextOverflow.ellipsis,),
          ),
        ),
      ),
    );
  }
}
