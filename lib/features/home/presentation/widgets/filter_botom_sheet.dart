import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubeCommerce/core/shared_widgets/elevated_button.dart';
import 'package:qubeCommerce/core/utils/app_utils.dart';
import 'package:qubeCommerce/injection_container.dart';
import 'package:qubeCommerce/shared/widget/loader_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../deals/deals_export.dart';
import '../../data/models/profitability_type_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.onPressedFilter});
  final Function(GetAvailableDealsModel) onPressedFilter;
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  DateTime? _startDate;
  DateTime? _endDate;
  int? _selectedIndex;
  ProfitabilityTypeModel? profitabilityTypeSelected;
  // List of options (can be dynamic)
  // final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  // Handle tap on custom radio button
  void _onOptionSelected(
      {required int index, required ProfitabilityTypeModel profitabilityType}) {
    setState(() {
      _selectedIndex = index;
      profitabilityTypeSelected = profitabilityType;
    });
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = isStartDate
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? DateTime.now());

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          // If selecting start date
          _startDate = pickedDate;
        } else {
          // If selecting end date
          if (_startDate == null || pickedDate.isAfter(_startDate!)) {
            _endDate = pickedDate;
          } else {
            // Ensure end date is after start date
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('End date must be after start date!')),
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 100,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
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
                        "تصفية",
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
            ),
            Divider(
              color: AppColors.loginColoseColor.withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Text(
                            _startDate == null
                                ? 'Select Start Date'
                                : 'Start Date: ${AppUtils.formatDateToString(_startDate!.toString())}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Text(
                            _endDate == null
                                ? 'Select End Date'
                                : 'End Date: ${AppUtils.formatDateToString(_endDate!.toString())}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final profitabilityTypes =
                            serviceLocator<HomeCubit>().profitabilityTypes;
                        if (profitabilityTypes.isEmpty)
                          return LoaderWidget.circleProgressIndicator();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            profitabilityTypes.length,
                            (index) => GestureDetector(
                              onTap: () => _onOptionSelected(
                                  index: index,
                                  profitabilityType: profitabilityTypes[index]),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? Colors.blue
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _selectedIndex == index
                                        ? Colors.blue
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      profitabilityTypes[index].name!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  elevatedButton(
                      height: 55,
                      primaryColor: AppColors.primaryColor,
                      onpressed: () {
                        Navigator.pop(context);
                        widget.onPressedFilter(GetAvailableDealsModel(
                            from: AppUtils.formatDateToString(
                                _startDate!.toString()),
                            to: AppUtils.formatDateToString(
                                _endDate!.toString()),
                            profitability: profitabilityTypeSelected?.id));
                      },
                      title: 'filter',
                      loading: false)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
