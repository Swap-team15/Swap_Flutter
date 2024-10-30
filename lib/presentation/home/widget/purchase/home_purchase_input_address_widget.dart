import 'package:flutter/material.dart';
import 'package:swap/core/component/swap_text_field.dart';
import 'package:swap/core/constants/swap_style.dart';

class HomePurchaseInputAddressWidget extends StatelessWidget {
  final TextEditingController addressController, detailAddressController;
  final FocusNode addressFocusNode, detailAddressFocusNode;

  const HomePurchaseInputAddressWidget({
    super.key,
    required this.addressController,
    required this.detailAddressController,
    required this.addressFocusNode,
    required this.detailAddressFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: SwapColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: SwapColor.gray50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SwapTextField(
                  controller: addressController,
                  focusNode: addressFocusNode,
                  search: true,
                  hintText: "住所検索です",
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: SwapColor.gray100,
                    ),
                  ),
                ),
                SwapTextField(
                  controller: detailAddressController,
                  focusNode: detailAddressFocusNode,
                  hintText: "詳細アドレスを入力します",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
