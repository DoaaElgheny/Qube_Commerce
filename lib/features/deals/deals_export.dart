//?Data
export 'data/datasources/deals_remote_datasource.dart';
export 'data/models/deal_model.dart';
export 'data/models/deal_parameter.dart';
export 'data/models/deals_entity.dart';
export 'data/models/join_deal_model.dart';
export 'data/models/picture_model.dart';
export 'data/models/get_available_deals_model.dart';
export 'data/models/deals_details_model.dart';
export 'data/models/campaign_histories_model.dart';
export 'data/repositories/deals_repo_impl.dart';

//?Domain 
export 'domain/repositories/deals_repo.dart';
export 'domain/usecases/deals_usecase.dart';

//?Presentation
export 'presentation/cubit/deals_cubit.dart';
export 'presentation/pages/deal_details_page.dart';
export 'presentation/widgets/campaign_histories_card_widget.dart';
export 'presentation/widgets/deal_images_card_widget.dart';
export 'presentation/widgets/deal_summary_card_widget.dart';