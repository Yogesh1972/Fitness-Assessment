import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:flutter/material.dart';

class WorkOutList extends StatefulWidget {
  const WorkOutList({super.key});

  @override
  State<WorkOutList> createState() => _WorkOutListState();
}

class _WorkOutListState extends State<WorkOutList> {
  final ref = FirebaseDatabase.instance.ref('Home/Workout');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FirebaseAnimatedList(
      padding:
          EdgeInsets.only(left: size.width * 0.03, right: size.width * 0.03),
      query: ref,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, snapshot, animation, index) {
        return Container(
          height: size.height * 0.05,
          width: size.width * 0.65,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff232F58),
              width: 0.5,
            ),
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
                  height: size.height * 0.5,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: const Color(0xffFCE2BC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      bottomLeft: Radius.circular(17),
                    ),
                  ),
                  child: CachedImage(
                    snapshot.child('imageUrl').value.toString(),
                    (p0, p1) {
                      return Image(
                        image: p1,
                        fit: BoxFit.fitHeight,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.child('Heading').value.toString(),
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    margin: EdgeInsets.zero,
                    child: Text(
                      snapshot.child('Type').value.toString(),
                      style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.005),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffCDCDCD),
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      snapshot.child('purpose').value.toString(),
                      style: TextStyle(
                        color: Color(0xff255FD5),
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        "Difficulty: ",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        snapshot.child('Difficulty').value.toString(),
                        style: TextStyle(
                          color: Color(0xffFF88A5),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
