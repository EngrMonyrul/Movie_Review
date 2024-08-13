import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      this.height,
      required this.useLeading,
      this.title,
      this.actions,
      this.bottom,
      this.leading,
      this.centerTitle,
      this.scrollUnderElevation});

  final double? height;
  final bool useLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? bottom;
  final Widget? leading;
  final bool? centerTitle;
  final bool? scrollUnderElevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: title,
      actions: actions,
      automaticallyImplyLeading: false,
      leading: leading ??
          (useLeading
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                )
              : null),
      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: bottom ?? const SizedBox(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (height ?? 0));
}
