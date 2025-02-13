QT += core \
    gui \
    opengl \
    charts
greaterThan(QT_MAJOR_VERSION, 5): QT += widgets
CONFIG += c++17
#CONFIG += console
TARGET = dsi_studio
TEMPLATE = app
INCLUDEPATH += ./plot



win32* {
# GPU computation
# LIBS += -L"C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0\lib\x64" -lcudart_static -lcublas
# INCLUDEPATH += "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v8.0\include"

INCLUDEPATH += ../include
QMAKE_CXXFLAGS += -wd4244 -wd4267 -wd4018
LIBS += -lOpenGL32 -lGlu32
RC_ICONS = dsi_studio.ico
}

linux* {
QMAKE_CXXFLAGS += -fpermissive -Wno-sign-compare
LIBS += -lGLU -lz
}

mac{
INCLUDEPATH += /Users/admin/include
LIBS += -lz
ICON = dsi_studio.icns
}


INCLUDEPATH += libs \
    libs/dsi \
    libs/tracking \
    libs/mapping \
    dicom
HEADERS += mainwindow.h \
    dicom/dicom_parser.h \
    dicom/dwi_header.hpp \
    libs/dsi/tessellated_icosahedron.hpp \
    libs/dsi/odf_process.hpp \
    libs/dsi/image_model.hpp \
    libs/dsi/gqi_process.hpp \
    libs/dsi/gqi_mni_reconstruction.hpp \
    libs/dsi/dti_process.hpp \
    libs/dsi/basic_voxel.hpp \
    SliceModel.h \
    tracking/tracking_window.h \
    reconstruction/reconstruction_window.h \
    tracking/slice_view_scene.h \
    opengl/glwidget.h \
    libs/tracking/tracking_method.hpp \
    libs/tracking/roi.hpp \
    libs/tracking/interpolation_process.hpp \
    libs/tracking/fib_data.hpp \
    libs/tracking/basic_process.hpp \
    libs/tracking/tract_cluster.hpp \
    tracking/region/regiontablewidget.h \
    tracking/region/Regions.h \
    tracking/region/RegionModel.h \
    libs/tracking/tract_model.hpp \
    tracking/tract/tracttablewidget.h \
    opengl/renderingtablewidget.h \
    qcolorcombobox.h \
    libs/tracking/tracking_thread.hpp \
    libs/prog_interface_static_link.h \
    libs/mapping/atlas.hpp \
    view_image.h \
    libs/gzip_interface.hpp \
    manual_alignment.h \
    tracking/tract_report.hpp \
    tracking/color_bar_dialog.hpp \
    tracking/connectivity_matrix_dialog.h \
    tracking/atlasdialog.h \
    filebrowser.h \
    program_option.hpp \
    qcompletelineedit.h \
    libs/mapping/connectometry_db.hpp \
    connectometry/createdbdialog.h \
    connectometry/individual_connectometry.hpp \
    connectometry/match_db.h \
    connectometry/db_window.h \
    connectometry/group_connectometry.hpp \
    connectometry/group_connectometry_analysis.h \
    regtoolbox.h \
    connectometry/nn_connectometry.h \
    connectometry/nn_connectometry_analysis.h \
    auto_track.h \
    tracking/device.h \
    tracking/devicetablewidget.h

FORMS += mainwindow.ui \
    tracking/tracking_window.ui \
    reconstruction/reconstruction_window.ui \
    dicom/dicom_parser.ui \
    view_image.ui \
    manual_alignment.ui \
    tracking/tract_report.ui \
    tracking/color_bar_dialog.ui \
    tracking/connectivity_matrix_dialog.ui \
    tracking/atlasdialog.ui \
    filebrowser.ui \
    connectometry/createdbdialog.ui \
    connectometry/individual_connectometry.ui \
    connectometry/match_db.ui \
    connectometry/db_window.ui \
    connectometry/group_connectometry.ui \
    regtoolbox.ui \
    connectometry/nn_connectometry.ui \
    auto_track.ui
RESOURCES += \
    icons.qrc
SOURCES += main.cpp \
    mainwindow.cpp \
    dicom/dicom_parser.cpp \
    dicom/dwi_header.cpp \
    libs/utility/prog_interface.cpp \
    libs/dsi/dsi_interface_imp.cpp \
    libs/tracking/interpolation_process.cpp \
    libs/tracking/tract_cluster.cpp \
    SliceModel.cpp \
    tracking/tracking_window.cpp \
    reconstruction/reconstruction_window.cpp \
    tracking/slice_view_scene.cpp \
    opengl/glwidget.cpp \
    tracking/region/regiontablewidget.cpp \
    tracking/region/Regions.cpp \
    tracking/region/RegionModel.cpp \
    libs/tracking/tract_model.cpp \
    tracking/tract/tracttablewidget.cpp \
    opengl/renderingtablewidget.cpp \
    qcolorcombobox.cpp \
    cmd/trk.cpp \
    cmd/rec.cpp \
    cmd/src.cpp \
    libs/mapping/atlas.cpp \
    cmd/ana.cpp \
    view_image.cpp \
    manual_alignment.cpp \
    tracking/tract_report.cpp \
    tracking/color_bar_dialog.cpp \
    cmd/exp.cpp \
    tracking/connectivity_matrix_dialog.cpp \
    libs/dsi/tessellated_icosahedron.cpp \
    cmd/atl.cpp \
    tracking/atlasdialog.cpp \
    cmd/cnt.cpp \
    cmd/vis.cpp \
    filebrowser.cpp \
    qcompletelineedit.cpp \
    libs/tracking/fib_data.cpp \
    libs/tracking/tracking_thread.cpp \
    cmd/ren.cpp \
    libs/mapping/connectometry_db.cpp \
    connectometry/createdbdialog.cpp \
    connectometry/individual_connectometry.cpp \
    connectometry/match_db.cpp \
    connectometry/db_window.cpp \
    connectometry/group_connectometry.cpp \
    connectometry/group_connectometry_analysis.cpp \
    regtoolbox.cpp \
    cmd/cnn.cpp \
    cmd/qc.cpp \
    libs/dsi/basic_voxel.cpp \
    libs/dsi/image_model.cpp \
    connectometry/nn_connectometry.cpp \
    connectometry/nn_connectometry_analysis.cpp \
    cmd/reg.cpp \
    auto_track.cpp \
    cmd/atk.cpp \
    tracking/device.cpp \
    tracking/devicetablewidget.cpp \
    libs/gzip_interface.cpp

OTHER_FILES += \
    options.txt \
    dicom_tag.txt \
    FreeSurferColorLUT.txt \
    shader_fragment.txt \
    shader_vertex.txt

DISTFILES += \
    shader_fragment2.txt \
    shader_vertex2.txt \
    COPYRIGHT

