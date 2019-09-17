import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pub_client/pub_client.dart';
import 'package:tavern/src/convert.dart';

@immutable
class SettingsState {
  final Brightness brightness;
  final FilterType filterBy;
  final SortType sortBy;

  const SettingsState({
    @required this.filterBy,
    @required this.sortBy,
    @required this.brightness,
  })  : assert(filterBy != null),
        assert(sortBy != null),
        assert(brightness != null);

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
      brightness: convertStringToBrightness(json["brightness"]),
      filterBy: convertStringToFilterType(json["filterBy"]),
      sortBy: convertStringToSortType(json["sortBy"]),
    );
  }
  SettingsState copyWith({
    Brightness brightness,
    SortType sortBy,
    FilterType filterBy,
  }) {
    return SettingsState(
      brightness: brightness ?? this.brightness,
      filterBy: filterBy ?? this.filterBy,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "brightness": convertBrightnessToString(brightness),
        "filterBy": convertFilterTypeToString(filterBy),
        "sortBy": convertSortTypeToString(sortBy),
      };
}

class InitialSettingsState extends SettingsState {
  const InitialSettingsState()
      : super(
          brightness: Brightness.dark,
          filterBy: FilterType.all,
          sortBy: SortType.overAllScore,
        );
}
