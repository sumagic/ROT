#include <glog/logging.h>
#include <gflags/gflags.h>



int main(int argc, char** argv)
{
    // glog初始化
    google::InitGoogleLogging(argv[0]);
    google::SetLogFilenameExtension("glog_");
    google::InstallFailureSignalHandler();
    google::SetLogDestination(google::INFO, "./glog/");

    LOG(INFO) << "server start";

    return 0;
}