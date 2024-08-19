import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DailyChallengeCard extends StatefulWidget {
  const DailyChallengeCard({super.key});

  @override
  State<DailyChallengeCard> createState() => _DailyChallengeCardState();
}

class _DailyChallengeCardState extends State<DailyChallengeCard> {
  final ref = FirebaseDatabase.instance.ref('Home/DailyChallenge');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: ref.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          Map<dynamic, dynamic> values =
              snapshot.data!.snapshot.value as dynamic;
          print(values);

          int? challengeNumber = int.tryParse(values['streak'].toString());
          print(challengeNumber);
          double percent =
              (challengeNumber != null) ? challengeNumber / 20 : 0.0;
          return Container(
              height: size.height * 0.16,
              width: size.width,
              padding: EdgeInsets.only(left: size.width * 0.05),
              decoration: BoxDecoration(
                color: const Color(0xffC1EAD1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Today\'s Challenge!',
                        style: TextStyle(
                          color: Color(0xff2B7A71),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: size.height * 0.025,
                        width: size.width * 0.23,
                        decoration: BoxDecoration(
                          color: const Color(0xff2B7A71),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            values['challenge'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        width: size.width * 0.4,
                        animation: true,
                        alignment: MainAxisAlignment.start,
                        padding: EdgeInsets.zero,
                        lineHeight: 9,
                        animationDuration: 2500,
                        percent: percent,
                        backgroundColor: Color(0xffffffff),
                        barRadius: const Radius.circular(10),
                        progressColor: const Color(0xffff88a5),
                      ),
                      Row(
                        children: [
                          Text(
                            '${values['streak'].toString()}/20',
                            style: const TextStyle(
                              color: Color(0xff323232),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Completed',
                            style: const TextStyle(
                              color: Color(0xff323232),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.035,
                        width: size.width * 0.28,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size.height * 0.023,
                              width: size.height * 0.023,
                              margin: const EdgeInsets.only(left: 5),
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
                              'Continue',
                              style: TextStyle(
                                color: Color(0xff255FD5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Transform.flip(
                    flipX: true,
                    child: Image.network(
                      height: size.height * 0.2,
                      width: size.width * 0.45,
                      values['imageUrl'].toString(),
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  // Image.asset(
                  //   'Assests/Images/image 53.png',

                  // )
                ],
              ));
        });
  }
}
