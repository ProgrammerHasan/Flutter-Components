import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
/// [GFButtonType] is used to change the type of widgets
enum GFButtonType {
  /// Default type is [GFButtonType.solid], used to fill with color for widget
  solid,

  /// Type [GFButtonType.outline], used for widget with outline border and fill color with Colors.transparent
  outline,

  /// Type [GFButtonType.outline2x], used for widget with outline2x border and border.width = 2.0 and fill color with Colors.transparent
  outline2x,

  /// Type [GFButtonType.transparent], used for widget with fill color with Colors.transparent
  transparent,
}
/// [GFIconButtonShape] is used to shape the GFIconButton widget.
enum GFIconButtonShape {
  /// [GFIconButtonShape.circle], used for rounded shape icon button
  circle,

  /// [GFIconButtonShape.pills], used for pills shaped icon button with rounded corners
  pills,

  /// Default shape is [GFIconButtonShape.standard], used for standard rectangle icon button with rounded corners
  standard,

  /// [GFIconButtonShape.square], used for square icon button
  square,
}
class GFColors {
  static const Color PRIMARY = Color(0xff3880FF);
  static const Color SECONDARY = Color(0xffAA66CC);
  static const Color SUCCESS = Color(0xff10DC60);
  static const Color INFO = Color(0xff33B5E5);
  static const Color WARNING = Color(0xffFFBB33);
  static const Color DANGER = Color(0xffF04141);
  static const Color LIGHT = Color(0xffE0E0E0);
  static const Color DARK = Color(0xff222428);
  static const Color WHITE = Color(0xffffffff);
  static const Color FOCUS = Color(0xff434054);
  static const Color ALT = Color(0xff794c8a);
  static const Color TRANSPARENT = Colors.transparent;
}
/// [GFSize] is used to change the size of the widget.
class GFSize {
  /// [GFSize.SMALL] is used for small size widget
  static const double SMALL = 30;

  /// Default size if [GFSize.MEDIUM] is used for medium size widget
  static const double MEDIUM = 35;

  /// [GFSize.LARGE] is used for large size widget
  static const double LARGE = 40;
}
class MsFIconButton extends StatefulWidget {
  /// Create icon buttons of all types. check out [GFButton] for buttons
  const MsFIconButton({
    Key key,
    this.iconSize = 0.0,
    this.padding = const EdgeInsets.all(8),
    this.alignment = Alignment.center,
    @required this.icon,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    @required this.onPressed,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.type = GFButtonType.solid,
    this.shape = GFIconButtonShape.standard,
    this.color = GFColors.PRIMARY,
    this.borderShape,
    this.boxShadow,
    this.size = GFSize.MEDIUM,
    this.buttonBoxShadow,
    this.borderSide,
  })  : assert(iconSize != null),
        assert(padding != null),
        assert(alignment != null),
        assert(autofocus != null),
        assert(icon != null),
        super(key: key);

  /// The size of the icon inside the button.
  final double iconSize;

  /// The padding around the button's icon.
  final EdgeInsetsGeometry padding;

  /// Defines how the icon is positioned within the IconButton.
  final AlignmentGeometry alignment;

  /// The icon to display inside the button.
  final Widget icon;

  /// The color for the button's icon when it has the input focus.
  final Color focusColor;

  /// The color for the button's icon when a pointer is hovering over it.
  final Color hoverColor;

  /// Button type of [GFButtonType] i.e, solid, outline, outline2x transparent
  final GFButtonType type;

  /// Button type of [GFIconButtonShape] i.e, standard, pills, square, shadow, icons
  final GFIconButtonShape shape;

  /// Pass [GFColors] or [Color]
  final Color color;

  /// Pass [GFColors] or [Color]. The primary color of the button when the button is in the down (pressed) state.
  final Color splashColor;

  /// Pass [GFColors] or [Color]. The secondary color of the button when the button is in the down (pressed) state.
  final Color highlightColor;

  /// Pass [GFColors] or [Color]. The color to use for the icon inside the button, if the icon is disabled.
  final Color disabledColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Text that describes the action that will occur when the button is pressed.
  final String tooltip;

  /// The box shadow for the button's [Material], if GFButtonType is solid
  final BoxShadow boxShadow;

  /// The shape and border for the button's [Material].
  final ShapeBorder borderShape;

  /// size of [double] or [GFSize] i.e, 1.2, small, medium, large etc.
  final double size;

  /// on true state default box shadow appears around button, if GFButtonType is solid
  final bool buttonBoxShadow;

  /// The border side for the button's [Material].
  final BorderSide borderSide;

  @override
  _MsFIconButtonState createState() => _MsFIconButtonState();
}

class _MsFIconButtonState extends State<MsFIconButton> {
  Color color;
  Function onPressed;
  GFButtonType type;
  GFIconButtonShape shape;
  BoxShadow boxShadow;
  double height;
  double width;
  double iconPixel = 18;

  @override
  void initState() {
    color = widget.color;
    onPressed = widget.onPressed;
    type = widget.type;
    shape = widget.shape;
    super.initState();
  }

  Color getBorderColor() {
    if (widget.onPressed != null) {
      return color;
    } else {
      if (widget.disabledColor != null) {
        return widget.disabledColor;
      } else {
        return color.withOpacity(0.48);
      }
    }
  }

  Color getDisabledFillColor() {
    if (widget.type == GFButtonType.transparent ||
        widget.type == GFButtonType.outline ||
        widget.type == GFButtonType.outline2x) {
      return Colors.transparent;
    }
    if (widget.disabledColor != null) {
      return widget.disabledColor;
    } else {
      return color.withOpacity(0.48);
    }
  }

  Color getColor() {
    if (widget.type == GFButtonType.transparent ||
        widget.type == GFButtonType.outline ||
        widget.type == GFButtonType.outline2x) {
      return Colors.transparent;
    } else {
      return color;
    }
  }

  Color getIconColor() {
    if (widget.type == GFButtonType.transparent ||
        widget.type == GFButtonType.outline ||
        widget.type == GFButtonType.outline2x) {
      return widget.onPressed != null
          ? color == GFColors.TRANSPARENT
          ? GFColors.DARK
          : color
          : color.withOpacity(0.48);
    } else if (color == GFColors.TRANSPARENT) {
      return widget.onPressed != null ? GFColors.DARK : GFColors.WHITE;
    } else {
      return GFColors.WHITE;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final Color themeColor =
    Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    final BorderSide outlineBorder = BorderSide(
      color: widget.borderSide == null
          ? getBorderColor()
          : widget.borderSide.color,
      width: widget.borderSide?.width == null
          ? widget.type == GFButtonType.outline2x
          ? 2.0
          : 1.0
          : widget.borderSide?.width,
    );

    final BorderSide shapeBorder = widget.type == GFButtonType.outline ||
        widget.type == GFButtonType.outline2x
        ? outlineBorder
        : widget.borderSide ??
        BorderSide(
          color: color,
          width: 0,
        );

    ShapeBorder shapeBorderType;

    if (shape == GFIconButtonShape.pills) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: shapeBorder,
      );
    } else if (shape == GFIconButtonShape.square) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: shapeBorder,
      );
    } else if (shape == GFIconButtonShape.standard) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: shapeBorder,
      );
    } else if (shape == GFIconButtonShape.circle) {
      shapeBorderType = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: shapeBorder,
      );
    }

    if (widget.size == GFSize.SMALL) {
      height = 30.0;
      width = 30.0;
      iconPixel = 18.0;
    } else if (widget.size == GFSize.MEDIUM) {
      height = 35.0;
      width = 35.0;
      iconPixel = 28.0;
    } else if (widget.size == GFSize.LARGE) {
      height = 40.0;
      width = 40.0;
      iconPixel = 38.0;
    }

    Widget result = Container(
      // height: widget.shape == GFIconButtonShape.circle ? height + 6.0 : height,
      // width: widget.shape == GFIconButtonShape.pills
      //     ? width + 10
      //     : widget.shape == GFIconButtonShape.circle
      //         ? height + 6
      //         : width,
      padding: widget.padding,
      child: SizedBox(
        height: widget.iconSize != 0 ? widget.iconSize : iconPixel,
        width: widget.iconSize != 0 ? widget.iconSize : iconPixel,
        child: Align(
          alignment: Alignment.center,
          child: IconTheme.merge(
            data: IconThemeData(
              size: widget.iconSize > 0.0 ? widget.iconSize : iconPixel,
              color: getIconColor(),
            ),
            child: widget.icon,
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      result = Tooltip(
        message: widget.tooltip,
        child: result,
      );
    }

    BoxDecoration getBoxShadow() {
      if (widget.type != GFButtonType.transparent) {
        if (widget.boxShadow == null && widget.buttonBoxShadow != true) {
          return null;
        } else {
          return BoxDecoration(
              color: widget.onPressed != null
                  ? getColor()
                  : getDisabledFillColor(),
              borderRadius: widget.shape == GFIconButtonShape.circle
                  ? BorderRadius.circular(50)
                  : widget.shape == GFIconButtonShape.standard
                  ? BorderRadius.circular(3)
                  : widget.shape == GFIconButtonShape.pills
                  ? BorderRadius.circular(20)
                  : BorderRadius.zero,
              boxShadow: [
                widget.boxShadow == null && widget.buttonBoxShadow == true
                    ? BoxShadow(
                  color: themeColor,
                  blurRadius: 1.5,
                  spreadRadius: 2,
                  offset: Offset.zero,
                )
                    : widget.boxShadow ??
                    BoxShadow(
                      color: Theme.of(context).canvasColor,
                      blurRadius: 0,
                      spreadRadius: 0,
                      offset: Offset.zero,
                    )
              ]);
        }
      }
      return null;
    }

    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      child: Focus(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        child: Container(
          // height:
          //     widget.shape == GFIconButtonShape.circle ? height + 6 : height,
          // width: widget.shape == GFIconButtonShape.pills
          //     ? width + 10
          //     : widget.shape == GFIconButtonShape.circle
          //         ? height + 6
          //         : width,
          decoration: widget.type == GFButtonType.solid ? getBoxShadow() : null,
          child: Material(
            shape: widget.type == GFButtonType.transparent
                ? null
                : widget.borderShape ?? shapeBorderType,
            color:
            widget.onPressed != null ? getColor() : getDisabledFillColor(),
            type: widget.type == GFButtonType.transparent
                ? MaterialType.transparency
                : MaterialType.button,
            child: InkResponse(
              onTap: widget.onPressed,
              child: result,
              focusColor: widget.focusColor ?? Theme.of(context).focusColor,
              hoverColor: widget.hoverColor ?? Theme.of(context).hoverColor,
              highlightColor:
              widget.highlightColor ?? Theme.of(context).highlightColor,
              splashColor: widget.splashColor ?? Theme.of(context).splashColor,
              radius: math.max(
                  Material.defaultSplashRadius,
                  (widget.iconSize > 0.0
                      ? widget.iconSize
                      : iconPixel +
                      math.min(
                        widget.padding.horizontal,
                        widget.padding.vertical,
                      )) *
                      0.7),
            ),
          ),
        ),
      ),
    );
  }
}
