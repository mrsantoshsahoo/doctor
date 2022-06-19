import 'package:shimmer/shimmer.dart';

import '../presentation/app/app.dart';

simmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade300,
  //  enabled: true,
    child: ListView.builder(
     padding: EdgeInsets.only(top: 10),

      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 12, right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 48.0,
              height: 48.0,

              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 200,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 150.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
Icon(Icons.arrow_forward_ios_rounded,size: 30)
                ],
              ),
            )
          ],
        ),
      ),
      itemCount: 15,
    ),
  );
}