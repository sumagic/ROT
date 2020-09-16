#include <glog/logging.h>
#include <gflags/gflags.h>

DEFINE_string(config_file, "", "rot configure file, default: null");
DEFINE_string(testcase, "", "testcase prototxt file, default: null");


int main(int argc, char** argv)
{
    //命令行参数初始化
    google::ParseCommandLineFlags(&argc, &argv, true);
    // glog初始化
    google::InitGoogleLogging(argv[0]);
    // glog日志文件扩展名
    google::SetLogFilenameExtension("glog_");
    // glog失败打印出日志到屏幕
    google::InstallFailureSignalHandler();
    // 日志文件保存文件设置
    google::SetLogDestination(google::INFO, "./glog/");

    LOG(INFO) << "server start";

    return 0;
}