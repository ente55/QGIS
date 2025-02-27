# The following has been generated automatically from src/core/layout/qgslayoutmanager.h
QgsLayoutManagerModel.Role = QgsLayoutManagerModel.CustomRole
# monkey patching scoped based enum
QgsLayoutManagerModel.LayoutRole = QgsLayoutManagerModel.CustomRole.Layout
QgsLayoutManagerModel.Role.LayoutRole = QgsLayoutManagerModel.CustomRole.Layout
QgsLayoutManagerModel.LayoutRole.is_monkey_patched = True
QgsLayoutManagerModel.LayoutRole.__doc__ = "Layout object"
QgsLayoutManagerModel.CustomRole.__doc__ = "Custom model roles.\n\n.. note::\n\n   Prior to QGIS 3.36 this was available as QgsLayoutManagerModel.Role\n\n.. versionadded:: 3.36\n\n" + '* ``LayoutRole``: ' + QgsLayoutManagerModel.CustomRole.Layout.__doc__
# --
QgsLayoutManagerModel.CustomRole.baseClass = QgsLayoutManagerModel
QgsLayoutManagerProxyModel.FilterPrintLayouts = QgsLayoutManagerProxyModel.Filter.FilterPrintLayouts
QgsLayoutManagerProxyModel.FilterReports = QgsLayoutManagerProxyModel.Filter.FilterReports
QgsLayoutManagerProxyModel.Filters = lambda flags=0: QgsLayoutManagerProxyModel.Filter(flags)
QgsLayoutManagerProxyModel.Filters.baseClass = QgsLayoutManagerProxyModel
Filters = QgsLayoutManagerProxyModel  # dirty hack since SIP seems to introduce the flags in module
def _force_int(v): return v if isinstance(v, int) else int(v.value)


QgsLayoutManagerProxyModel.Filter.__bool__ = lambda flag: bool(_force_int(flag))
QgsLayoutManagerProxyModel.Filter.__eq__ = lambda flag1, flag2: _force_int(flag1) == _force_int(flag2)
QgsLayoutManagerProxyModel.Filter.__and__ = lambda flag1, flag2: _force_int(flag1) & _force_int(flag2)
QgsLayoutManagerProxyModel.Filter.__or__ = lambda flag1, flag2: QgsLayoutManagerProxyModel.Filter(_force_int(flag1) | _force_int(flag2))
