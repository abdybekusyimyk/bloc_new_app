import 'package:bloc_new_app/models/new_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.service) : super(NewsLoading()) {
    on<NewsEvent>((event, emit) {});
    on<NewsByCountryCodeEvent>(_getNewsByCountry);
  }

  final NewsService service;

  Future<void> _getNewsByCountry(
      NewsByCountryCodeEvent event, Emitter<NewsState> emit) async {
    final news = await service.getNewsByCountry(event.countryCode);
    if (news != null) {
      emit(NewsSuccess(news));
    } else {
      emit(const NewsError('Bizde bir kata boldu'));
    }
  }
}
