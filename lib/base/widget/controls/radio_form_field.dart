import 'package:flutter/material.dart';
import '../../model/label_value.dart';

class LabeledRadio<T> extends StatelessWidget {
  const LabeledRadio({
    Key key,
    this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0),
    this.groupValue,
    this.value,
    this.onChanged,
    this.optional,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final T groupValue;
  final T value;
  final Function onChanged;
  final Map optional;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
              onChanged: (T newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

enum RadioDirectionDefine {
  ROW,
  COL,
}

class RadioFormField<T> extends StatefulWidget {
  RadioFormField({
    Key key,
    this.selections,
    this.defaultValue,
    this.direction = RadioDirectionDefine.ROW,
  }) : super(key: key);

  final List<LabelValue<T>> selections;
  final T defaultValue;
  final RadioDirectionDefine direction;

  @override
  _RadioFormFieldState<T> createState() => _RadioFormFieldState(
        isRadioSelected: defaultValue,
      );
}

class _RadioFormFieldState<T> extends State<RadioFormField> {
  _RadioFormFieldState({this.isRadioSelected});

  T isRadioSelected;

  @override
  Widget build(BuildContext context) {
    Function onChanged = (T newValue) {
      setState(() {
        isRadioSelected = newValue;
      });
    };

    List<LabeledRadio<T>> radios = [];
    widget.selections.forEach(
      (LabelValue element) {
        radios.add(
          LabeledRadio<T>(
            label: element.label,
            value: element.value,
            groupValue: isRadioSelected,
            onChanged: onChanged,
          ),
        );
      },
    );

    switch (widget.direction) {
      case RadioDirectionDefine.ROW:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: radios,
        );
      case RadioDirectionDefine.COL:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: radios,
        );
      default:
        throw UnsupportedError("RadioDirectionDefineを指定してください。");
    }
  }
}
