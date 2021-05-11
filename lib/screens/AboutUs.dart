import 'package:beat_the_virus/utility/Size_Config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int currentPos = 0;
  List<String> titleLS = ['About Us', 'Privacy Policy', 'Terms of Service'];

  List<String> aboutUsLS = [
    'For Preventing Coronavirus and building Long term Health, Beat the Virus Startup through its 400+ Team Members offers Immunity and Health Solutions to Employees and their Families Globally.',
    'We do this by offering 15+ Categories of Immunity Products and Services.',
    'Our 400+ Team Members have several decades of Health, Execution and other complimentary aspect.'
  ];
  List<String> privacyPolicyLS = [
    "Your privacy is important to us. It is Beat The Virus Startup 's policy to respect your privacy regarding any information we may collect from you across our website, http://increaseimmunity.org, and other sites we own and operate.",
    'We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.',
    'We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorised access, disclosure, copying, use or modification.',
    'We don’t share any personally identifying information publicly or with third-parties, except when required to by law.',
    'Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.',
    'You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.',
    'Your continued use of our website will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.'
  ];
  List<List<String>> tcLS = [
    [
      '1.Terms',
      'By accessing the website at http://increaseimmunity.org, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this website are protected by applicable copyright and trademark law.'
    ],
    [
      '2.Use Licence',
      "Permission is granted to temporarily download one copy of the materials (information or software) on Beat The Virus Startup 's website for personal, non-commercial transitory viewing only. This is the grant of a licence, not a transfer of title, and under this licence you may not:modify or copy the materials;use the materials for any commercial purpose, or for any public display (commercial or non-commercial);attempt to decompile or reverse engineer any software contained on Beat The Virus Startup 's website;remove any copyright or other proprietary notations from the materials; or transfer the materials to another person or 'mirror' the materials on any other server.This licence shall automatically terminate if you violate any of these restrictions and may be terminated by Beat The Virus Startup at any time. Upon terminating your viewing of these materials or upon the termination of this licence, you must destroy any downloaded materials in your possession whether in electronic or printed format."
    ],
    [
      '3.Disclaimer',
      "The materials on Beat The Virus Startup 's website are provided on an 'as is' basis. Beat The Virus Startup makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.Further, Beat The Virus Startup does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to this site."
    ],
    [
      '4.Limitations',
      "In no event shall Beat The Virus Startup or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on Beat The Virus Startup 's website, even if Beat The Virus Startup or a Beat The Virus Startup authorised representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you."
    ],
    [
      '5.Accuracy of materials',
      "The materials appearing on Beat The Virus Startup 's website could include technical, typographical, or photographic errors. Beat The Virus Startup does not warrant that any of the materials on its website are accurate, complete or current. Beat The Virus Startup may make changes to the materials contained on its website at any time without notice. However Beat The Virus Startup does not make any commitment to update the materials."
    ],
    [
      '6.Links',
      "Beat The Virus Startup has not reviewed all of the sites linked to its website and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Beat The Virus Startup of the site. Use of any such linked website is at the user's own risk."
    ],
    [
      '7.Modifications',
      'Beat The Virus Startup may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service.'
    ],
    [
      '8.Governing Law',
      'These terms and conditions are governed by and construed in accordance with the laws of Maharashtra and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150))),
        ),
        Column(children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(titleLS[currentPos],
                style: GoogleFonts.poppins(
                    fontSize: SizeConfig.safeBlockHorizontal * 10)),
          )),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                      items: [
                        Container(
                          width: SizeConfig.screenWidth * 0.80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Center(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: aboutUsLS.length,
                                  itemBuilder: (ctx, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        aboutUsLS[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    5),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth * 0.80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: privacyPolicyLS.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      privacyPolicyLS[index],
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth * 0.80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: tcLS.length,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          tcLS[index][0],
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  5,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          tcLS[index][1],
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  5),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                      options: CarouselOptions(
                          initialPage: 0,
                          enlargeCenterPage: true,
                          height: SizeConfig.screenHeight * 0.60,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          })),
                  Container(
                    height: SizeConfig.safeBlockVertical * 5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPos == index
                                    ? Colors.blue
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ));
                        }),
                  )
                ],
              ))
        ]),
      ],
    );
  }
}
