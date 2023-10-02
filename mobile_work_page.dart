  Widget listMobileViewObject(
      {required StudentPlusWorkModel studentWorkModel, required int index}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(left: 0, right: 24),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          /*-------------------------User Activity Track START----------------------------*/

          if (studentWorkModel.assessmentImageC == null ||
              studentWorkModel.assessmentImageC == '') {
            Utility.currentScreenSnackBar(
                StudentPlusOverrides.studentWorkSnackbar, null,
                marginFromBottom: 120);
          } else {
            showDialog(
                useRootNavigator: true,
                context: context,
                builder: (_) =>
                    ImagePopup(imageURL: studentWorkModel.assessmentImageC!));
          }
        },
        child: Container(
          // constraints: BoxConstraints(
          //   minHeight: _height, // Set your minimum height here
          // ),
          // height: MediaQuery.of(context).size.height < 400
          //     ? MediaQuery.of(context).size.height * 0.2
          //     : MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: (index % 2 == 0)
                  ? Theme.of(context).colorScheme.background ==
                          Color(0xff000000)
                      ? Color(0xff162429)
                      : Color(
                          0xffF7F8F9) //Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.background ==
                          Color(0xff000000)
                      ? Color(0xff111C20)
                      : Color(0xffE9ECEE)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      constraints: BoxConstraints(
                        minHeight: _height, // Set your minimum height here
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: _buildCircle(studentWorkModel: studentWorkModel))),
             SizedBox(width: 8,),
              Expanded(
                flex: WebResponsive.isMobileLarge(context) ? 5 : 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  child:  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utility.textWidget(
                       
                          text: "${studentWorkModel.nameC!}  ",
                          context: context,
                          textTheme: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize:
                                      WebAppTheme.calculateWebTextSize(
                                         minimumsize: 14,
                                          size: WebAppTheme
                                              .titleSmallTextSize,
                                          context: context))),
                                            SizedBox(height: 4,),
                      Text(
                        "${Utility.convertDateUSFormat(studentWorkModel.dateC)}  | ${studentWorkModel.firstName ?? ''} ${studentWorkModel.lastName ?? ''}",
                       textAlign: TextAlign.start,
                        style:Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize:
                                      WebAppTheme.calculateWebTextSize(
                                         minimumsize: 14,
                                          size: WebAppTheme
                                              .titleSmallTextSize,
                                          context: context),

                              )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    child: Icon(
                        IconData(0xe88c,
                            fontFamily: Overrides.kFontFam,
                            fontPackage: Overrides.kFontPkg),
                        size: AdaptiveIconSize().getAdaptiveIconSize(
                            context: context, size: 18, minimumSize: 16),
                        color: AppTheme.kButtonColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
