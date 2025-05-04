import 'package:flutter/material.dart';

const double _kPanelHeaderCollapsedHeight = kMinInteractiveDimension;
// ignore: unused_element
const EdgeInsets _kPanelHeaderExpandedDefaultPadding = EdgeInsets.symmetric(
  vertical: 64.0 - _kPanelHeaderCollapsedHeight,
);

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _SaltedKey<S, V> &&
        other.salt == salt &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? "<'$salt'>" : '<$salt>';
    final String valueString = V == String ? "<'$value'>" : '<$value>';
    return '[$saltString $valueString]';
  }
}

class AppExpansionPanelList extends StatefulWidget {
  const AppExpansionPanelList({
    super.key,

    required this.children,
    this.expansionCallback,
    this.animationDuration = kThemeAnimationDuration,
    this.expandedHeaderPadding = EdgeInsets.zero,
    this.dividerColor,
    this.elevation = 2,
  }) : _allowOnlyOnePanelOpen = false,
       initialOpenPanelValue = null;

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback? expansionCallback;

  final Duration animationDuration;

  final bool _allowOnlyOnePanelOpen;

  final Object? initialOpenPanelValue;

  final EdgeInsets expandedHeaderPadding;

  final Color? dividerColor;

  final double elevation;

  @override
  State<AppExpansionPanelList> createState() => _AppExpansionPanelListState();
}

class _AppExpansionPanelListState extends State<AppExpansionPanelList> {
  ExpansionPanelRadio? _currentOpenPanel;

  @override
  void initState() {
    super.initState();
    if (widget._allowOnlyOnePanelOpen) {
      assert(
        _allIdentifiersUnique(),
        'All ExpansionPanelRadio identifier values must be unique.',
      );
      if (widget.initialOpenPanelValue != null) {
        _currentOpenPanel = searchPanelByValue(
          widget.children.cast<ExpansionPanelRadio>(),
          widget.initialOpenPanelValue,
        );
      }
    }
  }

  @override
  void didUpdateWidget(AppExpansionPanelList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._allowOnlyOnePanelOpen) {
      assert(
        _allIdentifiersUnique(),
        'All ExpansionPanelRadio identifier values must be unique.',
      );
      // If the previous widget was non-radio AppExpansionPanelList, initialize the
      // open panel to widget.initialOpenPanelValue
      if (!oldWidget._allowOnlyOnePanelOpen) {
        _currentOpenPanel = searchPanelByValue(
          widget.children.cast<ExpansionPanelRadio>(),
          widget.initialOpenPanelValue,
        );
      }
    } else {
      _currentOpenPanel = null;
    }
  }

  bool _allIdentifiersUnique() {
    final Map<Object, bool> identifierMap = <Object, bool>{};
    for (final ExpansionPanelRadio child
        in widget.children.cast<ExpansionPanelRadio>()) {
      identifierMap[child.value] = true;
    }
    return identifierMap.length == widget.children.length;
  }

  bool _isChildExpanded(int index) {
    if (widget._allowOnlyOnePanelOpen) {
      final ExpansionPanelRadio radioWidget =
          widget.children[index] as ExpansionPanelRadio;
      return _currentOpenPanel?.value == radioWidget.value;
    }
    return widget.children[index].isExpanded;
  }

  void _handlePressed(bool isExpanded, int index) {
    widget.expansionCallback?.call(index, isExpanded);

    if (widget._allowOnlyOnePanelOpen) {
      final ExpansionPanelRadio pressedChild =
          widget.children[index] as ExpansionPanelRadio;

      for (
        int childIndex = 0;
        childIndex < widget.children.length;
        childIndex += 1
      ) {
        final ExpansionPanelRadio child =
            widget.children[childIndex] as ExpansionPanelRadio;
        if (widget.expansionCallback != null &&
            childIndex != index &&
            child.value == _currentOpenPanel?.value) {
          widget.expansionCallback!(childIndex, false);
        }
      }

      setState(() {
        _currentOpenPanel = isExpanded ? null : pressedChild;
      });
    }
  }

  ExpansionPanelRadio? searchPanelByValue(
    List<ExpansionPanelRadio> panels,
    Object? value,
  ) {
    for (ExpansionPanelRadio panel in panels) {
      if (panel.value == value) return panel;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    assert(
      kElevationToShadow.containsKey(widget.elevation),
      'Invalid value for elevation. See the kElevationToShadow constant for'
      ' possible elevation values.',
    );

    final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];

    for (int index = 0; index < widget.children.length; index += 1) {
      final ExpansionPanel child = widget.children[index];
      final Widget headerWidget = child.headerBuilder(
        context,
        _isChildExpanded(index),
      );

      Widget expandIconContainer = Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        child: ExpandIcon(
          isExpanded: _isChildExpanded(index),
          padding: const EdgeInsets.all(16.0),
          onPressed:
              !child.canTapOnHeader
                  ? (bool isExpanded) => _handlePressed(isExpanded, index)
                  : null,
        ),
      );
      if (!child.canTapOnHeader) {
        final MaterialLocalizations localizations = MaterialLocalizations.of(
          context,
        );
        expandIconContainer = Semantics(
          label:
              _isChildExpanded(index)
                  ? localizations.expandedIconTapHint
                  : localizations.collapsedIconTapHint,
          container: true,
          child: expandIconContainer,
        );
      }
      Widget header = Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: widget.animationDuration,
              curve: Curves.fastOutSlowIn,
              margin:
                  _isChildExpanded(index)
                      ? widget.expandedHeaderPadding
                      : EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: _kPanelHeaderCollapsedHeight,
                ),
                child: headerWidget,
              ),
            ),
          ),
        ],
      );
      if (child.canTapOnHeader) {
        header = MergeSemantics(
          child: InkWell(
            onTap: () => _handlePressed(_isChildExpanded(index), index),
            splashColor: Colors.transparent,
            child: header,
          ),
        );
      }
      items.add(
        MaterialSlice(
          key: _SaltedKey<BuildContext, int>(context, index * 2),
          color: child.backgroundColor,
          child: Column(
            children: <Widget>[
              header,
              AnimatedCrossFade(
                firstChild: Container(height: 0.0),
                secondChild: child.body,
                firstCurve: const Interval(
                  0.0,
                  0.6,
                  curve: Curves.fastOutSlowIn,
                ),
                secondCurve: const Interval(
                  0.4,
                  1.0,
                  curve: Curves.fastOutSlowIn,
                ),
                sizeCurve: Curves.fastOutSlowIn,
                crossFadeState:
                    _isChildExpanded(index)
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                duration: widget.animationDuration,
              ),
            ],
          ),
        ),
      );

      if (_isChildExpanded(index) && index != widget.children.length - 1) {
        items.add(
          MaterialGap(
            key: _SaltedKey<BuildContext, int>(context, index * 2 + 1),
          ),
        );
      }
    }

    return MergeableMaterial(
      hasDividers: true,
      dividerColor: widget.dividerColor,
      elevation: widget.elevation,
      children: items,
    );
  }
}
