import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config.dart';
import '../../../base/extensions/input_decoration.dart';
import '../../../base/validation/validator_builder.dart';

class PositiveIntegerTextFormField extends TextFormField {
  PositiveIntegerTextFormField({
    Key key,
    TextEditingController controller,
    String initialValue,
    FocusNode focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.right,
    TextAlignVertical textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions toolbarOptions,
    bool showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType smartDashesType,
    SmartQuotesType smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement maxLengthEnforcement,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    GestureTapCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    List<TextInputFormatter> inputFormatters,
    bool enabled,
    double cursorWidth = 2.0,
    double cursorHeight,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls selectionControls,
    InputCounterWidgetBuilder buildCounter,
    ScrollPhysics scrollPhysics,
    Iterable<String> autofillHints,
    AutovalidateMode autovalidateMode,
    ValidationBuilder validationBuilder,
  }) : super(
          key: key,
          controller: controller,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          focusNode: focusNode,
          decoration: decoration.from({
            'required': ValidationBuilder(validationBuilder: validationBuilder)
                .hasRequired()
          }),
          keyboardType: TextInputType.number,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction ?? config['textInputAction'],
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: ValidationBuilder(validationBuilder: validationBuilder)
              .min(1)
              .integer()
              .build(),
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
        );
}
