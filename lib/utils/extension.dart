import '../presentation/app/app.dart';

extension WidgetExt on Widget {
  Widget onTap(VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: this,
  );
}