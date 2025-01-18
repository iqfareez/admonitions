import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolidAdmonition extends StatelessWidget {
  /// Raw basic Solid Admonition
  const SolidAdmonition({
    super.key,
    this.child,
    this.text,
    this.color = Colors.blue,
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon,
    this.actions,
  })  : assert(child == null || text == null,
            'Either child or text is allowed to exist'),
        _primaryColor = Colors.white;

  const SolidAdmonition.note({
    super.key,
    this.child,
    this.text,
    this.color = const Color(0xffebedf0),
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon = const FaIcon(FontAwesomeIcons.circleInfo),
    this.actions,
  }) : _primaryColor = Colors.black;

  const SolidAdmonition.tip({
    super.key,
    this.child,
    this.text,
    this.color = const Color(0xff00a400),
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon = const FaIcon(FontAwesomeIcons.lightbulb),
    this.actions,
  }) : _primaryColor = Colors.white;

  const SolidAdmonition.info({
    super.key,
    this.child,
    this.text,
    this.color = const Color(0xff54c7ec),
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon = const FaIcon(FontAwesomeIcons.circleExclamation),
    this.actions,
  }) : _primaryColor = Colors.white;
  const SolidAdmonition.caution({
    super.key,
    this.child,
    this.text,
    this.color = const Color(0xffffba00),
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon = const FaIcon(FontAwesomeIcons.triangleExclamation),
    this.actions,
  }) : _primaryColor = Colors.white;
  const SolidAdmonition.danger({
    super.key,
    this.child,
    this.text,
    this.color = const Color(0xfffa383e),
    this.constraintHeight = true,
    this.constraintWidth = false,
    this.icon = const FaIcon(FontAwesomeIcons.fire),
    this.actions,
  }) : _primaryColor = Colors.white;

  /// Text inside the admonition
  final String? text;

  /// Widget to replace Text widget inside admonitions
  /// To use [child], [text] must be null.
  final Widget? child;

  /// Limit the height of the admonition based on child's content. Default to
  /// [true] to prevent this element expands when put inside unconstrained parents
  final bool constraintHeight;

  /// Limit the width of the admonition based on child's content. Default to
  /// [false] to fill the parent's width
  final bool constraintWidth;

  /// Base colour of the admonition
  /// [opacity] value will be applied to this [color]
  final Color? color;

  /// Leading icon for admonition
  final Widget? icon;

  /// Primary colour of the admonitions
  final Color _primaryColor;

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
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: constraintHeight ? MainAxisSize.min : MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: constraintWidth ? MainAxisSize.min : MainAxisSize.max,
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
