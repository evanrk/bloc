import 'package:flutter/material.dart';

// uses inheritedWidget and a helper class to allow changing of state across the entire app
class Metadata {
  Metadata(
      {this.title = "empty",
      this.description = "nothing yet. add something here :D"});
  final String title;
  final String description;
}

class AppState {
  AppState({
    this.minutes = 5,
    this.startHour = 5,
    this.maxHours = 12,
    this.blockMetadata = const [],
    this.selectedBlocks = const [],
  });
  final int minutes;
  final int startHour;
  final int maxHours;
  final List<Metadata> blockMetadata;
  final List<int> selectedBlocks;

  AppState copyWith({
    int? minutes,
    int? startHour,
    int? maxHours,
    List<Metadata>? blockMetadata,
    List<int>? selectedBlocks,
  }) {
    return AppState(
      minutes: minutes ?? this.minutes,
      startHour: startHour ?? this.startHour,
      maxHours: maxHours ?? this.maxHours,
      blockMetadata: blockMetadata ?? this.blockMetadata,
      selectedBlocks: selectedBlocks ?? this.selectedBlocks,
    );
  }
}

class AppStateScope extends InheritedWidget {
  const AppStateScope({super.key, required this.data, required this.child})
      : super(child: child);

  final AppState data;

  @override
  final Widget child;

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

class AppStateWidget extends StatefulWidget {
  const AppStateWidget({super.key, required this.child});

  final Widget child;

  static _AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppStateWidgetState>()!;
  }

  @override
  State<AppStateWidget> createState() => _AppStateWidgetState();
}

class _AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState();

  void setMinutes(int minutes) {
    if (_data.minutes != minutes) {
      setState(() {
        _data = _data.copyWith(minutes: minutes);
      });
    }
  }

  void setStartHour(int startHour) {
    if (_data.startHour != startHour) {
      setState(() {
        _data = _data.copyWith(startHour: startHour);
      });
    }
  }

  void setMaxHours(int maxHours) {
    if (_data.maxHours != maxHours) {
      setState(() {
        _data = _data.copyWith(maxHours: maxHours);
      });
    }
  }

  void setSelectedBlocks(List<int> selectedBlocks) {
    if (_data.selectedBlocks != selectedBlocks) {
      setState(() {
        _data = _data.copyWith(selectedBlocks: selectedBlocks);
      });
    }
  }

  void setBlockMetadata(List<Metadata> metadata) {
    if (_data.blockMetadata != metadata) {
      setState(() {
        _data = _data.copyWith(blockMetadata: metadata);
      });
    }
  }

  void addBlockMetadata(Metadata metadata) {
    List<Metadata> metadataList = _data.blockMetadata;
    metadataList.add(metadata);
    setState(() {
      _data = _data.copyWith(blockMetadata: metadataList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(data: _data, child: widget.child);
  }
}
