import 'package:flutter/material.dart';

import 'loading.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      this.isLoading, this.text, this.function, this.widthFactor,
      {Key? key,
      this.enabled = true,
      this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 8)})
      : super(key: key);

  final bool isLoading;
  final bool enabled;
  final String text;
  final Function function;
  final double widthFactor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : FractionallySizedBox(
            widthFactor: widthFactor,
            child: TextButton(
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    backgroundColor: MaterialStateProperty.all<Color>(enabled
                        ? Theme.of(context).primaryColor
                        : Colors.grey)),
                onPressed: enabled ? () => function() : null,
                child: Text(
                  text.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                )));
  }
}
