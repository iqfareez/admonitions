import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PastelAdmonition extends StatelessWidget {
  /// Admonition with soft colours
  const PastelAdmonition(
      {Key? key,
      this.child,
      this.text,
      this.color = Colors.blue,
      this.icon,
      this.opacity = .3,
      this.actions,
      this.primaryColor})
      : assert(child == null || text == null,
            'Either child or text is allowed to exist'),
        super(key: key);

  const PastelAdmonition.note({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xffebedf0),
    this.icon = const FaIcon(FontAwesomeIcons.circleInfo),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  const PastelAdmonition.tip({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xff00a400),
    this.icon = const FaIcon(FontAwesomeIcons.lightbulb),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  const PastelAdmonition.info({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xff54c7ec),
    this.icon = const FaIcon(FontAwesomeIcons.circleExclamation),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);
  const PastelAdmonition.caution({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xffffba00),
    this.icon = const FaIcon(FontAwesomeIcons.triangleExclamation),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);
  const PastelAdmonition.danger({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xfffa383e),
    this.icon = const FaIcon(FontAwesomeIcons.fire),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  /// Text inside the admonition
  final String? text;

  /// Widget to replace Text widget inside admonitions
  /// To use [child], [text] must be null.
  final Widget? child;

  /// Base colour of the admonition
  /// [opacity] value will be applied to this [color]
  final Color? color;

  /// Leading icon for admonition
  final Widget? icon;

  /// opacity of the admonition.
  /// Value between 0 and 1.
  final double opacity;

  /// Primary colour of the admonitions
  final Color? primaryColor;

  /// List of widgets to be displayed at the end of the adminitions.
  /// If [actions] is null, the admonition will be displayed without actions.
  /// Usually will be TextButton(s)
  ///
  /// Button Style parameter you can follow:
  /// ```dart
  /// tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  /// primary: Theme.of(context).textTheme.bodyLarge!.color,
  /// textStyle: const TextStyle(fontWeight: FontWeight.w600),
  /// ```
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: (color ?? Theme.of(context).primaryColor).withOpacity(opacity),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              if (icon != null) ...[
                IconTheme(
                    data: IconThemeData(
                        color:
                            primaryColor ?? Theme.of(context).iconTheme.color,
                        size: 18),
                    child: icon!),
                const SizedBox(width: 10)
              ],
              if (text != null)
                DefaultTextStyle(
                    style: TextStyle(
                        color: primaryColor ??
                            Theme.of(context).textTheme.bodyLarge!.color),
                    child: Flexible(child: Text(text!)))
              else
                child!
            ],
          ),
          if (actions != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!,
            )
        ],
      ),
    );
  }
}
