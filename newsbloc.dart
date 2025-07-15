// Event
abstract class NewsEvent {}
class FetchHeadlines extends NewsEvent {
  final String category;
  FetchHeadlines(this.category);
}

// State
abstract class NewsState {}
class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<Article> articles;
  NewsLoaded(this.articles);
}
class NewsError extends NewsState {
  final String message;
  NewsError(this.message);
}

// Bloc
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;
  
  NewsBloc(this.repository) : super(NewsLoading()) {
    on<FetchHeadlines>((event, emit) async {
      emit(NewsLoading());
      try {
        final data = await repository.fetchNews(event.category);
        emit(NewsLoaded(data));
      } catch (e) {
        emit(NewsError("Failed to load news"));
      }
    });
  }
}
