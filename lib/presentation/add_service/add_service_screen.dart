import 'package:ananta/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'controller/add_service_controller.dart';
import 'models/client_location_model.dart';
import 'models/client_model.dart';
import 'models/company_model.dart';
import 'models/equipment_model.dart';
import 'models/service_type_model.dart'; // ignore_for_file: must_be_immutable

class AddServiceScreen extends GetWidget<AddServiceController> {
  AddServiceScreen({Key? key})
      : super(
          key: key,
        );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:  Text(
            "lbl_add_service".tr,
            style: theme.textTheme.headlineSmall,
          ),

      ),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.v),
                  Obx(()=>
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Center(
                          child: DropdownButtonFormField<CompanyModel>(
                            //isDense: true,
                            hint: Text('Company',style:TextStyle(fontSize:14,color:Colors.black)),
                            iconSize: 24,
                            elevation: 16,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray900,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              controller.companyModel.value=value!;
                            },
                            items: controller.companyList!.value
                                .map<DropdownMenuItem<CompanyModel>>(
                                    (CompanyModel value) {
                                  return DropdownMenuItem<CompanyModel>(
                                    value: value,
                                    child: Text(value.name!),
                                  );
                                }).toList(),
                            validator: (CompanyModel? value) {
                              return value == null ? "Select Company" : null;
                            },
                          ),
                        ),
                      )),
                  SizedBox(height: 16.v),
                  Obx(()=>
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Center(
                          child: DropdownButtonFormField<ClientModel>(
                            //isDense: true,
                            hint: Text('Client',style:TextStyle(fontSize:14,color:Colors.black)),
                            iconSize: 24,
                            elevation: 16,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray900,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              controller.clientModel.value=value!;
                            },
                            items: controller.clientList!.value
                                .map<DropdownMenuItem<ClientModel>>(
                                    (ClientModel value) {
                                  return DropdownMenuItem<ClientModel>(
                                    value: value,
                                    child: Text(value.name!),
                                  );
                                }).toList(),
                            validator: (ClientModel? value) {
                              return value == null ? "Select Client" : null;
                            },
                          ),
                        ),
                      ),),
                  SizedBox(height: 16.v),
                  Obx(()=>
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Center(
                          child: DropdownButtonFormField<ClientLocationModel>(
                            //isDense: true,
                            hint: Text('Client Location',style:TextStyle(fontSize:14,color:Colors.black)),
                            iconSize: 24,
                            elevation: 16,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.h),
                                borderSide: BorderSide(
                                  color: appTheme.gray900,
                                  width: 1,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              controller.clientLocationModel.value=value!;
                            },
                            items: controller.clientLocationList!.value
                                .map<DropdownMenuItem<ClientLocationModel>>(
                                    (ClientLocationModel value) {
                                  return DropdownMenuItem<ClientLocationModel>(
                                    value: value,
                                    child: Text(value.name!),
                                  );
                                }).toList(),
                            validator: (ClientLocationModel? value) {
                              return value == null ? "Select ClientLocation" : null;
                            },
                          ),
                        ),
                      ),),
                  SizedBox(height: 16.v),
                   Obx(()=>
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.h),
                         child: Center(
                           child: DropdownButtonFormField<ServiceTypeModel>(
                             //isDense: true,
                             hint: Text('Service Type',style:TextStyle(fontSize:14,color:Colors.black)),
                             iconSize: 24,
                             elevation: 16,
                             decoration: InputDecoration(
                               contentPadding:
                               EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4.h),
                                 borderSide: BorderSide(
                                   color: appTheme.gray900,
                                   width: 1,
                                 ),
                               ),
                             ),
                             style: TextStyle(color: Colors.black),
                             onChanged: (value) {
                               controller.serviceTypeModel.value=value!;
                             },
                             items: controller.serviceTypeList!.value
                                 .map<DropdownMenuItem<ServiceTypeModel>>(
                                     (ServiceTypeModel value) {
                                   return DropdownMenuItem<ServiceTypeModel>(
                                     value: value,
                                     child: Text(value.name!),
                                   );
                                 }).toList(),
                             validator: (ServiceTypeModel? value) {
                               return value == null ? "Select Service" : null;
                             },
                           ),

                         ),
                       ),),
                  SizedBox(height: 16.v),
                  Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.h),
                         child: Center(
                           child: DropdownButtonFormField<SelectionPopupModel>(
                             //isDense: true,
                             hint: Text('System Down',style:TextStyle(fontSize:14,color:Colors.black)),
                             iconSize: 24,
                             elevation: 16,
                             decoration: InputDecoration(
                               contentPadding:
                               EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4.h),
                                 borderSide: BorderSide(
                                   color: appTheme.gray900,
                                   width: 1,
                                 ),
                               ),
                             ),
                             style: TextStyle(color: Colors.black),
                             onChanged: (value) {
                               controller.selectPopupModel.value=value!;
                             },
                             items: controller.dropdownItemList.value
                                 .map<DropdownMenuItem<SelectionPopupModel>>(
                                     (SelectionPopupModel value) {
                                   return DropdownMenuItem<SelectionPopupModel>(
                                     value: value,
                                     child: Text(value.title),
                                   );
                                 }).toList(),
                             validator: (SelectionPopupModel? value) {
                               return value == null ? "Select System Down" : null;
                             },

                           ),
                         ),
                       ),
                  SizedBox(height: 16.v),
                   Obx(()=>
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 16.h),
                         child: Center(
                           child: DropdownButtonFormField<EquipmentType>(
                             //isDense: true,
                             hint: Text('Equipment Type',style:TextStyle(fontSize:14,color:Colors.black)),
                             iconSize: 24,
                             elevation: 16,
                             decoration: InputDecoration(
                               contentPadding:
                               EdgeInsets.fromLTRB(16.h, 19.v, 16.h, 17.v),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4.h),
                                 borderSide: BorderSide(
                                   color: appTheme.gray900,
                                   width: 1,
                                 ),
                               ),
                             ),
                             style: TextStyle(color: Colors.black),
                             onChanged: (value) {
                               controller.equipmentModel.value=value!;
                             },
                             items: controller.equipmentList!.value
                                 .map<DropdownMenuItem<EquipmentType>>(
                                     (EquipmentType value) {
                                   return DropdownMenuItem<EquipmentType>(
                                     value: value,
                                     child: Text(value.name!),
                                   );
                                 }).toList(),
                             validator: (EquipmentType? value) {
                               return value == null ? "Select Equipment" : null;
                             },
                           ),
                         ),
                       ),),
                  SizedBox(height: 16.v),
                  _buildUsername(),
                  SizedBox(height: 16.v),
                  _buildUserComplain(),
                  SizedBox(height: 16.v),
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
  Widget _buildUsername() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.firstNameController,
        labelText: "User Name",
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "User Name",
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        alignment: Alignment.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter User Name";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }






  /// Section Widget
  Widget _buildUserComplain() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomFloatingTextField(
        controller: controller.userComplainController,
        labelText: "User Complain",
        textInputType: TextInputType.text,
        // labelStyle: theme.textTheme.bodyLarge!,
        hintText: "User Complain",
        alignment: Alignment.center,
        hintStyle:TextStyle(fontSize:14,color:Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter User Complain";
          }
          return null;
        },
        borderDecoration: FloatingTextFormFieldStyleHelper.outlineGrayTL42,
      ),
    );
  }

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
          controller.addService(context);
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone() {
    Get.back();
  }
}
