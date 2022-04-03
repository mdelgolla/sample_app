import 'package:flutter/material.dart';
import 'package:sample_app/styles/app_colors.dart';
import 'package:sample_app/styles/app_text_styles.dart';
class AppPageLayout extends StatefulWidget {
  final VoidCallback? onBackPressed;
  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? bottomWidget;

  const AppPageLayout(
      {Key? key,
      this.onBackPressed,
      this.title,
      this.body,
      this.actions,
      this.bottomWidget})
      : super(key: key);

  @override
  _AppPageLayoutState createState() => _AppPageLayoutState();
}

class _AppPageLayoutState extends State<AppPageLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: widget.onBackPressed != null
                  ? IconButton(
                      onPressed: widget.onBackPressed,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    )
                  : Container(),
              actions: widget.actions,
              // backgroundColor: Colors.white,
              bottomOpacity: 0.0,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.title??"",style: Theme.of(context).textTheme.titleTextStyle,),
                    const SizedBox(height: 16,),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundColor
                        ),
                        child: widget.body??Container() ,
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: widget.bottomWidget ?? Container(),
          ),
        ),
      ],
    );
  }
}
