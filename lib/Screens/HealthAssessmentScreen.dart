import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:flutter/material.dart';

class HealthAssessmentScreen extends StatefulWidget {
  const HealthAssessmentScreen({super.key});

  @override
  State<HealthAssessmentScreen> createState() => _HealthAssessmentScreenState();
}

class _HealthAssessmentScreenState extends State<HealthAssessmentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: "A",
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.36,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 1,
                      center: const Alignment(0, 0.9),
                      colors: [
                        const Color(0xff91B655).withOpacity(0.5),
                        const Color(0xff69F5BB).withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.04, right: size.width * 0.04),
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.06),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Color(0xff3A3937),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              const Text(
                                "Health Risk Assessment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff222E58),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: size.width * 0.07),
                                  Container(
                                    width: size.width * 0.17,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "Assests/Images/stopwatch.png",
                                          color: const Color(0xff222E58),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          "4 min",
                                          style: TextStyle(
                                              color: Color(0xff222E58),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.4,
                          height: size.height * 0.36,
                          child: CachedImage(
                            fit: BoxFit.cover,
                            "https://s3-alpha-sig.figma.com/img/16a8/7631/c89fe67d48b96af237059fad956b91cd?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hOp0BAbGgm4wTBE2zvYBClp1WOaGobGg91BRu7DD83zFIU~R3EZZj~coER-cEN54R~vHG3XA8aig5EJhRB7KLyoopFZzuWA4xxe53Hr19A71qvBhPLvJkelO8H9xzJOfuEF3DWM90SKqnDwPsoHjTlxXQIz8mripSGlfGoKsJxdWabNX~AeCHGCMHbFhulTIL0ywmyilihagYzRl5WFvUUnBN~Rh996PDkWjzX4fJbYbt~C2DDc31hW6L~QwPJ7beflUziBMNpo63eE3iPzDUtQK0FHYDFUs0NcITBhutxVlWafFvD74eNd0vvndpXf3IeZ9QwRLU77ISFQs2dfrLQ__",
                            (p0, p1) {
                              return Image(
                                image: p1,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              IgnorePointer(
                child: Container(
                  height: size.height * 0.31,
                  color: Colors.transparent,
                ),
              ),
              Container(
                height: size.height * 0.68,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "What do you get ?",
                            style: TextStyle(
                                color: Color(0xff222E58),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: size.height * 0.085,
                                height: size.height * 0.085,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                    color: Color(0xffE8E9ED),
                                    width: 2.0,
                                  ),
                                ),
                                child:
                                    Image.asset("Assests/Images/fi_245305.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.height * 0.061,
                                child: Text(
                                  "Key Body Vitals",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.height * 0.085,
                                height: size.height * 0.085,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                    color: Color(0xffE8E9ED),
                                    width: 2.0,
                                  ),
                                ),
                                child: Image.asset(
                                    "Assests/Images/fi_5718253.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.height * 0.061,
                                child: Text(
                                  "Posture Analysis",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.height * 0.085,
                                height: size.height * 0.085,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                    color: Color(0xffE8E9ED),
                                    width: 2.0,
                                  ),
                                ),
                                child: Image.asset(
                                    "Assests/Images/fi_3663902.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.height * 0.061,
                                child: Text(
                                  "Body Composition",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff303030),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.height * 0.085,
                                height: size.height * 0.085,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                    color: Color(0xffE8E9ED),
                                    width: 2.0,
                                  ),
                                ),
                                child: Image.asset(
                                    "Assests/Images/fi_2570993.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.height * 0.061,
                                child: Text(
                                  "Body Composition",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff303030),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: size.height * 0.05),
                                child: Text(
                                  "How do we do it ?",
                                  style: TextStyle(
                                      color: Color(0xff222E58),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Transform.rotate(
                                angle: 0.2,
                                child: Container(
                                  height: size.height * 0.2,
                                  child: Image.asset(
                                      "Assests/Images/Group 1171275252.png"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.11,
                              ),
                              Container(
                                width: size.width * 0.9,
                                height: size.height * 0.363,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAFCFF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xffE8E9ED),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.15,
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.05,
                                            vertical: size.height * 0.01),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff00BF4D)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "Assests/Images/ic_outline-security.png",
                                              height: 10,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "We do not store or share your personal data",
                                              style: TextStyle(
                                                color: Color(0xff707070),
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.02,
                                            vertical: 2),
                                        child: Text(
                                          "1. Ensure that you are in a well-lit space",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02,
                                        ),
                                        child: Text(
                                          "2. Allow camera access and place your device",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.only(
                                          left: size.width * 0.02,
                                          right: size.width * 0.02,
                                          bottom: 2,
                                        ),
                                        child: Text(
                                          "   against a stable object or wall",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.02,
                                            vertical: 2),
                                        child: Text(
                                          "3. Avoiding wearing baggy clothes",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.02,
                                        ),
                                        child: Text(
                                          "4. Make sure you exercise as per the instruction ",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.8,
                                        padding: EdgeInsets.only(
                                          left: size.width * 0.02,
                                          right: size.width * 0.02,
                                          bottom: 2,
                                        ),
                                        child: Text(
                                          "   provided by the trainer",
                                          style: TextStyle(
                                            color: Color(0xff222E58),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            top: size.height * 0.075,
                            right: size.width * 0.065,
                            child: Stack(children: [
                              Container(
                                width: size.width * 0.65,
                                child: Image.asset(
                                    "Assests/Images/Untitled-1 3.png"),
                              ),
                              Positioned(
                                bottom: size.height * 0.016,
                                right: size.width * 0.075,
                                child: Container(
                                  width: size.width * 0.7,
                                  child: Image.asset(
                                      "Assests/Images/Vector 999.png"),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.025,
                                right: size.width * 0.165,
                                child: Container(
                                  width: size.width * 0.45,
                                  child: Image.asset(
                                      "Assests/Images/Vector 1000.png"),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.0245,
                                right: size.width * 0.28,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.082,
                                right: size.width * 0.29,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.134,
                                right: size.width * 0.295,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.053,
                                left: size.width * 0.215,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.115,
                                left: size.width * 0.275,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.096,
                                left: size.width * 0.172,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.085,
                                left: size.width * 0.145,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.0925,
                                left: size.width * 0.06,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.087,
                                right: size.width * 0.2165,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.05,
                                right: size.width * 0.212,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.041,
                                right: size.width * 0.225,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.034,
                                right: size.width * 0.177,
                                child: CircleAvatar(
                                  radius: size.width * 0.008,
                                  backgroundColor: Color(0xffffffff),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
