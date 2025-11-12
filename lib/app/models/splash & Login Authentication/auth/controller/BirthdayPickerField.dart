import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for DateFormat

class BirthdayPickerField extends StatefulWidget {
  final FormFieldValidator<String>? validator;

  const BirthdayPickerField({
    Key? key,
    this.validator,
  }) : super(key: key);

  @override
  State<BirthdayPickerField> createState() => _BirthdayPickerFieldState();
}

class _BirthdayPickerFieldState extends State<BirthdayPickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffD1D1D6), // ✅ background color
        hintText: 'dd/mm/yyyy',
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today_outlined, color: Color(0xff030712)),
          onPressed: () => _selectDate(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffD1D1D6)), // ✅ border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xffD1D1D6)), // ✅ same color when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
      onTap: () => _selectDate(context),
    );
  }
}
