import 'package:flutter/material.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
class WalletListDetailComponent extends StatelessWidget {
  WalletListDetailComponent({Key? key,this.data}) : super(key: key);
  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height68,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dimensions.width28,right: Dimensions.width21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: Dimensions.height24,),
                    Text(data.requestedDate,style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                    ),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: Dimensions.height24,),
                    Text("\$${data.withdrawFund}",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                    ),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cr/Dr",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: Dimensions.height24,),
                    Text(data.crDr,style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                    ),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status",style: TextStyle(
                      fontFamily: "Helvetica",
                      fontSize: Dimensions.height9,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: Dimensions.height24,),
                    Container(
                      width: Dimensions.width68,
                      height: Dimensions.height22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius19)),
                        color: Color(AppColors.STRONG_CYAN),

                      ),
                      child: Center(
                        child: Text(data.status,style: TextStyle(
                            color: const Color(AppColors.WHITE),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Helvetica",
                            fontSize: Dimensions.height9
                        ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height48,
                decoration: BoxDecoration(
                    color: Color(AppColors.WHITE),
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffF1F1F1).withOpacity(0.0),
                        Color(0xffE5E5E5).withOpacity(0.4),
                      ],
                    )
                ),
              ))
        ],
      ),
    );
  }
}
