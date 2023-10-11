import QtQuick.Controls 1.4
import QtQuick 2.15

Rectangle{

    Row{
        Calendar{

        }

        Calendar{
           locale: Qt.locale("en_AU")
        }

        Calendar{
           locale: Qt.locale("de_DE")
        }



    }

}
