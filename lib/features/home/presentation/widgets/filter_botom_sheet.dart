import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/shared_widgets/app_text.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';


class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return  ConstrainedBox(
        constraints:  BoxConstraints(
        maxHeight:  MediaQuery.of(context).size.height-100,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  width: 45,
                  height: 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.linkedInMediumGrey.withOpacity(0.4)),
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: 'filtering',
                      color: AppColors.loginTitleColor,
                      weight: FontWeight.w400,
                      fontSize: 16,
                      align: TextAlign.start,
                    ),
                    InkWell(onTap:(){
                      Navigator.pop(context);
                    },child: SvgPicture.asset(ImageAssets.close_button))
                  ],
                ),
              ),
              Divider(color: AppColors.loginColoseColor.withOpacity(0.3),),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // CheckBoxWidget(
                        //   context: context,
                        //   title: AppLocalizations.of(context)!
                        //       .translate('filter_categories')!,
                        //   options: state.categoryOptions,
                        //   onOptionChanged: (index, value) {
                        //    // context.read<FiltersCubit>().updateCategoryOption(index, value);
                        //   },
                        // ),
                        const SizedBox(height: 20,),
                        // CheckBoxWidget(
                        //   context: context,
                        //   title:AppLocalizations.of(context)!
                        //   .translate('filter_type_services')!,
                        //   options: state.stayOptions,
                        //   onOptionChanged: (index, value) {
                        //     context.read<FiltersCubit>().updateStayOption(index, value);
                        //   },
                        // ),
                        const SizedBox(height: 20,),
                        // CheckBoxWidget(
                        //   context: context,
                        //   title: AppLocalizations.of(context)!
                        //   .translate('types_experiences')!,
                        //   options: state.experiencesOptions,
                        //   onOptionChanged: (index, value) {
                        //     context.read<FiltersCubit>().updateExperiencesOption(index, value);
                        //   },
                        // ),
                        const SizedBox(height: 20,),
                   
                      ],
                    
                
                ),
              )
            ],
          ),
        ),
    );
  }
}
