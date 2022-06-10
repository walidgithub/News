
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsGetBusiness extends NewsState {}
class NewsGetBusinessWError extends NewsState {}
class NewsLoadingBusiness extends NewsState {}

class NewsLoadingSports extends NewsState {}
class NewsGetSport extends NewsState {}
class NewsGetSportWError extends NewsState {}

class NewsLoadingScience extends NewsState {}
class NewsGetScience extends NewsState {}
class NewsGetScienceWError extends NewsState {}

class NewsNavigatorIndex extends NewsState {}

class NewsChangeMode extends NewsState {}
