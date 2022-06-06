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

  final String? text;

  final Widget? child;

  final Color? color;

  final Widget? icon;

  final double opacity;

  final Color? primaryColor;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(children: [
          Positioned.fromRect(
            rect: Rect.fromLTRB(0, 0, 8, 400),
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
