import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/finance_list_controller/finance_list_controller.dart';
import 'package:teresa/views/pages/home/home_finances/list_detail_component/finance_list_detail_component.dart';
import 'package:get/get.dart';
class HomeFinance extends StatelessWidget {
  HomeFinance({Key? key}) : super(key: key);

  final financeListController=Get.put(FinanceListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left:Dimensions.width21,right: Dimensions.width21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Finance",style: TextStyle(
                  fontSize: Dimensions.height20,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold
              ),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date between",
                    style: TextStyle(
                        fontSize: Dimensions.height11,
                        fontFamily: "Helvetica",
                        color: const Color(AppColors.STRONG_BLUE)
                    ),),
                  SizedBox(height: Dimensions.height5,),
                  Container(
                    height: Dimensions.height33,
                    width: Dimensions.width200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius19)),
                      color: const Color(AppColors.WHITE),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                          Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            financeListController.fromDateFinance(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  size: Dimensions.height11,
                                  color: const Color(AppColors.DARK_GRAY)),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              Obx(() => Text(financeListController.fromDate.value.isNotEmpty?financeListController.fromDate.value:"start",
                                  style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: Dimensions.height12,
                                      color: const Color(AppColors.DARK_GRAY)))),
                            ],
                          ),
                        ),
                        SizedBox(width: Dimensions.width7,),
                        Container(
                          width: 1,
                          height: Dimensions.height17,
                          color: const Color(AppColors.STRONG_CYAN),
                        ),
                        SizedBox(width: Dimensions.width7,),
                        GestureDetector(
                          onTap: (){
                            financeListController.toDateFinance(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  size: Dimensions.height11,
                                  color: const Color(AppColors.DARK_GRAY)),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              Obx(() => Text(financeListController.toDate.value.isNotEmpty?financeListController.toDate.value:"end",
                                  style: TextStyle(
                                      fontFamily: "Helvetica",
                                      fontSize: Dimensions.height12,
                                      color: const Color(AppColors.DARK_GRAY))))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: Dimensions.height20,),
        Flexible(child: PagedListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: Dimensions.height20,),
          pagingController: financeListController.pageController,
          builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return FinanceListDetailComponent(
                  data:item
                );
              }
          ),
        ))
      ],
    );
  }
}
