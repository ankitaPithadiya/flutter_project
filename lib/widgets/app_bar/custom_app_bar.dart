import 'package:flutter/material.dart';
import '../../core/app_export.dart';

enum Style { bgOutline_1, bgOutline, bgOutline_2, bgOutline_3 }

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 64.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 64.v,
      );

  _getStyle() {
    switch (styleType) {
      case Style.bgOutline_1:
        return Container(
          height: 56.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: appTheme.purple50,
                width: 1.h,
              ),
            ),
          ),
        );
      case Style.bgOutline:
        return Container(
          height: 64.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            border: Border(
              bottom: BorderSide(
                color: appTheme.purple50,
                width: 1.h,
              ),
            ),
          ),
        );
      case Style.bgOutline_2:
        return Container(
          height: 56.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            border: Border(
              bottom: BorderSide(
                color: appTheme.purple50,
                width: 1.h,
              ),
            ),
          ),
        );
      case Style.bgOutline_3:
        return Container(
          height: 64.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: appTheme.purple50,
                width: 1.h,
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
