import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationCodeInput extends StatefulWidget {
  final BorderSide? borderSide;
  final onChanged;
  final controller;
  const VerificationCodeInput(
      {Key? key, this.borderSide, this.onChanged, this.controller})
      : super(key: key);

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final _textEditingController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_controllerChanged);
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_controllerChanged);
    super.dispose();
  }

  void _controllerChanged() {
    // didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: [LengthLimitingTextInputFormatter(6)],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: widget.borderSide != null
                  ? widget.borderSide!
                  : const BorderSide())),
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
    );
  }
}

/// FormField version of the VerificationCodeInput widget
class VerificationCodeFormField extends FormField<String> {
  final TextEditingController controller;

  VerificationCodeFormField({
    Key? key,
    FormFieldSetter<String>? onSaved,
    required this.controller,
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          validator: validator,
          builder: (FormFieldState<String> field) {
            _VerificationCodeFormFieldState state =
                field as _VerificationCodeFormFieldState;
            return VerificationCodeInput(
              controller: state._controller,
            );
          },
        );

  @override
  FormFieldState<String> createState() => _VerificationCodeFormFieldState();
}

class _VerificationCodeFormFieldState extends FormFieldState<String> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();

    _controller.addListener(_controllerChanged);
  }

  @override
  void reset() {
    super.reset();
    _controller.text = "";
  }

  void _controllerChanged() {
    didChange(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_controllerChanged);
    super.dispose();
  }
}
