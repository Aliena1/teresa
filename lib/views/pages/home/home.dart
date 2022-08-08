import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teresa/constants/api_constants/api_constant.dart';
import 'package:teresa/constants/colors/colors.dart';
import 'package:teresa/constants/dimensions/dimensions.dart';
import 'package:teresa/constants/icons/app_icons.dart';
import 'package:teresa/controllers/home_controller/home_controller.dart';
import 'package:teresa/helpers/helperFunction/helperFunctions.dart';
import 'package:teresa/views/pages/home/components/home_blacklisted/home_blacklisted.dart';
import 'package:teresa/views/pages/home/components/home_complete_profile/home_complete_profile.dart';
import 'package:teresa/views/pages/home/components/navigation_components/navigation_components.dart';
import 'package:teresa/views/pages/home/home_active_jobs/home_active_jobs.dart';
import 'package:teresa/views/pages/home/home_available_job/home_available_job.dart';
import 'package:teresa/views/pages/home/home_available_job/home_available_job_empty/home_availability_job_empty.dart';
import 'package:teresa/views/pages/home/home_finances/home_finance.dart';
import 'package:teresa/views/pages/home/home_wallet/home_wallet.dart';
import 'package:teresa/views/pages/notification/notification.dart';
import 'package:teresa/views/widgets/skeleton_user_detail/skeleton_user_detail.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.put(HomeController());
  final helperFunction = HelperFunction();
  @override
  initState(){
    helperFunction.getUserDetail();
     super.initState();
   }

   @override
  void dispose() {
    homeController.selected.value=0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(AppColors.WHITE),
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool boxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: Dimensions.height260,
                      flexibleSpace: Container(
                        color: Colors.white,
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height27,
                                  left: Dimensions.width25,
                                  right: Dimensions.width25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Dimensions.width40,
                                    height: Dimensions.height40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),

                                  ),
                                  Image.asset(
                                    "assets/icon.png",
                                    height: Dimensions.height58,
                                  ),
                                  Container(
                                    width: Dimensions.width50,
                                    height: Dimensions.height50,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: IconButton(
                                        alignment: Alignment.center,
                                        splashRadius: Dimensions.height35,
                                        constraints: BoxConstraints(),
                                        onPressed: (){
                                          Get.to(() =>
                                              TeresaNotification());
                                        }, icon: Stack(
                                      children: [
                                        Positioned(
                                          bottom: Dimensions.height4,
                                          right: Dimensions.width10,
                                          child: Icon(Icons.notifications_none,
                                            color: const Color(
                                                AppColors.STRONG_BLUE),
                                            size: Dimensions.height24,),),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              width: Dimensions.width17,
                                              height: Dimensions.height17,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          Dimensions
                                                              .radius100))),
                                              child: Center(
                                                child: Text(
                                                  "3",
                                                  style: TextStyle(
                                                      color: const Color(
                                                          AppColors.WHITE),
                                                      fontSize:
                                                      Dimensions.height9),
                                                ),
                                              ),))
                                      ],
                                    )),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height22,
                            ),
                            Obx(() => helperFunction.isLoading.value?const SkeletonUserDetail():Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: Dimensions.width110,
                                        height: Dimensions.height129,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimensions.radius8)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${ApiConstants.IMAGE_BASE}${helperFunction.userDetails.profileImage!}"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            helperFunction.userDetails.fullName!,
                                            style: TextStyle(
                                                fontSize: Dimensions.height20,
                                                color: const Color(
                                                    AppColors.STRONG_BLUE),
                                                fontFamily: "Helvetica",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height6,
                                          ),
                                          Text(
                                            "+977-06177201",
                                            style: TextStyle(
                                                fontSize: Dimensions.height13,
                                                color: Colors.black,
                                                fontFamily: "Helvetica",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height6,
                                          ),
                                          Text(
                                            helperFunction.userDetails.profession!,
                                            style: TextStyle(
                                              fontSize: Dimensions.height15,
                                              color: const Color(
                                                  AppColors.STRONG_CYAN),
                                              fontFamily: "Helvetica",
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height17,
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NavigationComponents(
                          name: "Active Job",
                          icon: Icons.work,
                          index: 0,
                          selected: homeController.selected.value,
                          onPressed: () {
                            homeController.changeTab(0);
                          },
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        NavigationComponents(
                          name: "Available Job",
                          icon: Icons.work,
                          index: 1,
                          selected: homeController.selected.value,
                          onPressed: () {
                            homeController.changeTab(1);
                          },
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        NavigationComponents(
                          name: "Finance",
                          icon: Icons.stacked_bar_chart,
                          index: 2,
                          selected: homeController.selected.value,
                          onPressed: () {
                            homeController.changeTab(2);
                          },
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        NavigationComponents(
                          name: "Your Wallet",
                          icon: Icons.wallet,
                          index: 3,
                          selected: homeController.selected.value,
                          onPressed: () {
                            homeController.changeTab(3);
                          },
                        )
                      ],
                    )),
                    SizedBox(
                      height: Dimensions.height35,
                    ),
                    Flexible(
                        child: PageView(
                          controller: homeController.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            HomeActiveJobs(),
                            HomeAvailableJob(),
                            HomeFinance(),
                            HomeWallet()
                          ],
                        ))
                  ],
                ))));
  }
}
