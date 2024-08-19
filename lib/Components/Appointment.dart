import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitness_assign/Components/CacheImages.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final re = FirebaseDatabase.instance.ref('Home/AppointmentHeading');

  String image(String num) {
    String ans = "";
    switch (num) {
      case "0":
        ans = "Assests/Images/fi_6668816.png";
        break;
      case "1":
        ans = "Assests/Images/Vector.png";
        break;
      case "2":
        ans = "Assests/Images/Vector (1).png";
        break;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: re.onValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.builder(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.height * 0.01,
                mainAxisSpacing: size.height * 0.01,
                mainAxisExtent: size.height * 0.155,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
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
              });
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        dynamic values = snapshot.data!.snapshot.value as dynamic;
        print(values);
        Color hexToColor(String hexColor) {
          hexColor = hexColor.replaceAll('#', '');
          if (hexColor.length == 6) {
            hexColor = 'FF$hexColor';
          }
          return Color(int.parse(hexColor, radix: 16));
        }

        return GridView.builder(
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          itemCount: 3,
          addSemanticIndexes: true,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: size.height * 0.01,
            mainAxisSpacing: size.height * 0.01,
            mainAxisExtent: size.height * 0.155,
          ),
          itemBuilder: (context, index) {
            return Container(
              height: size.height * 0.1,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                  color: hexToColor(values[index]['Color'].toString()),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.07,
                      width: size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Color(
                          0xffffffff,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        child: Image.asset(
                          height: size.height * 0.05,
                          width: size.height * 0.05,
                          "${image(values[index]['imageUrl'].toString())}",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: size.width * 0.3,
                      child: AutoSizeText(
                        "${values[index]['Heading'].toString()}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff222E58)),
                      ),
                    )
                  ]),
            );
          },
        );
      },
    );
  }
}
