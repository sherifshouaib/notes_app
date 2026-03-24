import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';

class CustomTextFieldEdit extends StatefulWidget {
  const CustomTextFieldEdit({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.contentttt = "",
    this.validate,
  });

  final String hint, contentttt;
  final int maxLines;

  final Function(String)? onChanged;

  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;

  @override
  State<CustomTextFieldEdit> createState() => _CustomTextFieldEditState();
}

class _CustomTextFieldEditState extends State<CustomTextFieldEdit> {
  late TextEditingController controller;
  TextDirection? textDirection;
  bool _isUserMovingCursor = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.contentttt);
    // set initial direction based on existing text
    if (controller.text.isNotEmpty) {
      textDirection = _getDirection(controller.text);
    } else {
      textDirection = null; // 👈 مهم
    }
    controller.addListener(() {
      final isAtEnd = controller.selection.baseOffset == controller.text.length;
      _isUserMovingCursor = !isAtEnd;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TextDirection? _getDirection(String text) {
    if (text.isEmpty) {
      return null; // default, ممكن نغير حسب أول حرف يكتب
    }
    final firstChar = text.trim().characters.first;
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    if (arabicRegex.hasMatch(firstChar)) return TextDirection.rtl;
    return TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // 👈 استخدم الـ controller بدل initialValue
      //  initialValue: widget.contentttt, // هنا بتملا القيمة الحالية للـ note
      onChanged: (value) {
        if (value.isEmpty) {
          // 👈 رجّع للوضع الطبيعي
          textDirection = null;
          setState(() {});
        } else if (value.length == 1) {
          // 👈 أول حرف هو اللي يحدد الاتجاه
          textDirection = _getDirection(value);
          setState(() {});
        }

        // 👇 لو المستخدم مش بيحرك الكيرسور بنفسه
        if (!_isUserMovingCursor) {
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }

        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onFieldSubmitted: (_) {
        // 👇 لما يخلص ويرجع يكتب تاني
        _isUserMovingCursor = false;
      },
      onSaved: widget.onSaved,
      validator: widget.validate,
      cursorColor: kPrimaryColor,
      maxLines: widget.maxLines,
      textDirection: textDirection, // 👈 هنا

      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
