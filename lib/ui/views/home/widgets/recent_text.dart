// ignore_for_file: must_be_immutable

import 'package:copy_n_sync/ui/shared/colors.dart';
import 'package:copy_n_sync/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RecentText extends StatelessWidget {
  Function() onSend;
  Function() onCopy;
  String text;
  String time;

  RecentText({
    super.key,
    required this.onCopy,
    required this.onSend,
    required this.text,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(
                    text,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: placeholder.copyWith(
                        fontSize: 11.5.sp, fontWeight: FontWeight.w300),
                  ),
                ),
                Gap(17.h),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    color: Colors.white70.withOpacity(0.05),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: placeholder.copyWith(
                            fontSize: 10.sp, fontWeight: FontWeight.w300),
                      ),
                      IconButton(
                          onPressed: onCopy,
                          icon: const Icon(
                            Icons.content_copy_outlined,
                            color: Colors.white70,
                          )),
                      IconButton(
                          onPressed: onSend,
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.white70,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
