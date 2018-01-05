import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: '{{cookiecutter.app_full_name}}'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('{{cookiecutter.title}}')
        }

        Label {
            anchors.centerIn: parent
            text: i18n.tr('Hello World!')
        }
    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('./'));

            importModule('{{cookiecutter.python_module_name}}', function() {
                console.log('{{cookiecutter.python_module_name}} module imported');
                python.call('{{cookiecutter.python_module_name}}.speak', ['Hello World!'], function(returnValue) {
                    console.log('{{cookiecutter.python_module_name}}.speak returned ' + returnValue);
                })
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
