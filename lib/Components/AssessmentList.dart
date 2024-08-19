import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:fitness_assign/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AssessmentList extends StatefulWidget {
  const AssessmentList({super.key});

  @override
  State<AssessmentList> createState() => _AssessmentListState();
}

class _AssessmentListState extends State<AssessmentList> {
  final ref = FirebaseDatabase.instance.ref('Home/Assessment');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FirebaseAnimatedList(
        query: ref,
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: size.height * 0.15,
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Container(
                    width: size.width * 0.38,
                    decoration: BoxDecoration(
                      gradient: index % 2 == 0
                          ? RadialGradient(
                              center: Alignment(-0.5, -0.5),
                              radius: 0.9,
                              colors: [
                                Color(0xffDABE5D).withOpacity(0.5),
                                Color(0xffE36731).withOpacity(0.5),
                              ],
                            )
                          : RadialGradient(
                              center: Alignment(-0.5, -0.5),
                              radius: 0.9,
                              colors: [
                                Color(0xff91B655).withOpacity(0.5),
                                Color(0xff69F5BB).withOpacity(0.5),
                              ],
                            ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        bottomLeft: Radius.circular(17),
                      ),
                    ),
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "A",
                      child: CachedImage(
                        fit: BoxFit.cover,
                        snapshot.child('imageUrl').value.toString(),
                        (p0, p1) {
                          return Image(
                            image: p1,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: size.width * 0.42,
                          child: Text(
                            snapshot.child('Heading').value.toString(),
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff222E58)),
                          ),
                        ),
                        Container(
                          width: size.width * 0.33,
                          child: Text(
                            snapshot.child('data').value.toString(),
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff2A2A2A)),
                          ),
                        ),
                      ],
                    ),
                    snapshot.child('Heading').value.toString().length < 20
                        ? SizedBox(
                            height: 10,
                          )
                        : Container(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.healthAssessmentScreen);
                      },
                      child: Container(
                        height: size.height * 0.035,
                        width: size.width * 0.33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 22.41,
                              width: 22.41,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff255FD5),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Start',
                              style: TextStyle(
                                color: Color(0xff255FD5),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        defaultChild: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, index) {
            return SizedBox(
              height: size.height * 0.15,
              width: size.width,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: size.height * 0.15,
                  width: size.width,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            );
          },
          itemCount: 2,
        ));
  }
}
