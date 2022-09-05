import 'package:cryptodesign/Common/CommonColors.dart';
import 'package:cryptodesign/Common/DynamicSizes.dart';
import 'package:cryptodesign/Common/Navigators.dart';
import 'package:cryptodesign/Widgets/CustomText.dart';
import 'package:cryptodesign/Widgets/CustomTextField.dart';
import 'package:cryptodesign/Widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class TradePart extends StatefulWidget {
  int tabIndex;
  TradePart({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  State<TradePart> createState() => _TradePartState();
}

class _TradePartState extends State<TradePart> {
  String _currentSelectedValue = 'Limit';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _currentSelectedValue == 'Limit'
          ? 440
          : _currentSelectedValue == 'Market'
              ? 250
              : 520,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: CommonColors().appTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: CommonColors().grey, blurRadius: 5),
                      ]),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      // value: _currentSelectedValue,
                      icon: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: CommonColors().white(context),
                      ),
                      hint: CustomText(
                        _currentSelectedValue,
                        color: CommonColors().white(context),
                        fontWeight: FontWeight.w500,
                      ),
                      isDense: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _currentSelectedValue = newValue!;
                        });
                      },
                      items:
                          ['Limit', 'Market', 'stop limit'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: CustomText(
                            value,
                            color: CommonColors().black(context),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            _currentSelectedValue == 'stop limit'
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomTextFormField(
                      hintText: 'Stop',
                    ),
                  )
                : SizedBox(),
            _currentSelectedValue != 'Market'
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomTextFormField(
                      hintText: 'Limit',
                    ),
                  )
                : SizedBox(),
            _currentSelectedValue != 'Market'
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomTextFormField(
                      hintText: 'Amount',
                    ),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter value';
                  }
                  return null;
                },
                hintText: 'Price',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  NavigatorsCommon().backPage(context);
                },
                child: RoundedButton(
                  text: widget.tabIndex == 0 ? 'Buy' : 'Sell',
                  textColor: CommonColors().white(context),
                  buttonColor:
                      widget.tabIndex == 0 ? Colors.green : CommonColors().red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
