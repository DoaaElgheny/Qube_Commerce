import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubeCommerce/features/wallet/data/models/payment_method_model.dart';
import 'package:qubeCommerce/features/wallet/presentation/widget/payment_method_card.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/shared_widgets/text_filed.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../injection_container.dart';
import '../../data/models/deposit_model.dart';
import '../../data/models/meta_data_model.dart';
import '../cubit/wallet_cubit.dart';

class WithdrawBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  final String walletId;

  WithdrawBottomSheet({required this.scrollController, required this.walletId});

  @override
  _WithdrawBottomSheetState createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<WithdrawBottomSheet> {
  String selectedPaymentMethod = 'Vodafone Cash';
  int selectedPaymentMethodId = 0;

  final walletCubit = serviceLocator<WalletCubit>();
  List<RequiredFieldModel> requiredFieldsForWithdraw = [];
  Map<String, TextEditingController> fieldControllers = {};
  final TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context, state) {
        if (state is WithdrawSuccessState) {
          Navigator.pop(context);
          walletCubit.getMyWallets();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)!
                .translate('withdraw_successfully')!),
          ));
        } else if (state is WithdrawErrorState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${"something_went_wrong"}"),
          ));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: (state is GetPaymentMethodsLoadingState)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (state is GetPaymentMethodsErrorState)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.warning_amber_rounded,
                              color: AppColors.redLinearGradientDarker,
                              size: 150,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "حدث خطأ ما ",
                              style: TextStyle(
                                  color: AppColors.redLinearGradientDarker,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                    : (walletCubit.paymentMethods.length == 0)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.warning_amber_rounded,
                                  color: AppColors.redLinearGradientDarker,
                                  size: 150,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "حدث خطأ ما ",
                                  style: TextStyle(
                                      color: AppColors.redLinearGradientDarker,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          )
                        : Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: widget.scrollController,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildHeader(context),
                                          SizedBox(height: 10),
                                          _buildAmountInput(),
                                          SizedBox(height: 20),
                                          Text(
                                            'إختر طريقة إستلام المبلغ:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          _buildPaymentMethods(
                                              walletCubit.paymentMethods),
                                          SizedBox(height: 20),
                                          _buildDynamicFields(
                                              requiredFieldsForWithdraw),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, -3),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: _buildConfirmButton(),
                                ),
                              ],
                            ),
                          ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: const DecorationImage(
          image: AssetImage('assets/images/png/ConImage2.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/png/withdrowmony.png",
                  height: 23, fit: BoxFit.cover),
              const SizedBox(width: 12),
              const Text(
                "سحب الأموال",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                width: 50,
                child: Image.asset("assets/images/png/Cancel.png")),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFiledCustom(
        isReadOnly: false,
        onTab: () {},
        onChanged: (val) {},
        isBorder: true,
        isFilled: true,
        borderColor: AppColors.primaryColor,
        vertical: 10,
        prifixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8),
            child: SvgPicture.asset(ImageAssets.money1)),
        validator: (v) {
          if (v!.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        textInputType: TextInputType.number,
        hintColor: AppColors.hintColor,
        fillColor: Colors.white,
        errorColorBorder: Colors.red,
        hintText: '1000',
        controller: amountController,
      ),
    );
  }

  Widget _buildPaymentMethods(List<PaymentMethodModel> paymentMethods) {
    List<int> allowedMethodsIds = [1, 2, 5];
    List<PaymentMethodModel> filteredMethods = paymentMethods
        .where((method) => allowedMethodsIds.contains(method.id))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: filteredMethods.map((method) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedPaymentMethod = method.name;
            });
          },
          child: PaymentMethodCard(
            label: method.name,
            img: method.logoUrl,
            isSelected: selectedPaymentMethod == method.name,
            onTap: () {
              setState(() {
                selectedPaymentMethod = method.name;
                requiredFieldsForWithdraw = method.requiredFieldsForWithdraw;
                selectedPaymentMethodId = method.id;
                _initializeFieldControllers();
              });
            },
          ),
        );
      }).toList(),
    );
  }

  void _initializeFieldControllers() {
    fieldControllers.clear();
    for (var field in requiredFieldsForWithdraw) {
      fieldControllers[field.key] = TextEditingController();
    }
  }

  Widget _buildDynamicFields(
      List<RequiredFieldModel> requiredFieldsForWithdraw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: requiredFieldsForWithdraw.map((field) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Localized Field Name
              Text(
                AppLocalizations.of(context)!.isEnLocale
                    ? field.fieldNameEn
                    : field.fieldNameAr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(height: 10),

              // Dynamic Input Field
              TextFiledCustom(
                isReadOnly: false,
                onTab: () {},
                onChanged: (val) {},
                isBorder: true,
                isFilled: true,
                borderColor: Colors.blue,
                // Adjust color as needed
                vertical: 10,
                suffixIcon: null,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
                textInputType: _getTextInputType(field),
                // Dynamically set input type
                hintColor: Colors.grey,
                // Adjust as needed
                fillColor: Colors.white,
                errorColorBorder: Colors.red,
                hintText: AppLocalizations.of(context)!.isEnLocale
                    ? field.fieldNameEn
                    : field.fieldNameAr,

                controller: fieldControllers[field.key]!,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  TextInputType _getTextInputType(RequiredFieldModel field) {
    switch (field.key) {
      case 'WalletNumber':
      case 'AccountNumber':
      case 'IBAN':
        return TextInputType.number;
      case 'ReceiptImage':
        return TextInputType.text;
      case 'Email':
        return TextInputType.emailAddress;
      case 'Phone':
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  Widget _buildConfirmButton() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () {
            (state is WithdrawLoadingState)
                ? null
                : (_formKey.currentState!.validate()
                    ? _submitWithdraw()
                    : null);
          },
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xFFA6BE52), Color(0xFF24774C)]),
            ),
            child: (state is WithdrawLoadingState)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Center(child: LinearProgressIndicator()),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/png/Walletplus.png",
                          height: 16, width: 16, fit: BoxFit.cover),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'سحب',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void _submitWithdraw() {
    List<MetaDataModel> metaData = requiredFieldsForWithdraw.map((field) {
      return MetaDataModel(
        key: field.key,
        value: fieldControllers[field.key]?.text ?? '',
      );
    }).toList();

    final withdrawModel = DepositModel(
        paymentMethodId: selectedPaymentMethodId,
        amount: int.parse(amountController.text),
        metaData: metaData,
        walletId: widget.walletId);
    walletCubit.makeWithdraw(withdrawModel: withdrawModel);
  }
}
