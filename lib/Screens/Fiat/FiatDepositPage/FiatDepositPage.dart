import 'dart:io';

import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Screens/Fiat/CustomWidgets/RowText.dart';
import 'package:cryptodesign/Widgets/Backgrounds/BackgroundUI.dart';
import 'package:cryptodesign/Widgets/CustomAppBar.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedBoxButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FiatDepositPage extends StatefulWidget {
  const FiatDepositPage({Key? key}) : super(key: key);

  @override
  State<FiatDepositPage> createState() => _FiatDepositPageState();
}

class _FiatDepositPageState extends State<FiatDepositPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundUI(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: 'Fiat Deposit'),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CommonColors().white(context),
                          boxShadow: [
                            BoxShadow(
                                color: CommonColors().grey, blurRadius: 5),
                          ]),
                      width: DynamicSizes().dynamicWidth(context, 0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RowText(
                              firstText: 'Bank Account Name',
                              lastText: '123456789',
                              // priceValue: '0.15 USD',
                            ),
                            RowText(
                                firstText: 'Reference Number',
                                lastText: '12345678'),
                            RowText(firstText: 'IBAN', lastText: '12345678'),
                            RowText(firstText: 'SWIFT', lastText: '12345678'),
                            RowText(
                                firstText: 'IFSC Code',
                                lastText: 'SBIN8987823'),
                            RowText(firstText: 'Country', lastText: 'India'),
                            RowText(
                                firstText: 'Bank Address',
                                lastText: 'SBI india'),
                            RowText(
                                firstText: 'Account Holder Name',
                                lastText: 'Clarisco'),
                            RowText(
                                firstText: 'Account Holder Address',
                                lastText: 'Clarisco Solutions pvt ltd'),
                            RowText(
                                firstText: 'Note',
                                lastText: 'Deposit to the bank account'),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: CustomText(
                  'Amount:',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: DynamicSizes().dynamicWidth(context, 0.9),
                  child: CustomTextFormField(
                    hintText: 'Enter Amount',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: CustomText(
                  'Note:',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: DynamicSizes().dynamicWidth(context, 0.9),
                  child: CustomTextFormField(
                    hintText: 'Enter Note',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: CustomText(
                  'Receipt:',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 8, 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final XFile? photo = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (photo != null) {
                          setState(() {
                            _imageFile = photo;
                          });
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                                color: CommonColors().black(context),
                                blurRadius: 3.0)
                          ],
                        ),
                        child: _imageFile != null
                            ? Image.file(
                                File(_imageFile!.path),
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.cloud_upload,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    'Drag an image file here',
                                    color: Colors.grey,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText('Allowed types: jpg, png'),
                          CustomText('Max filesize: 1MB')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedBoxButton(
                    text: 'Make a deposit',
                    width: DynamicSizes().dynamicWidth(context, 0.9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
