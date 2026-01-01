import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../../view model/responsive.dart';
import 'certificates_details.dart';

class CertificateGrid extends StatefulWidget {
  CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final int crossAxisCount;
  final double ratio;
  @override
  State<CertificateGrid> createState() => _CertificateGridState();
}

class _CertificateGridState extends State<CertificateGrid> {
// class CertificateGrid extends StatelessWidget {
//   final int crossAxisCount;
//   final double ratio;
//   CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  final controller = Get.put(CertificationController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.black,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Image.asset(
        //     'assets/images/ari-with-tree.jpg',
        //     height: Responsive.isLargeMobile(context)
        //         ? MediaQuery.sizeOf(context).width * 0.2
        //         : Responsive.isTablet(context)
        //             ? MediaQuery.sizeOf(context).width * 0.14
        //             : 200,
        //     width: Responsive.isLargeMobile(context)
        //         ? MediaQuery.sizeOf(context).width * 0.2
        //         : Responsive.isTablet(context)
        //             ? MediaQuery.sizeOf(context).width * 0.14
        //             : 200,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // Image.asset(
        //   'assets/images/profile-with-jobs.jpg',
        //   // height: Responsive.isLargeMobile(context)
        //   //     ? MediaQuery.sizeOf(context).width * 0.2
        //   //     : Responsive.isTablet(context)
        //   //         ? MediaQuery.sizeOf(context).width * 0.14
        //   //         : 200,
        //   // width: Responsive.isLargeMobile(context)
        //   //     ? MediaQuery.sizeOf(context).width * 0.2
        //   //     : Responsive.isTablet(context)
        //   //         ? MediaQuery.sizeOf(context).width * 0.14
        //   //         : 200,
        //   fit: BoxFit.cover,
        // ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: certificateList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                childAspectRatio: widget.ratio),
            itemBuilder: (context, index) {
              return Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(
                      vertical: defaultPadding, horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Colors.lime,
                        Colors.teal,
                      ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal,
                          offset: const Offset(-2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                        BoxShadow(
                          color: Colors.cyan,
                          offset: const Offset(2, 0),
                          blurRadius: controller.hovers[index] ? 20 : 10,
                        ),
                      ]),
                  child: CertificateStack(index: index)));
            },
          ),
        )
      ],
    );
  }
}
