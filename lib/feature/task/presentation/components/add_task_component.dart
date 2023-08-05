import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskComponent extends StatelessWidget {
  const AddTaskComponent({
    super.key,
    required this.tilte,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });
  final String tilte;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tilte,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            //hint
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
