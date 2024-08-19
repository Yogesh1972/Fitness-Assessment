import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_assign/Components/Appointment.dart';
import 'package:fitness_assign/Components/AssessmentList.dart';
import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:fitness_assign/Components/DailyChallenges.dart';
import 'package:fitness_assign/Components/WorkOutList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

enum Segment {
  My_Assessments,
  My_Appointments,
}

extension SegmentsExtension on Segment {
  String get label {
    switch (this) {
      case Segment.My_Assessments:
        return 'My_Assessments';
      case Segment.My_Appointments:
        return 'My_Appointments';
      default:
        return 'Unrecognized';
    }
  }

  bool get isAppointments => this == Segment.My_Appointments;

  bool get isAssessment => this == Segment.My_Assessments;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic _selectedButton = ValueNotifier('My_Assessment');
  final ref = FirebaseDatabase.instance.ref('Home/Name');

  Widget _button() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF1F1F9),
      ),
      child: AdvancedSegment(
        sliderOffset: 5,
        sliderDecoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        sliderColor: Colors.white,
        backgroundColor: const Color(0xffF1F1F9),
        segments: {
          'My_Assessment': 'My Assessment',
          'My_Appointment': 'My Appointment',
        },
        activeStyle: const TextStyle(
          color: Color(0xff255FD5),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        inactiveStyle: const TextStyle(
          color: Color(0xff6b6b6b),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        controller: _selectedButton,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<DataSnapshot>(
                  future: ref.get(), // Fetch the data once
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          height: size.height * 0.04,
                          width: size.height * 0.04,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade300,
                            child: Container(
                              height: size.height * 0.04,
                              width: size.height * 0.04,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          )); // Show a loading indicator while fetching data
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Handle errors
                    } else if (snapshot.hasData &&
                        snapshot.data!.value != null) {
                      String name =
                          snapshot.data!.value as String; // Extract the name
                      return Text(
                        'Hello $name',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF255FD5),
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text(
                          'Name not found'); // Handle case when the data is null
                    }
                  },
                ),
                Container(
                  height: size.height * 0.04,
                  width: size.height * 0.04,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff595959),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff595959),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: _button(),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            height: size.height * 0.38,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
            decoration: BoxDecoration(
              color: const Color(0xffF1F1F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ValueListenableBuilder<String>(
                  builder: (_, key, __) {
                    switch (key) {
                      case 'My_Assessment':
                        return Flexible(child: AssessmentList());
                      case 'My_Appointment':
                        return Flexible(child: AppointmentList());
                      default:
                        return Flexible(child: AssessmentList());
                    }
                  },
                  valueListenable: _selectedButton,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: size.height * 0.03,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xff232F58),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.085),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Challenges',
                  style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff232F58),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: DailyChallengeCard(),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.085),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Workout Routine',
                  style: TextStyle(
                    color: Color(0xff303030),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      const Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Container(
                        height: size.height * 0.03,
                        width: size.height * 0.03,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff232F58),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: WorkOutList(),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
