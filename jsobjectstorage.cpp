#include "jsobjectstorage.h"

JSObjectStorage::JSObjectStorage(QObject *parent)
    : QAbstractListModel(parent)
{
}

int JSObjectStorage::rowCount(const QModelIndex &parent) const{
    if (parent.isValid())
        return 0;
    return colorsStorage.size();
}

QVariant JSObjectStorage::data(const QModelIndex &index, int role) const{
    if (!index.isValid())
        return QVariant();

    if(role == ObjectNameRole)
        return colorsStorage[index.row()].first;
    if(role == ObjectColorRole)
        return colorsStorage[index.row()].second;
    return QVariant();
}

void JSObjectStorage::updateData(const QString& src){
    beginResetModel();
    colorsStorage.clear();
    QJsonDocument jsonResponse = QJsonDocument::fromJson(src.toUtf8());
    jsonData = jsonResponse.object();
    auto keys = jsonData.keys();
    for(auto key : keys){
        QString val = jsonData[key].toString();
        if((val.size() == 7 || val.size() == 9) && val.contains('#'))
            colorsStorage.push_back(QPair<QString, QString>(key, val));
    }
    endResetModel();
}

QHash<int, QByteArray> JSObjectStorage::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[ObjectNameRole] = "objectName";
    roles[ObjectColorRole] = "objectColor";
    return roles;
}

void JSObjectStorage::setElementColor(const QString& name, const QString& color){
    beginResetModel();
    if(jsonData.find(name) != jsonData.end()){
        jsonData[name] = color;
        QJsonDocument jsDock(jsonData);
        emit jsonChanged(jsDock.toJson(QJsonDocument::Indented));
    }
    endResetModel();
}

