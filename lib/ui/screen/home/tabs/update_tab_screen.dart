import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../states/cubit/theme/cubit/theme_cubit.dart';

class HomeUpdateScreen extends StatefulWidget {
  const HomeUpdateScreen({super.key});

  @override
  State<HomeUpdateScreen> createState() => _HomeUpdateScreenState();
}

class _HomeUpdateScreenState extends State<HomeUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                color: AppColors.cultured.withOpacity(0.1),
                child: const CircleAvatar(
                  maxRadius: 50,
                  minRadius: 40,
                  backgroundImage: AssetImage("assets/images/Logo.png"),
                  backgroundColor: AppColors.cultured,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên truyện',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        'Tên tác giả',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Tình trạng: ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.blue,
                            fontFamily: AppFonts.charis,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Chưa rỡ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Ngày tháng năm',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
