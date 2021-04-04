import 'package:books_app/src/main_header.dart';
import 'package:books_app/src/menu.dart';
import 'package:flutter/material.dart';

class AppMainShell extends StatelessWidget {
  final Widget widget;
  final Widget customAppHeader;
  final bool isWrapWithScroll;

  AppMainShell({
    @required this.widget,
    this.customAppHeader,
    this.isWrapWithScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Menu(),
        appBar: (customAppHeader != null)
            ? customAppHeader
            : MainHeader(title: 'Books App'),
        body: SafeArea(
          child: (!isWrapWithScroll)
              ? Container(
                  child: widget,
                )
              : SingleChildScrollView(
                  child: widget,
                ),
        ));
  }
}
