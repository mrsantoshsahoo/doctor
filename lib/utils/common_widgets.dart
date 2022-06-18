import '../presentation/app/app.dart';
import '../presentation/app/app.dart';

Text textCustom(text,
    {Color color = Colors.black,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    textAlign: TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
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
