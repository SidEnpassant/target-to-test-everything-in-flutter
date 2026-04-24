


import 'package:equatable/equatable.dart';
import 'package:testapp/bloc_state_management/favourite_app/model/favourite_item_model.dart';

enum ListStatus{loading , success , failure}

class FavouriteItemStates extends Equatable{

  final ListStatus listStatus;

  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempFavouriteList;
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.tempFavouriteList = const [],
    this.listStatus = ListStatus.loading
});

  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouriteItemList , List<FavouriteItemModel>? tempFavouriteList , ListStatus? listStatus}){
    return FavouriteItemStates(
    favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      tempFavouriteList: tempFavouriteList ?? this.tempFavouriteList,
      listStatus: listStatus ?? this.listStatus,
    );
}

  @override
  List<Object?> get props => [favouriteItemList , listStatus , tempFavouriteList];
}