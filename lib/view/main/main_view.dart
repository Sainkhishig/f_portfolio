import 'package:flutter/material.dart';
import 'package:afen_portfolio/view%20model/controller.dart';
import 'package:afen_portfolio/res/constants.dart';
import 'package:afen_portfolio/view/main/components/navigation_bar.dart';
import 'package:get/get.dart';
import '../../common/enum/common_enum.dart';
import '../../core/LocaleCont.dart';
import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatefulWidget {
  MainView({super.key, required this.pages});
  final List<Widget> pages;
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const HomePage(),
    //       ));
    // });
  }

//   @override

// class MainViewState extends StatelessWidget {
//   const MainViewState({super.key, required this.pages});
//   final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(
                    height: defaultPadding * 1.5,
                  )
                : const SizedBox(
                    height: defaultPadding / 1.5,
                  ),
            const SizedBox(
              height: 80,
              child: TopNavigationBar(),
            ),
            if (Responsive.isLargeMobile(context))
              Row(
                children: [
                  const Spacer(),
                  NavigationButtonList(
                    page: controller.page,
                  ),
                  const Spacer()
                ],
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [...widget.pages],
              ),
            )
          ],
        ),
      ),
    );
  }
}
