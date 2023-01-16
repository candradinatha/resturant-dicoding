import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/constants/app_sizes.dart';
import 'package:restaurant/styles.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.title,
    this.defaultValue,
    this.obscureText = false,
    this.enableInteractiveSelection = true,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.isRequired = false,
    this.onChange,
    this.suffixIcon,
    this.errorMaxLines,
    this.onSubmit,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String? title;
  final String? defaultValue;
  final bool obscureText;
  final bool enableInteractiveSelection;
  final FormFieldValidator? validator;
  final TextInputType textInputType;
  final int? maxLength;
  final Function()? onTap;
  final TextAlign? textAlign;
  final bool? enabled;
  final bool? isRequired;
  final Function(String value)? onChange;
  final Widget? suffixIcon;
  final int? errorMaxLines;
  final Function(String)? onSubmit;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: Get.theme.textTheme.subtitle2?.copyWith(
              color: Colors.grey,
            ),
          ),
          AppGaps.h8,
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: colorPrimary,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onTap: widget.onTap != null ? widget.onTap! : null,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          textAlign: widget.textAlign ?? TextAlign.start,
          minLines: widget.textInputType == TextInputType.multiline ? 1 : null,
          maxLines: widget.textInputType == TextInputType.multiline ? null : 1,
          obscureText: widget.obscureText,
          enabled: widget.enabled,
          autocorrect: false,
          onFieldSubmitted: (value) =>
              widget.onSubmit != null ? widget.onSubmit!(value) : null,
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          maxLength: widget.maxLength,
          validator: widget.validator ??
              (widget.isRequired == true
                  ? (value) {
                      if (value == null || value == "") {
                        return "${widget.hint} is required";
                      }
                      return null;
                    }
                  : null),
          decoration: InputDecoration(
            hintText: widget.hint,
          ),
        ),
      ],
    );
  }
}
