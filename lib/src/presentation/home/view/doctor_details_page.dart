import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/src/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/model/doctor_list_model.dart';
import '../../../utils/common_widgets.dart';

class DoctorDetailPage extends StatelessWidget {
  DoctorList doctor;

  DoctorDetailPage({Key? key, required this.doctor}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var heights = MediaQuery.of(context).size.height;
    var widths = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      //  appBar: AppBar(),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 90),
                  height: heights,
                  width: widths,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      textCustom("${doctor.firstName} ${doctor.firstName}",
                          fontSize: 25, fontWeight: FontWeight.w900),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: widths / 3,
                        padding: EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                          child: textCustom('EDIT PROFILE',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ).onTap(() {
                        _displaySnackBar(context);
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // height: heights,
                        width: widths,
                        color: Colors.grey.shade100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: textCustom("PERSONAL DETAILS",
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                            nameCart("First Name", " ${doctor.firstName}"),
                            nameCart("Last Name", "${doctor.lastName}"),
                            nameCart("gender", "${""}"),
                            nameCart(
                                "contant number", "${doctor.primaryContactNo}"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 12),
                              child: textCustom("DATE OF BIRTH",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                iconCart(Icons.calendar_today, "today", "28",
                                    widths),
                                iconCart(Icons.calendar_today, "month", "June",
                                    widths),
                                iconCart(Icons.calendar_today, "year", "1985",
                                    widths),
                                iconCart(Icons.calendar_today, "blood group",
                                    "", widths),
                                iconCart(
                                    Icons.calendar_today, "height", "", widths),
                                iconCart(
                                    Icons.calendar_today, "weight", "", widths),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: heights / 16,
                    right: widths / 2.5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            padding: EdgeInsets.all(1),
                            height: 75,
                            width: 75,
                            color: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl: "${doctor.profilePic}",
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Padding(
                                padding: EdgeInsets.all(18.0),
                                child:
                                    Image.asset("assets/images/doctorimg.jpeg"),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/images/doctorimg.jpeg"),
                            )))),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40, bottom: 20),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.orangeAccent,
                  ),
                ).onTap(() {
                  Navigator.pop(context);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget nameCart(String heading, String data) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      padding: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCustom(heading.toUpperCase(),
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          SizedBox(
            height: 5,
          ),
          textCustom(data,
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget iconCart(IconData icon, String heading, String data, width) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.only(top: 8, left: 10),
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 2, right: 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: width / 3.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 15,
                ),
                SizedBox(
                  width: 3,
                ),
                textCustom(heading.toUpperCase(),
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          textCustom(data,
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("You Don't have access.."));
    _scaffoldKey.currentState?.showSnackBar(snackBar);
  }
}
