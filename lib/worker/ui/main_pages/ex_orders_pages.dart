import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:team_projects/core/widgets/default_border_button.dart';
import 'package:team_projects/logic/reservation/reservation_cubit.dart';
import 'package:team_projects/worker/ui/subpages/ex_orders_pages/denied_order_page.dart';
import 'package:team_projects/worker/ui/subpages/ex_orders_pages/done_orders_page.dart';



class ExOrdersPages extends StatefulWidget {
  const ExOrdersPages({super.key});

  @override
  State<ExOrdersPages> createState() => _ExOrdersPagesPagesState();
}

class _ExOrdersPagesPagesState extends State<ExOrdersPages> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Orders',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 4.h),
                  BlocProvider(
                    create: (context) => ReservationCubit(),
                    child: BlocBuilder<ReservationCubit, ReservationState>(
                      builder: (context, state) {
                        var cubit = ReservationCubit.get(context);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefultBorderButton(
                              isOutline: cubit.currentIndexEXOrdersWorker == 1
                                  ? true
                                  : false,
                              title: 'Done',
                              onPressed: () {
                                cubit.chagenIndexExOrdersWorker(0);
                                pageController.jumpToPage(0);
                              },
                              size: 42.w,
                            ),
                            DefultBorderButton(
                              isOutline: cubit.currentIndexEXOrdersWorker == 0
                                  ? true
                                  : false,
                              title: 'Denied',
                              size: 42.w,
                              onPressed: () {
                                cubit.chagenIndexExOrdersWorker(1);
                                pageController.jumpToPage(1);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: const [
                        DoneOrderPage(),
                        DeniedOrderPage(),
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}