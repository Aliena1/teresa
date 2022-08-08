import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:get/get.dart';
import 'package:teresa/views/pages/available_job/pdf_view_sheet/pdf_view_sheet.dart';
PdfViewSheet(context,path,link){
  PdfViewerController _pdfViewerController=PdfViewerController();
  final pdfViewSheetController=Get.put(PdfViewerController());
  RxInt pageNum=0.obs;
  RxInt totalPage=0.obs;
  RxDouble value=1.0.obs;
  RxInt percentage=0.obs;



  _pdfViewerController.addListener(({property}) {
      pageNum.value=_pdfViewerController.pageNumber;
      totalPage.value=_pdfViewerController.pageCount;
  });


  void increaseZoom(){
    if(value>=1.0 && value<3.0){
      value.value+=0.2;

      String inString = value.value.toStringAsFixed(2); // '2.35'
      double inDouble = double.parse(inString); // 2.35
      print((inDouble-1));
      percentage.value=((inDouble-1)*100/2).toInt();
      print(value.value);
      _pdfViewerController.zoomLevel=value.value;
    }

  }

  void decreaseZoom(){
    if(value>1.0 && value<=3.0000000000000004){
      value.value-=0.2;
      percentage.value=((value.value-1)*100/2).toInt();
      print(value.value);
      _pdfViewerController.zoomLevel=value.value;
    }
  }

  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context, builder: (context){
    return Container(
      width: Dimensions.screenWidth,
      height: Dimensions.screenHeight*0.90,
      child: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            height: Dimensions.height40,
            color: Color(AppColors.VERY_DARK_GRAYISH_BLUE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Dimensions.width120,
                  height: Dimensions.height2,
                  color: const Color(AppColors.WHITE),
                )
              ],
            ),
          ),
          Flexible(
            child: SfPdfViewer.network(
              "${ApiConstants.IMAGE_BASE}${path}${link}",
              controller: _pdfViewerController,
                scrollDirection: PdfScrollDirection.vertical,
            ),
          )
        ],
      )
    );
  });
}
