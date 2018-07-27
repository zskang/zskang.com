package com.framework.utils.generator;

/**
 * Created by Administrator on 2017/7/1 0001.
 */
public class UserLog {
  /* public static void Main(string[] args)
         {
                     for (int i = 0; i < 10000; i++)
                        {
                             Thread thr1 = new Thread(new ThreadStart(delegate() { Log.Write("问题A" + i); }));
                            Thread thr2 = new Thread(new ThreadStart(delegate() { Log.Write("问题B" + i); }));
                            thr1.Start();
                             thr2.Start();
                         }
                    Console.Read();
                 }
     }

             /// <summary>
             /// 异常文件单利模式（文件只能有一个进程访问，所以使用单利模式实现）
             /// </summary>
             public class LogFile
     {
                 static FileInfo fi = null;
                 static readonly object syncObject = new object();
                 static string saveName = @"C:\WRITE_LOG.TXT";
                 public static FileInfo Log()
                {
                     lock (syncObject)
                    {
                         if (fi == null)
                         {
                             fi = new FileInfo(saveName);
                        }
                     }
                     return fi;
                 }
             }
             /// <summary>
             /// 日志写入类
             /// </summary>
             public class Log
     {
                 static readonly object syncObjectWrite = new object();
                 public static void Write(string strContent)
                 {
                     lock (syncObjectWrite)
                     {
                         using (StreamWriter writer = LogFile.Log().AppendText())
                         {
                             writer.WriteLine("=====================================\r\n"
                                 + "添加日期为:" + DateTime.Now.ToString() + "\r\n"
                                 + "日志内容为:" + strContent + "\r\n"
                                 + "=====================================");
                         }
                     }
                 }*/


}
