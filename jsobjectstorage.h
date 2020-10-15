#ifndef JSOBJECTSTORAGE_H
#define JSOBJECTSTORAGE_H

#include <QAbstractListModel>
#include <QList>
#include <QString>
#include <QPair>
#include <QJsonObject>
#include <QJsonDocument>

class JSObjectStorage : public QAbstractListModel
{
    Q_OBJECT
    QList<QPair<QString, QString>> colorsStorage;  ///< <objectName, color(#ffffffff)>
    QJsonObject jsonData;
    enum DataRoles {
            ObjectNameRole = Qt::UserRole + 1,
            ObjectColorRole
        };
public:
    explicit JSObjectStorage(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QHash<int, QByteArray> roleNames() const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

public slots:
    /**
     * @brief updateData parsing json string and update storage data.
     * @param src - json string.
     */
    void updateData(const QString& src);

    /**
     * @brief setElementColor
     * @param name
     * @param color
     */
    void setElementColor(const QString& name, const QString& color);
signals:
    void jsonChanged(QString jsStr);
};

#endif // JSOBJECTSTORAGE_H
