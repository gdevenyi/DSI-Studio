#include <QProgressDialog>
#include <QApplication>
#include <QObject>
#include <memory>
#include <ctime>
#include <iostream>
#include <chrono>
#include <thread>
#include <QTime>
#include "prog_interface_static_link.h"
bool has_gui = false;
std::shared_ptr<QProgressDialog> progressDialog;
QTime t_total,t_last;
bool prog_aborted_ = false;
auto start_time = std::chrono::high_resolution_clock::now();
std::string current_title;
std::thread::id main_thread_id = std::this_thread::get_id();
bool is_main_thread(void)
{
    return main_thread_id == std::this_thread::get_id();
}
void check_create(void)
{
    if(!has_gui || !is_main_thread())
        return;
    auto cur = std::chrono::high_resolution_clock::now();
    if(!progressDialog.get() &&
       std::chrono::duration_cast<std::chrono::milliseconds>(cur - start_time).count() > 500)
    {
        progressDialog.reset(new QProgressDialog(current_title.c_str(),"Cancel",0,100));
        progressDialog->show();
        QApplication::processEvents();
    }
}
void begin_prog(const char* title,bool always_show_dialog)
{
    std::cout << title << std::endl;
    if(!has_gui || !is_main_thread())
        return;
    if(title)
        current_title = title;
    if(progressDialog.get())
    {
        progressDialog->setLabelText(title);
        progressDialog->show();
    }
    else
    if(always_show_dialog)
    {
        progressDialog.reset(new QProgressDialog(current_title.c_str(),"Cancel",0,100));
        progressDialog->show();
    }
    start_time = std::chrono::high_resolution_clock::now();
    QApplication::processEvents();
    t_total.start();
    t_last.start();
    prog_aborted_ = false;
}

bool is_running(void)
{
    if(!progressDialog.get())
        return false;
    return progressDialog->isVisible();
}

void set_title(const char* title)
{
    std::cout << title << std::endl;
    if(!has_gui || !is_main_thread())
        return;
    current_title = title;
    if(progressDialog.get())
    {
        progressDialog->setLabelText(title);
        QApplication::processEvents();
    }
}
void close_prog(void)
{
    if(!progressDialog.get())
        return;
    start_time = std::chrono::high_resolution_clock::now();
    prog_aborted_ = progressDialog->wasCanceled();
    progressDialog.reset();
    QApplication::processEvents();
}
bool check_prog(unsigned int now,unsigned int total)
{
    if(!has_gui || !is_main_thread())
        return now < total;
    check_create();
    if(!progressDialog.get())
        return now < total;
    if(now >= total || progressDialog->wasCanceled())
    {
        close_prog();
        return false;
    }
    if(now == 0 || now == total)
        t_total.start();
    if(progressDialog.get() && (t_last.elapsed() > 500))
    {
        t_last.start();
        long expected_sec = 0;
        if(now)
            expected_sec = ((double)t_total.elapsed()*(double)(total-now)/(double)now/1000.0);
        progressDialog->setRange(0, total);
        progressDialog->setValue(now);
        QString label = progressDialog->labelText().split(':').at(0);
        if(expected_sec)
            progressDialog->setLabelText(label + QString(": %1 of %2, estimated time: %3 min %4 sec").
                                             arg(now).arg(total).arg(expected_sec/60).arg(expected_sec%60));
        else
            progressDialog->setLabelText(label + QString(": %1 of %2...").arg(now).arg(total));
        progressDialog->show();
        QApplication::processEvents();
    }
    return now < total;
}

bool prog_aborted(void)
{
    if(!has_gui || !is_main_thread())
        return false;
    if(prog_aborted_)
        return true;
    if(progressDialog.get())
        return progressDialog->wasCanceled();
    return false;
}



