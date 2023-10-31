import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_mobile_app/features/beauty_shop/presentation/cubit/beauty_services_cubit.dart';
import 'package:malina_mobile_app/features/records/data/enums/record_type.dart';
import 'package:malina_mobile_app/features/records/data/models/record.dart';
import 'package:malina_mobile_app/features/records/presentation/cubit/records_cubit.dart';
import 'package:malina_mobile_app/features/records/presentation/widgets/record_container.dart';
import 'package:malina_mobile_app/shared/configs/texts.dart';
import 'package:malina_mobile_app/shared/constants/colors.dart';
import 'package:malina_mobile_app/shared/constants/margin.dart';
import 'package:malina_mobile_app/shared/widgets/bottomsheet_container.dart';

class RecordsSheet extends StatelessWidget {
  const RecordsSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeautyServicesCubit()..load(),
      child: BottomSheetContainer(
        height: 750.h,
        hasPadding: false,
        child: Column(
          children: [
            Padding(
              padding: marginHV20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Мои записи',
                    style: h20,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: marginH,
                      width: double.infinity,
                      child: ButtonsTabBar(
                        center: false,
                        backgroundColor: AppColor.malina,
                        unselectedBorderColor: AppColor.grey,
                        borderColor: AppColor.malina,
                        borderWidth: 1,
                        unselectedBackgroundColor: AppColor.scaffold,
                        labelStyle: st16.copyWith(color: AppColor.white),
                        unselectedLabelStyle: st16,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        radius: 100,
                        height: 45,
                        tabs: const [
                          Tab(
                            text: 'Предстоящие',
                          ),
                          Tab(
                            text: 'Архив',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: BlocBuilder<RecordsCubit, RecordsState>(
                        builder: (context, state) {
                          return TabBarView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              MyRecordsList(
                                records: state.records
                                    .where(
                                      (element) =>
                                          element.type ==
                                          RecordTypeEnum.upcoming,
                                    )
                                    .toList(),
                              ),
                              MyRecordsList(
                                records: state.records
                                    .where(
                                      (element) =>
                                          element.type ==
                                          RecordTypeEnum.visited,
                                    )
                                    .toList(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRecordsList extends StatelessWidget {
  final List<RecordModel> records;
  const MyRecordsList({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MyRecordContainer(
        record: records[index],
      ),
      itemCount: records.length,
    );
  }
}
