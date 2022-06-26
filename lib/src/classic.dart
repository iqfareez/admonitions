import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClassicAdmonition extends StatelessWidget {
  /// Classic admonitions (solid line on the left, pastel colour on the right)
  const ClassicAdmonition(
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

  const ClassicAdmonition.note({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xffebedf0),
    this.icon = const FaIcon(FontAwesomeIcons.circleInfo),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  const ClassicAdmonition.tip({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xff00a400),
    this.icon = const FaIcon(FontAwesomeIcons.lightbulb),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  const ClassicAdmonition.info({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xff54c7ec),
    this.icon = const FaIcon(FontAwesomeIcons.circleExclamation),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);
  const ClassicAdmonition.caution({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xffffba00),
    this.icon = const FaIcon(FontAwesomeIcons.triangleExclamation),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);
  const ClassicAdmonition.danger({
    Key? key,
    this.child,
    this.text,
    this.color = const Color(0xfffa383e),
    this.icon = const FaIcon(FontAwesomeIcons.fire),
    this.opacity = .3,
    this.actions,
    this.primaryColor,
  }) : super(key: key);

  /// Text that will be displayed in the admonition.
  final String? text;

  /// The child widget that will be displayed in the admonition.
  /// To use [child], [text] must be null.
  final Widget? child;

  /// Colour of the admonition.
  final Color? color;

  /// The leading icon of the admonition.
  /// Overrides the default icon
  final Widget? icon;

  /// Colour background opacity
  /// value between 0 and 1
  final double opacity;

  /// Colour of the [text] and [icon]
  final Color? primaryColor;

  /// List of widgets to be displayed at the end of the adminitions.
  /// If [actions] is null, the admonition will be displayed without actions.
  /// Usually will be TextButton(s).
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
      margin: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(children: [
          Positioned.fromRect(
            rect: const Rect.fromLTRB(0, 0, 8, 400),
            child: Container(
              color: color,
              // constraints: BoxConstraints.expand(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            color:
                (color ?? Theme.of(context).primaryColor).withOpacity(opacity),
            child: Column(
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      IconTheme(
                          data: IconThemeData(
                              color: primaryColor ??
                                  Theme.of(context).iconTheme.color,
                              size: 18),
                          child: icon!),
                      const SizedBox(width: 10)
                    ],
                    if (text != null)
                      DefaultTextStyle(
                          style: TextStyle(
                              color: primaryColor ??
                                  Theme.of(context).textTheme.bodyText1!.color),
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
          ),
        ]),
      ),
    );
  }
}
