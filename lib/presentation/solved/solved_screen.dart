import 'package:ananta/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'controller/solved_controller.dart';
 // ignore_for_file: must_be_immutable

class SolvedScreen extends GetWidget<SolvedController> {
  SolvedScreen({Key? key})
      : super(
    key: key,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:  Text(
          "Solved Service",
          style: theme.textTheme.headlineSmall,
        ),

      ),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 25.v),

                  Signature(
                    key: const Key('signature'),
                    controller: controller.controller,
                    height: 400,
                    backgroundColor: Colors.black,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //SHOW EXPORTED IMAGE IN NEW ROUTE
                      IconButton(
                        key: const Key('exportPNG'),
                        icon: const Icon(Icons.image),
                        color: Colors.black,
                        onPressed: () => controller.exportImage(context),
                        tooltip: 'Export Image',
                      ),

                      IconButton(
                        icon: const Icon(Icons.undo),
                        color: Colors.black,
                        onPressed: () {
                         controller.controller.undo();
                        },
                        tooltip: 'Undo',
                      ),
                      IconButton(
                        icon: const Icon(Icons.redo),
                        color: Colors.black,
                        onPressed: () {
                          controller.controller.redo();
                        },
                        tooltip: 'Redo',
                      ),
                      //CLEAR CANVAS
                      IconButton(
                        key: const Key('clear'),
                        icon: const Icon(Icons.clear),
                        color: Colors.black,
                        onPressed: () {
                          controller.controller.clear();
                        },
                        tooltip: 'Clear',
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildContinue(context),
    );
  }

  /// Section Widget







  /// Section Widget

  /// Section Widget
  /// Section Widget
  Widget _buildContinue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: CustomElevatedButton(
        text: "Submit",
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        buttonTextStyle: CustomTextStyles.titleSmallOnErrorContainer_1,
        onPressed: () {
           controller.addFeedback(context);
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
