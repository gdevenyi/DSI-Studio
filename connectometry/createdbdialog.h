#ifndef CREATEDB_H
#define CREATEDB_H

#include <QDialog>
#include <memory>


namespace Ui {
    class CreateDBDialog;
}

class CreateDBDialog : public QDialog
{
    Q_OBJECT
private:
    bool create_db;
    QString sample_fib;
public:
    QStringList group;
    unsigned int dir_length;
    explicit CreateDBDialog(QWidget *parent,bool create_db_);
    ~CreateDBDialog();
private:
    Ui::CreateDBDialog *ui;
    QString get_file_name(QString);
    void update_list(void);
    void load_data(void);

private slots:
    void on_save_list1_clicked();
    void on_open_list1_clicked();
    void on_movedown_clicked();
    void on_moveup_clicked();
    void on_group1delete_clicked();
    void on_group1open_clicked();
    void on_close_clicked();
    void on_open_dir1_clicked();
    void on_select_output_file_clicked();
    void on_create_data_base_clicked();
    void on_open_skeleton_clicked();
    void on_sort_clicked();
    void on_index_of_interest_currentIndexChanged(const QString &arg1);
    void on_update_ioi_clicked();
};

#endif // VBCDIALOG_H
