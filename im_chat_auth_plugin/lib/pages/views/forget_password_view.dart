import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/password_notice_view.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../l10n/SlocalAuth.dart';
import '../controllers/forget_password_controller.dart';

/// 忘记密码通过手机号验证码重置
class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        title: NavText(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_reset_password)),
        actions: [
          IconButton(
              onPressed: () {
                // Get.toNamed(LinkUtils.getServiceUrl());
              },
              icon: const Icon(Icons.support_agent))
        ],
      ),
      body: GetBuilder<ForgetPasswordController>(builder: (controller) {
        return FormBuilder(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_password_type),
                    style: TextStyle(
                      fontSize: FontUtils.contentFontSize,
                    ),
                  ),
                  5.verticalSpace,
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Radio<int>(
                                value: 0,
                                groupValue: controller.selectPhone ? 0 : 1,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (int? value) {
                                  controller.updateSelectType();
                                },
                              ),
                            ),
                            3.horizontalSpace,
                            Text(
                              SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone),
                              style: TextStyle(
                                fontSize: FontUtils.contentFontSize,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.updateSelectType();
                        },
                      ),
                      10.horizontalSpace,
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Radio<int>(
                                value: 0,
                                groupValue: controller.selectPhone ? 1 : 0,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (int? value) {
                                  controller.updateSelectType();
                                },
                              ),
                            ),
                            Text(
                              SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_email),
                              style: TextStyle(
                                fontSize: FontUtils.contentFontSize,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.updateSelectType();
                        },
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Column(
                    children: <Widget>[
                      if (controller.selectPhone)
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone),
                                  style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                                ),
                              ],
                            ),
                            FormBuilderTextField(
                              name: 'phone',
                              // autofocus: true,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                              ],
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint)),
                                FormBuilderValidators.match(RegexUtil.regexMobileSimple,
                                    errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint_error)),
                              ]),
                            ),
                          ],
                        ),
                      if (!controller.selectPhone)
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_email),
                                  style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                                ),
                              ],
                            ),
                            FormBuilderTextField(
                              name: 'email',
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_email_hint),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_email_hint)),
                                FormBuilderValidators.match(RegexUtil.regexEmail,
                                    errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_phone_hint_error)),
                              ]),
                            ),
                          ],
                        ),
                    ],
                  ),
                  15.verticalSpace,
                  Text(
                    SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code),
                    style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                  ),
                  FormBuilderTextField(
                    name: 'smsCode',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code_hint),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: GetBuilder<ForgetPasswordController>(
                          builder: (controller) {
                            return TextButton(
                              onPressed: controller.leftCount == 0 ? controller.onSendSms : null,
                              child: Text(
                                controller.leftCount == 0
                                    ? SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_get)
                                    : '${controller.leftCount}${SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_second)}',
                                style: TextStyle(
                                  color: controller.leftCount == 0 ? Theme.of(context).primaryColor : Colors.grey,
                                  fontSize: FontUtils.contentSubFontSize,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]")), LengthLimitingTextInputFormatter(6)],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_verification_code_hint)),
                    ]),
                  ),
                  15.verticalSpace,
                  Text(
                    SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_password),
                    style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                  ),
                  GetBuilder<ForgetPasswordController>(builder: (controller) {
                    return FormBuilderTextField(
                      name: 'password',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_set_password),
                        suffixIcon: IconButton(
                            onPressed: controller.showPassword,
                            icon: Icon(
                              controller.hidePasswordTextField ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                            )),
                      ),
                      obscureText: controller.hidePasswordTextField,
                      onChanged: (v) {
                        if (v != null) {
                          controller.submitPasswordFirst = v;
                          controller.update();
                        }
                      },
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                              errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_password_input)),
                          FormBuilderValidators.match(r"(?=.*[0-9])(?=.*[a-zA-Z]).{8,20}",
                              errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_password_validator)),
                        ],
                      ),
                    );
                  }),
                  15.verticalSpace,
                  Text(
                    SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_confirm_password),
                    style: TextStyle(fontSize: FontUtils.contentTitleFontSize),
                  ),
                  GetBuilder<ForgetPasswordController>(builder: (controller) {
                    return FormBuilderTextField(
                      name: 'passwordConfirm',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_login_passowrd_again),
                        suffixIcon: IconButton(
                            onPressed: controller.showConfirmPassword,
                            icon: Icon(controller.hideConfirmPasswordTextField ? CupertinoIcons.eye_slash : CupertinoIcons.eye)),
                      ),
                      obscureText: controller.hideConfirmPasswordTextField,
                      onChanged: (v) {
                        if (v != null) {
                          controller.submitPasswordSecond = v;
                          controller.update();
                        }
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_confirm_passowrd_not_empty)),
                        (val) {
                          var values = controller.formKey.currentState?.value;
                          if (values != null && values["password"] != null) {
                            if (val != values["password"]) {
                              return SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_confirm_password_not_equal);
                            }
                          }
                          return null;
                        }
                      ]),
                    );
                  }),
                  5.verticalSpace,
                  GetBuilder<ForgetPasswordController>(builder: (controller) {
                    return PasswordNoticeView(
                      firstPassword: controller.submitPasswordFirst,
                      secondPassword: controller.submitPasswordSecond,
                    );
                  }),
                  30.verticalSpace,
                  MainButton(
                    onPressed: controller.onSubmit,
                    text: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_submit),
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Get.toNamed(RoutesAuth.forgetPasswordNotphone);
                        },
                        child: Text(
                          SlocalAuth.getLocalizaContent(SlocalAuth.of(context).auth_reset_password_nophone),
                          style: TextStyle(
                            fontSize: FontUtils.contentFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
