import 'package:flutter/material.dart';
import 'package:wirepay/shared/app_colors.dart';

class PinInputField extends StatefulWidget {
  final int pinLength;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const PinInputField({
    super.key,
    required this.controller,
    this.pinLength = 4,
    this.onChanged,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late List<bool> _filled;

  @override
  void initState() {
    super.initState();
    _filled = List.generate(widget.pinLength, (_) => false);
    widget.controller.addListener(_updateFilledStates);
  }

  void _updateFilledStates() {
    setState(() {
      for (int i = 0; i < widget.pinLength; i++) {
        _filled[i] = i < widget.controller.text.length;
      }
    });
    widget.onChanged?.call(widget.controller.text);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateFilledStates);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.blue500,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.pinLength,
          (index) {
            final filled = _filled[index];
            return Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: filled
                    ? AppColors.primary.withOpacity(0.3)
                    : AppColors.disabled,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filled ? AppColors.primary : AppColors.disabled,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
