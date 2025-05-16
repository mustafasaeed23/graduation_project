import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theming/colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T value;
  final void Function(T?) onChanged;
  final String Function(T) itemToString;
  final double? width;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemToString,
    this.width,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonHideUnderline(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade800),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: DropdownButton<T>(
            value: widget.value,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.wamdahGoldColor2,
            ),
            dropdownColor: Colors.black,
            style: GoogleFonts.poppins(color: Colors.white),
            onChanged: widget.onChanged,
            items:
                widget.items.map((T item) {
                  return DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      widget.itemToString(item),
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
