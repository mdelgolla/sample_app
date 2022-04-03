import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/styles/app_text_styles.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonLabel;
  final double? width;
  final double height;
  final bool disabled;
  final  TextStyle? labelTextStyle;
  final List<Color>? btnColor;

  const CommonButton(
      {Key? key,
        this.onPressed,
        this.buttonLabel,
        this.width,
        this.height=45,
        this.btnColor,
        this.disabled=false,
        this.labelTextStyle,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              side: const BorderSide(width: 1,color: AppColors.kPrimaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7))),
          child: Ink(
            decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(7)),
            child: Container(
              width: width?? MediaQuery.of(context).size.width*0.8,
              height: height,
              alignment: Alignment.center,
              child: Text(
                buttonLabel!,
                style: labelTextStyle??Theme.of(context).textTheme.btnTextStyle,
              ),
            ),
          )),
    );
  }
}