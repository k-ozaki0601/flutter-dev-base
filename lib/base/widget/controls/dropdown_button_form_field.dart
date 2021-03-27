import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import '../../../base/model/label_value.dart';
import 'validation/validator_builder.dart';

class DropdownButtonFormFieldEx<String> extends DropdownButtonFormField {
  factory DropdownButtonFormFieldEx({
    Key key,
    List<LabelValue<String>> items = const [],
    DropdownButtonBuilder selectedItemBuilder,
    String labelText,
    String value,
    ValueChanged<String> onChanged,
    VoidCallback onTap,
    int elevation: 8,
    TextStyle style,
    Widget icon,
    Color iconDisabledColor,
    Color iconEnabledColor,
    double iconSize: 24.0,
    bool isDense: false,
    bool isExpanded: false,
    double itemHeight: kMinInteractiveDimension,
    Color focusColor,
    FocusNode focusNode,
    bool autofocus: false,
    Color dropdownColor,
    InputDecoration decoration = const InputDecoration(),
    FormFieldSetter<String> onSaved,
    bool disabled = false,
    bool required = false,
    ValidationBuilder validationBuilder,
  }) {
    // items
    List<DropdownMenuItem<String>> selections = [];
    items.forEach((element) {
      selections.add(
        DropdownMenuItem(
          value: element.value,
          child: Text(element.label),
        ),
      );
    });

    // hint
    Widget hint = Text(sprintf("%s%s", [labelText, (required ? " *" : "")]));

    return DropdownButtonFormFieldEx._(
      key: key,
      items: selections,
      selectedItemBuilder: selectedItemBuilder,
      value: value,
      hint: hint,
      onChanged: onChanged,
      onTap: onTap,
      elevation: elevation,
      style: style,
      icon: icon,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      iconSize: iconSize,
      isDense: isDense,
      isExpanded: isExpanded,
      itemHeight: itemHeight,
      focusColor: focusColor,
      focusNode: focusNode,
      autofocus: autofocus,
      dropdownColor: dropdownColor,
      decoration: decoration,
      onSaved: onSaved,
      validator: ValidationBuilder().requiredValidator(),
    );
  }

  DropdownButtonFormFieldEx._({
    Key key,
    List<DropdownMenuItem<String>> items,
    DropdownButtonBuilder selectedItemBuilder,
    String value,
    Widget hint,
    Widget disabledHint,
    ValueChanged<String> onChanged,
    VoidCallback onTap,
    int elevation,
    TextStyle style,
    Widget icon,
    Color iconDisabledColor,
    Color iconEnabledColor,
    double iconSize,
    bool isDense,
    bool isExpanded,
    double itemHeight,
    Color focusColor,
    FocusNode focusNode,
    bool autofocus,
    Color dropdownColor,
    InputDecoration decoration,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
  }) : super(
          key: key,
          items: items,
          selectedItemBuilder: selectedItemBuilder,
          value: value,
          hint: hint,
          disabledHint: disabledHint,
          onChanged: onChanged,
          onTap: onTap,
          elevation: elevation,
          style: style,
          icon: icon,
          iconDisabledColor: iconDisabledColor,
          iconEnabledColor: iconEnabledColor,
          iconSize: iconSize,
          isDense: isDense,
          isExpanded: isExpanded,
          itemHeight: itemHeight,
          focusColor: focusColor,
          focusNode: focusNode,
          autofocus: autofocus,
          dropdownColor: dropdownColor,
          decoration: decoration,
          onSaved: onSaved,
          validator: validator,
        );
}
