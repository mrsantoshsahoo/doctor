import 'package:doctor/presentation/app/app.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(),
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            children: [
              Text(
                "BIMA DOCTOR",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return doctorListWidgets();
                  }),
            ))
          ],
        ));
  }

  Widget doctorListWidgets() {
    return Column(
      children: [
        ListTile(
          leading: Container(
              width: 48.0,
              height: 48.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://thumbs.dreamstime.com/b/rainbow-love-heart-background-red-wood-60045149.jpg")))),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Santosh Kumar Sahoo",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "GENERAL PRACTRICE",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent.shade100,
                ),
              ),
              Text("vj hbdkvb dlvndlkvjergjge rijerjergjge rijerg",

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  )),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 35,
          ),
        ),
        Divider(thickness: 1,)
      ],
    );
  }
}
