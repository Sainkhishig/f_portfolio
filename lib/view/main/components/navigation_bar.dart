import 'package:afen_portfolio/view%20model/controller.dart';
import 'package:flutter/material.dart';
import 'package:afen_portfolio/view%20model/responsive.dart';
import 'package:afen_portfolio/view/intro/components/side_menu_button.dart';
import 'package:afen_portfolio/view/main/components/connect_button.dart';
import 'package:get/get.dart';
import '../../../common/enum/common_enum.dart';
import '../../../core/LocaleCont.dart';
import '../../../res/constants.dart';
import 'navigation_button.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Spacer(),
              Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset('assets/images/logo_SA_r.png')
                  // !Responsive.isLargeMobile(context)
                  //     ?
                  //     : MenuButton(
                  //         onTap: () => Scaffold.of(context).openDrawer(),
                  //       ),
                  ),
              // if(Responsive.isLargeMobile(context)) MenuButton(),
              const Spacer(
                flex: 2,
              ),
              if (!Responsive.isLargeMobile(context)) NavigationButtonList(),
              const Spacer(
                flex: 2,
              ),
              // const ConnectButton(),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...LocaleType.values.map((e) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ChoiceChip(
                            label: Text(e.label),
                            selectedShadowColor: Colors.cyan,
                            selected:
                                Get.find<LocaleCont>().locale.languageCode ==
                                    e.id,
                            selectedColor: Colors.teal,
                            backgroundColor: Colors.black,
                            onSelected: (bool selected) async {
                              Get.find<LocaleCont>()
                                  .updateLocale(Locale(e.id, e.label));
                              setState(() {});
                            },
                          ));
                    }).toList(),
                  ],
                );
              }),
              // const Spacer(),
            ],
          )),
    );
  }
}
