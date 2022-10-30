import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import 'loading.dart';

class AreYouSureDialogue extends StatefulWidget {
  const AreYouSureDialogue(
      {Key? key, required this.title, required this.onConfirm})
      : super(key: key);
  final String title;
  final Function() onConfirm;

  @override
  State<AreYouSureDialogue> createState() => _AreYouSureDialogueState();
}

class _AreYouSureDialogueState extends State<AreYouSureDialogue> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: Get.back,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary),
                  ),
                  child: const Text(
                    'no',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                if (loading)
                  const Loading()
                else
                  TextButton(
                    onPressed: () async {
                      setState(() => loading = true);
                      await widget.onConfirm();
                      setState(() => loading = false);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text(
                      'yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
