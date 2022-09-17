import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:trackit/core/theme/app_colors.dart';
import 'package:trackit/features/wallets/data/models/wallet.dart';

class AddWalletForm extends StatelessWidget {
  const AddWalletForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  child: const Text(
                    "Create a new wallet",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const AddWalletTextField(
              hint: "Name",
              icon: Icons.wallet_rounded,
            ),
            const SizedBox(height: 16),
            const AddWalletTextField(
              hint: "Balance",
              icon: Icons.attach_money_rounded,
              textInputType: TextInputType.number,
            ),
            const Spacer(),
            RoundedButton(
              label: 'Create a new wallet',
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              onTap: () {
                Navigator.of(context).pop(
                  Wallet(id: Random().nextInt(1000), name: "HDFC Bank", balance: 203),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddWalletTextField extends StatelessWidget {
  const AddWalletTextField({
    Key? key,
    required this.hint,
    required this.icon,
    this.textInputType,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Icon(
          icon,
          size: 32,
          color: AppColors.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            keyboardType: textInputType,
            style: const TextStyle(
              color: AppColors.text,
            ),
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.label,
    this.onTap,
    this.padding,
    this.margin,
    this.height,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 56.0,
        padding: padding,
        margin: margin,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(height != null ? height! / 2 : 28),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
