import 'package:alpha/common_components/text_button.dart';
import 'package:alpha/common_components/text_field.dart';
import 'package:alpha/helpers/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../Modules/Profile/bloc/profile_bloc.dart';

class TextInputDialogue extends StatefulWidget {
  const TextInputDialogue(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.fieldName,
      this.list})
      : super(key: key);
  final String hint, fieldName;
  final List<String>? list;
  final void Function() onSave;

  @override
  State<TextInputDialogue> createState() => _TextInputDialogueState();
}

class _TextInputDialogueState extends State<TextInputDialogue> {
  final TextEditingController controller = TextEditingController();

  @override
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.fieldName);
    return SizedBox(
      width: Get.width * .8,
      child: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                controller: controller,
                hint: widget.hint,
                keyboardType: widget.fieldName == 'PriceOfConsult'
                    ? TextInputType.number
                    : null,
                validator: (v) => widget.fieldName == 'PriceOfConsult'
                    ? ValidationHelper.validateNumber(context, v)
                    : ValidationHelper.validateText(context, v),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppTextButton(false, 'save', () {
                      if (key.currentState!.validate()) {
                        if (widget.list != null) {
                          widget.list!.add(controller.text);
                        }
                        context.read<ProfileBloc>().add(
                            UpdateProfile({widget.fieldName: controller.text}));
                        Get.back();
                      }
                    }, .1),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: AppTextButton(false, 'cancel', () => Get.back(), .1),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
