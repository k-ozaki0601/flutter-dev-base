import 'package:flutter/material.dart';
import 'package:flutter_validation/base/widget/controls/selections_orientation_define.dart';
import '../../model/label_value.dart';
import 'selections_orientation_define.dart';

class LabeledCheckbox<T> extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final bool checked;
  final T value;
  final bool disabled;
  final TextStyle labelStyle;
  final Function onChanged;
  final Map optional;

  const LabeledCheckbox({
    Key key,
    this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.checked,
    this.value,
    this.disabled,
    this.labelStyle,
    this.onChanged,
    this.optional,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textLabelStyle = disabled
        ? labelStyle.apply(color: Theme.of(context).disabledColor)
        : labelStyle;

    return InkWell(
      onTap: disabled
          ? null
          : () {
              onChanged(value, !checked);
            },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: checked,
              onChanged: disabled
                  ? null
                  : (bool newValue) {
                      onChanged(value, newValue);
                    },
            ),
            Text(label, style: textLabelStyle),
          ],
        ),
      ),
    );
  }
}

class CheckboxFormField<T> extends StatefulWidget {
  final List<LabelValue<T>> selections;
  final List<T> defaultValues;
  final List<T> disabled;
  final void Function(T value, bool checked, Map<T, bool> checkedValues)
      onChange;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final SelectionsOrientationDefine orientation;

  CheckboxFormField({
    Key key,
    this.selections,
    this.defaultValues = const [],
    this.disabled = const [],
    this.onChange,
    this.labelStyle = const TextStyle(),
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.orientation = SelectionsOrientationDefine.HORIZONTAL,
  }) : super(key: key);

  @override
  _CheckboxFormFieldState<T> createState() => _CheckboxFormFieldState();
}

class _CheckboxFormFieldState<T> extends State<CheckboxFormField> {
  final Map<T, bool> checkedValues = {};

  getCheckedList() {
    List<T> checkedList = [];

    checkedValues.forEach((key, checked) {
      if (checked) {
        checkedList.add(key);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.selections.asMap().forEach((key, element) {
      checkedValues[element.value] =
          (widget.defaultValues.contains(element.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<LabeledCheckbox> checkboxes = [];
    widget.selections.asMap().forEach(
      (index, LabelValue element) {
        bool disabled = widget.disabled.contains(element.value);

        var checkbox = LabeledCheckbox(
          label: element.label,
          checked: checkedValues[element.value],
          value: element.value,
          disabled: disabled,
          labelStyle: widget.labelStyle,
          onChanged: onChanged,
          optional: element.optional,
        );

        checkboxes.add(checkbox);
      },
    );

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: widget.orientation == SelectionsOrientationDefine.HORIZONTAL
          ? Row(
              children: checkboxes,
            )
          : Column(
              children: checkboxes,
            ),
    );
  }

  void onChanged(T value, bool newValue) {
    setState(() {
      checkedValues[value] = newValue;
      if (widget.onChange != null) {
        widget.onChange(value, newValue, checkedValues);
      }
    });
  }
}
