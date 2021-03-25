import 'package:flutter/material.dart';
import '../../model/label_value.dart';
import 'selections_orientation_define.dart';

class LabeledRadio<T> extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final T groupValue;
  final T value;
  final bool disabled;
  final TextStyle labelStyle;
  final Function onChanged;
  final Map optional;

  const LabeledRadio({
    Key key,
    this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.groupValue,
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
              if (value != groupValue) {
                onChanged(value);
              }
            },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio(
              groupValue: groupValue,
              value: value,
              onChanged: disabled
                  ? null
                  : (T newValue) {
                      onChanged(newValue);
                    },
            ),
            Text(label, style: textLabelStyle),
          ],
        ),
      ),
    );
  }
}

class RadioFormField<T> extends StatefulWidget {
  final List<LabelValue<T>> selections;
  final List<T> disabled;
  final T defaultValue;
  final void Function(T value) onChange;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final SelectionsOrientationDefine orientation;

  RadioFormField({
    Key key,
    this.selections,
    this.disabled = const [],
    this.defaultValue,
    this.onChange,
    this.labelStyle = const TextStyle(),
    this.orientation = SelectionsOrientationDefine.HORIZONTAL,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  _RadioFormFieldState<T> createState() => _RadioFormFieldState();
}

class _RadioFormFieldState<T> extends State<RadioFormField> {
  T _selected;
  LabeledRadio _selectedElement;

  @override
  void initState() {
    super.initState();
    _selected = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    List<LabeledRadio<T>> radios = [];
    widget.selections.asMap().forEach(
      (index, LabelValue element) {
        if (_selected == null && index == 0) {
          _selected = element.value;
        }

        radios.add(
          LabeledRadio<T>(
            label: element.label,
            value: element.value,
            groupValue: _selected,
            disabled: (widget.disabled != null &&
                widget.disabled.contains(element.value)),
            labelStyle: widget.labelStyle,
            onChanged: onChanged,
            optional: element.optional,
          ),
        );
      },
    );

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: widget.orientation == SelectionsOrientationDefine.HORIZONTAL
          ? Row(
              children: radios,
            )
          : Column(
              children: radios,
            ),
    );
  }

  void onChanged(T newValue) {
    setState(() {
      _selected = newValue;
      if (widget.onChange != null) {
        widget.onChange(newValue);
      }
    });
  }
}
