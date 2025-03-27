import 'package:flutter/material.dart';

import '../../utils/debouncer.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.search,
    required this.labelText,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final String labelText;

  @override
  State<StatefulWidget> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onSubmitted: (str) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(str);
          }
        },
        onChanged: (str) {
          if (str.length > 3) {
            _debouncer.run(() {
              if (str.isNotEmpty && widget.onChanged != null) {
                widget.onChanged!(str);
              }
            });
          }
        },
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
