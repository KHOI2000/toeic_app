import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic_app/common/extension/extension.dart';
import '../app/res/res.dart';
import '../di/locator_shorten.dart';
import 'button.dart';

class DialogBody extends StatelessWidget {
  final Widget? body;
  final String? title;
  final String? content;
  final String? buttonName;
  final String? buttonName2;
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  final double? width;
  final bool barrierDismissible;

  const DialogBody(
      {super.key,
        this.title,
        this.body,
        this.content,
        this.buttonName,
        this.onTap,
        this.buttonName2,
        this.onTap2,
        this.width,
        this.barrierDismissible = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: context.color.white, borderRadius: BorderRadius.circular(8)),
      width: width ?? size.width / 4,
      child: body ??
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppIcons.bell),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title ?? context.lang.notice,
                    style: context.theme.textThemeNeutral.s20.semiBold,
                  ),
                  const Spacer(),
                  (barrierDismissible)
                      ? GestureDetector(
                    onTap: () {
                      AppLocator.router.maybePop();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                    ),
                  )
                      : const SizedBox()
                ],
              ),
              const Divider(),
              const SizedBox(height: 12),
              Text(
                content ?? '',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              (buttonName2 == null)
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Button.primary(
                      buttonName: buttonName ?? context.lang.ok,
                      onPressed: onTap ??
                              () {
                            AppLocator.router.maybePop();
                          },
                    ),
                  )
                ],
              )
                  : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Button.primary(
                      buttonName: buttonName ?? context.lang.ok,
                      onPressed: onTap ??
                              () {
                            AppLocator.router.maybePop();
                          },
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: Button.primary(
                      buttonName: buttonName2!,
                      onPressed: onTap2 ??
                              () {
                            AppLocator.router.maybePop();
                          },
                    ),
                  )
                ],
              )
            ],
          ),
    );
  }
}

void showAppDialog(
    {barrierDismissible = true,
      Widget? body,
      String? content,
      String? buttonName,
      String? buttonName2,
      String? titleName,
      VoidCallback? onTap,
      VoidCallback? onTap2,
      double? width}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: AppLocator.context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: DialogBody(
          body: body,
          title: titleName,
          buttonName: buttonName,
          buttonName2: buttonName2,
          content: content,
          onTap: onTap,
          onTap2: onTap2,
          width: width,
          barrierDismissible: barrierDismissible,
        ),
      );
    },
  );
}
