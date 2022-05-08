import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolidAdmonition extends StatelessWidget {
  /// Raw basic Solid Admonition
  const SolidAdmonition(
      {Key? key, this.child, this.text, this.color = Colors.blue, this.icon})
      : assert(child == null || text == null,
            'Either child or text is allowed to exist'),
        _primaryColor = Colors.white,
        super(key: key);

  const SolidAdmonition.note(
      {Key? key,
      this.child,
      this.text,
      this.color = const Color(0xffebedf0),
      this.icon = const FaIcon(FontAwesomeIcons.circleInfo)})
      : _primaryColor = Colors.black,
        super(key: key);

  const SolidAdmonition.tip(
      {Key? key,
      this.child,
      this.text,
      this.color = const Color(0xff00a400),
      this.icon = const FaIcon(FontAwesomeIcons.lightbulb)})
      : _primaryColor = Colors.white,
        super(key: key);

  const SolidAdmonition.info(
      {Key? key,
      this.child,
      this.text,
      this.color = const Color(0xff54c7ec),
      this.icon = const FaIcon(FontAwesomeIcons.circleExclamation)})
      : _primaryColor = Colors.white,
        super(key: key);
  const SolidAdmonition.caution(
      {Key? key,
      this.child,
      this.text,
      this.color = const Color(0xffffba00),
      this.icon = const FaIcon(FontAwesomeIcons.triangleExclamation)})
      : _primaryColor = Colors.white,
        super(key: key);
  const SolidAdmonition.danger(
      {Key? key,
      this.child,
      this.text,
      this.color = const Color(0xfffa383e),
      this.icon = const FaIcon(FontAwesomeIcons.fire)})
      : _primaryColor = Colors.white,
        super(key: key);

  final String? text;

  final Widget? child;

  final Color? color;

  final Widget? icon;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          if (icon != null) ...[
            IconTheme(
                data: IconThemeData(color: _primaryColor, size: 18),
                child: icon!),
            const SizedBox(width: 10)
          ],
          if (text != null)
            DefaultTextStyle(
                style: TextStyle(color: _primaryColor),
                child: Flexible(child: Text(text!)))
          else
            child!
        ],
      ),
    );
  }
}
