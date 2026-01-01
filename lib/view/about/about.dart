import 'package:flutter/material.dart';
import 'package:afen_portfolio/view%20model/responsive.dart';
// import 'package:afen_portfolio/view/intro/components/intro_body.dart';
import 'package:afen_portfolio/view/intro/components/side_menu_button.dart';
import 'package:afen_portfolio/view/intro/components/social_media_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_tracker/progress_tracker.dart';

class AboutPage extends StatefulWidget {
  AboutPage({super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
// class _AboutPageState extends StatelessWidget {
//   AboutPage({super.key});
  int index = 0;
  final List<Status> statuList = [
    Status(name: 'Interest', icon: Icons.interests_rounded),
    Status(name: 'Education', icon: FontAwesomeIcons.graduationCap),
    Status(name: 'Experience/Skills', icon: Icons.work),

    // Status(name: '', icon: Icons.local_shipping),
    // Status(name: 'Delivered', icon: Icons.check_circle),
  ];
  void nextButton() {
    setState(() {
      index++;
      statuList[index].active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.02,
          ),
          if (!Responsive.isLargeMobile(context)) const SocialMediaIconList(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.07,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.cyan,
                          ),
                        ),
                        child: Row(children: [
                          Expanded(
                              child: index == 0
                                  ? getInterestWidget()
                                  : index == 1
                                      ? getEducationWidget()
                                      : getSkillWidget()),
                          Image.asset(
                            'assets/images/profile-with-jobs.jpg',
                            // height: Responsive.isLargeMobile(context)
                            //     ? MediaQuery.sizeOf(context).width * 0.2
                            //     : Responsive.isTablet(context)
                            //         ? MediaQuery.sizeOf(context).width * 0.14
                            //         : 200,
                            // width: Responsive.isLargeMobile(context)
                            //     ? MediaQuery.sizeOf(context).width * 0.2
                            //     : Responsive.isTablet(context)
                            //         ? MediaQuery.sizeOf(context).width * 0.14
                            //         : 200,
                            fit: BoxFit.cover,
                          ),
                        ]))),
                ProgressTracker(
                  trackerAtStart: false,
                  currentIndex: index,
                  statusList: statuList,
                  activeColor: Colors.teal,
                  inActiveColor: Colors.cyan,
                  horizontalPadding: 16,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: index != statuList.length - 1 ? nextButton : null,
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getInterestWidget() {
    return ListView(
      children: const [
        ListTile(
            title: Text(
              "Full Name:",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("Sainkhishig Ariunaa",
                style: TextStyle(color: Colors.teal))),
        ListTile(
            title: Text(
              "Nationality:",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "MONGOLIA",
              style: TextStyle(color: Colors.teal),
            )),
        ListTile(
            title: Text(
              "Birthday/Gender:",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("1992-02-22/Female",
                style: TextStyle(color: Colors.teal))),
        ListTile(
            title: Text(
              "Residence:",
              style: TextStyle(color: Colors.white),
            ),
            subtitle:
                Text("SHIZUOKA, JAPAN", style: TextStyle(color: Colors.teal))),
        ListTile(
            title: Text(
              "Contact:",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("Email: ariariuka67@gmail.com",
                style: TextStyle(color: Colors.teal))),
        ListTile(
          title: Text(
            "Interest:",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.chess,
                        color: Colors.white,
                      )),
                  Text("Chess", style: TextStyle(color: Colors.teal))
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.guitar,
                        color: Colors.white,
                      )),
                  Text("Guitar", style: TextStyle(color: Colors.teal))
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.atom,
                        color: Colors.white,
                      )),
                  Text("Science", style: TextStyle(color: Colors.teal))
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.flight_takeoff,
                        color: Colors.white,
                      )),
                  Text("Travel", style: TextStyle(color: Colors.teal))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  getEducationWidget() {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title:
              const Text("Universities", style: TextStyle(color: Colors.white)),
          subtitle: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/logo-haais.png',
                  height: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 42,
                  width: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 42,
                  fit: BoxFit.cover,
                ),
                subtitle:
                    const Text("Bachelor in Maths and Software (2009-2013)"),
                title: const Text(
                    "Mongolian University of Life Sciences | Mongolia",
                    style: TextStyle(color: Colors.teal)),
              ),
              ListTile(
                leading: Image.asset(
                  'assets/images/tpsu-logo.jpeg',
                  height: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 42,
                  width: Responsive.isLargeMobile(context)
                      ? MediaQuery.sizeOf(context).width * 0.2
                      : Responsive.isTablet(context)
                          ? MediaQuery.sizeOf(context).width * 0.14
                          : 42,
                  fit: BoxFit.cover,
                ),
                title: const Text(
                  "Tomsk State Pedagogical University | Russia",
                  style: TextStyle(color: Colors.teal),
                ),
                subtitle: Text("Bachelor in Information System (2010-2013)"),
                trailing: Icon(FontAwesomeIcons.sun),
              ),
            ],
          ),
        ),
        const ListTile(
          // contentPadding: EdgeInsets.all(20),
          title: Text("Language Proficiency",
              style: TextStyle(color: Colors.white)),
          subtitle: Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      "Mongolian: ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("Native speaker", style: TextStyle(color: Colors.teal))
                  ]),
                  Row(children: [
                    Text("Japanese: ", style: TextStyle(color: Colors.white)),
                    Text("N2 (BJT J2)", style: TextStyle(color: Colors.teal))
                  ]),
                  Row(children: [
                    Text("English: ", style: TextStyle(color: Colors.white)),
                    Text("CEFR B2", style: TextStyle(color: Colors.teal))
                  ]),
                  Row(children: [
                    Text("Russian: ", style: TextStyle(color: Colors.white)),
                    Text("Upper Intermediate",
                        style: TextStyle(color: Colors.teal))
                  ])
                ],
              )),
        )
      ],
    );
  }

  getSkillWidget() {
    return ListView(
      children: [
        Text("Software Skills", style: TextStyle(color: Colors.white)),
        Padding(
          padding: EdgeInsets.only(right: 0),
          child: Row(
            children: [
              ...[
                "MS Office",
                "Adobe Photoshop",
                "Illustrator",
                "After Effects"
              ]
                  .map((e) => FilterChip(
                        label: Text("$e",
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                        pressElevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            side: BorderSide(color: Colors.grey.shade300)),
                        checkmarkColor: Colors.black54,
                        showCheckmark: false,
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey,
                        onSelected: (bool selected) {
                          setState(() {
                            // value = selected ? dataSource![i].key : "";
                          });

                          // onChangeValue!(value);
                        },
                      ))
                  .toList()
            ],
          ),
        ),
        const Text("Professional Skills",
            style: TextStyle(color: Colors.white)),
        ExpansionTile(
            title: const Text(
              "Operating Systems",
              style: TextStyle(color: Colors.white),
            ),
            textColor: Colors.teal,
            // collapsedTextColor: Colors.teal,
            children: [
              Row(
                  children: ["Windows", "MAC" "Linux", "Ubuntu"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList())
            ]),
        ExpansionTile(
            title: const Text(
              "Databases",
              style: TextStyle(color: Colors.white),
            ),
            children: [
              Row(
                  children: [
                "SQL",
                "MySQL",
                "SQLite",
                "AWS RDS",
                "Firebase Realtime Database (RTDB)",
                "Oracle",
              ]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList())
            ]),
        ExpansionTile(
          title: const Text(
            "Front-End Development",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            ListTile(
              title: const Text("Languages & Core:",
                  style: TextStyle(
                    color: Colors.white,
                  )), //Frameworks & Libraries: React.js, Vue.js, Flutter
              subtitle: Row(
                  children: ["HTML", "CSS", "JavaScript", "TypeScript", "Dart"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            ),
            ListTile(
              title: Text("Frameworks & Libraries:",
                  style: const TextStyle(
                    color: Colors.white,
                  )), //Fra:
              subtitle: Row(
                  children: ["React.js", "Vue.js", "Flutter"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            )
          ],
        ),
        ExpansionTile(
          title: const Text(
            "Back-End Development",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            ListTile(
              title: const Text("Languages & Core:",
                  style: TextStyle(
                    color: Colors.white,
                  )), //Frameworks & Libraries: React.js, Vue.js, Flutter
              subtitle: Row(
                  children: [
                "Java (Spring Boot, JSP, Java Native)",
                "C# (ASP.NET, .NET)",
                "Node.js (JavaScript & TypeScript)",
              ]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            ),
            ListTile(
              title: Text("APIs & Services:",
                  style: const TextStyle(
                    color: Colors.white,
                  )), //Fra:
              subtitle: Row(
                  children: ["GraphQL", "SOAP API"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            ),
            ListTile(
              title: const Text("Application Servers:",
                  style: TextStyle(
                    color: Colors.white,
                  )), //Fra:
              subtitle: Row(
                  children: ["JBoss", "WAS"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            )
          ],
        ),
// Cloud Technologies
        ExpansionTile(
          title: const Text(
            "Cloud Technologies",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            ListTile(
              title: const Text("AWS:",
                  style: TextStyle(
                    color: Colors.white,
                  )), //Frameworks & Libraries: React.js, Vue.js, Flutter
              subtitle: Row(
                  children: [
                "EC2",
                "RDS",
                "Lambda",
                "API Gateway",
              ]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            ),
            ListTile(
              title: Text("Firebase:",
                  style: const TextStyle(
                    color: Colors.white,
                  )), //Fra:
              subtitle: Row(
                  children: ["Authentication", "RDS", "Hosting", "Functions"]
                      .map((e) => FilterChip(
                            label: Text("$e",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                side: BorderSide(color: Colors.grey.shade300)),
                            onSelected: (bool selected) {},
                          ))
                      .toList()),
            ),
          ],
        ),

        // DevOps
        ExpansionTile(
          title: const Text(
            "DevOps & CI/CD Tools",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            Row(
                children: [
              "Jenkins",
              "GitHub Actions",
              "GitLab CI/CD",
            ]
                    .map((e) => FilterChip(
                          label: Text("$e",
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                              side: BorderSide(color: Colors.grey.shade300)),
                          onSelected: (bool selected) {},
                        ))
                    .toList()),
          ],
        ),

        // DevOps
        ExpansionTile(
          title: const Text(
            "Integration & Others",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            Row(
                children: [
              "OTA integration(Booking, Jaran, etc)",
              "Payment(Stripe)",
              "REST API",
              "SOAP",
              "ERP & POS systems",
            ]
                    .map((e) => FilterChip(
                          label: Text("$e",
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                              side: BorderSide(color: Colors.grey.shade300)),
                          onSelected: (bool selected) {},
                        ))
                    .toList()),
          ],
        ),
        // DevOps
        ExpansionTile(
          title: const Text(
            "Additional Skills",
            style: TextStyle(color: Colors.white),
          ),
          children: [
            Text("""● Strong communication and client interaction skills,
              ● Team leadership and project organisation,
              ● Research and analytical skills,
              ● Fast learner of new technologies""")
          ],
        ),
      ],
    );
  }
}
