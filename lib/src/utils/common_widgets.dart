import 'package:google_fonts/google_fonts.dart';

import '../presentation/app/app.dart';
import '../presentation/app/app.dart';

Text textCustom(text,
    {Color color = Colors.black,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    textAlign: TextAlign.start}) {
  var style = TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
  return Text(text,
      textAlign: textAlign, style: GoogleFonts.roboto(textStyle: style));
}

TextSpan textSpanCustom(text,
    {Color color = Colors.black,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    textAlign: TextAlign.start}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}
