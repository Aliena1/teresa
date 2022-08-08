import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/controllers/withdraw_list_controller/withdraw_list_controller.dart';
import 'package:teresa/helpers/helperFunction/helperFunctions.dart';
import 'package:teresa/views/pages/home/home_wallet/wallet_list_detail_component/wallet_list_detail_component.dart';
import 'package:teresa/views/widgets/common_button/common_button.dart';
class HomeWallet extends StatelessWidget {
  HomeWallet({Key? key}) : super(key: key);
  final withdrawListController=Get.put(WithdrawListController());
  final helperFunction=Get.put(HelperFunction());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: Dimensions.width28),child: Text("Your Wallet",style: TextStyle(
            fontSize: Dimensions.height20,
            fontFamily: "Helvetica",
            fontWeight: FontWeight.bold
        ),)),
        SizedBox(height: Dimensions.height29,),
        Center(
          child: Container(
            padding: EdgeInsets.only(
              left: Dimensions.width23,
              right: Dimensions.width23
            ),
            width: Dimensions.width271,
            height: Dimensions.height125,
            decoration: BoxDecoration(
              color: const Color(AppColors.VERY_PALE_MOSTLY_WHITE_BLUE),
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius8))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Amount available ",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                      color: const Color(AppColors.STRONG_BLUE)
                    ),),
                    Text("\$${withdrawListController.walletAmount}",style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: Dimensions.height18,
                        fontWeight: FontWeight.bold,
                        color: const Color(AppColors.STRONG_BLUE)
                    ),)
                  ],
                ),
                SizedBox(height:Dimensions.height21),
                Center(
                  child: CommonButton(
                    height: Dimensions.height45,
                    width: Dimensions.width160,
                    color: AppColors.STRONG_BLUE,
                    fontSize: Dimensions.height15,
                    radius: Dimensions.radius8,
                    name: "Withdraw request",
                    onPressed: (){},
                  ),
                )

              ],
            ),
          ),
        ),
        SizedBox(height: Dimensions.height32,),
        Padding(padding: EdgeInsets.only(left: Dimensions.width28),child: Text("Withdrawal request",style: TextStyle(
          color: const Color(AppColors.STRONG_CYAN),
          fontSize: Dimensions.height18,
          fontFamily: "Helvetica",
        ),),),
        SizedBox(height: Dimensions.height18,),
        Flexible(child: PagedListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: Dimensions.height20,),
          pagingController: withdrawListController.pageController,
          builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return WalletListDetailComponent(
                    data:item
                );

              }
          ),
        ))

      ],
    );
  }
}
