import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trackit/core/theme/app_colors.dart';
import 'package:trackit/features/wallets/data/models/wallet.dart';
import 'package:trackit/features/wallets/presentation/providers/wallet_count_provider.dart';

class AddWalletForm extends StatefulWidget {
  const AddWalletForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWalletForm> createState() => _AddWalletFormState();
}

class _AddWalletFormState extends State<AddWalletForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: SafeArea(
        child: Form(
          key: formKey,
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
              AddWalletTextField(
                hint: "Name",
                icon: Icons.wallet_rounded,
                controller: nameController,
                validator: (value) {
                  if ((value ?? "").isEmpty) return "Name is required";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AddWalletTextField(
                hint: "Balance",
                icon: Icons.attach_money_rounded,
                textInputType: TextInputType.number,
                controller: balanceController,
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, child) {
                  return RoundedButton(
                    label: 'Create a new wallet',
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    onTap: () {
                      if (!(formKey.currentState?.validate() ?? false)) return;

                      int _balance = 0;

                      if (balanceController.text.isNotEmpty) {
                        _balance = int.parse(balanceController.text);
                      }

                      Navigator.of(context).pop(
                        Wallet(
                          id: ref.watch(walletCount) + 1,
                          name: nameController.text,
                          balance: _balance,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
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
    required this.controller,
    this.validator,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

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
            controller: controller,
            keyboardType: textInputType,
            style: const TextStyle(
              color: AppColors.text,
            ),
            validator: validator,
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
          borderRadius:
              BorderRadius.circular(height != null ? height! / 2 : 28),
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
