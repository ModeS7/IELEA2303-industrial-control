TYPE = application
PROJECTNAME = testApp

DEPS += opc-ua-io

HEADERS += Libraries.h
SOURCES += CDPMain.cpp

DISTFILES += \
    $$files(*.xml, true) \
    $$files(*.lic, true) \
    $$files(Application/www/*.*, true)

load(cdp)

ID = 307384097164594 # do not change
