import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/spacing.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';

class RecentText extends StatelessWidget {
  Function() onSend;
  Function() onCopy;

  RecentText({
    required this.onCopy,
    required this.onSend,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor, width: 2),
          borderRadius: BorderRadius.circular(7),
          color: kLightColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: placeholder.copyWith(fontSize: 11.5),
                  ),
                  Text(
                    "2:45 am",
                    style: placeholder.copyWith(fontSize: 11.5),
                  ),
                ],
              ),
            ),
          ),
          const S.width(10),
          Column(
            children: [
              InkWell(
                onTap: onCopy,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Copy",
                      style: placeholder.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )),
              ),
              const S.height(10),
              InkWell(
                onTap: onSend,
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Send",
                      style: placeholder,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
