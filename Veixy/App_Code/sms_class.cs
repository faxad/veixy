using System;

using System.IO.Ports;

public class sms_class : System.Web.UI.Page
{
    SerialPort port = new SerialPort();
    int c = 0;
    public sms_class()
    {
    }
    public int send_sms(string num, string msg)
    {
        try
        {
            c = c + 1;
            string temp = Convert.ToString(c);
            bool is_sent = false;
            while (!is_sent)
            {
                port.WriteTimeout = 90000;
                port.PortName = "COM8";
                port.ReceivedBytesThreshold = 1;
                port.BaudRate = 9600;
                port.Parity = Parity.None;
                port.DataBits = 8;
                port.StopBits = StopBits.One;
                if (!port.IsOpen)
                {
                    port.Close();
                    System.Threading.Thread.Sleep(5000);
                    port.Open();
                }
                else
                {
                    port.Close();
                    System.Threading.Thread.Sleep(5000);
                    port.Open();
                }
                port.WriteLine("AT\r");
                System.Threading.Thread.Sleep(200);

                port.WriteLine("AT+CMGF=1\r");
                System.Threading.Thread.Sleep(200);
                string s = "AT+CMGS=\"" + num + "\"\r";
                port.WriteLine(s);
                System.Threading.Thread.Sleep(200);
                port.WriteLine(msg + '\x001a');
                is_sent = true;
                System.Threading.Thread.Sleep(5000);
                port.Close();
                System.Threading.Thread.Sleep(5000);
                return 1;
            }
        }
        catch
        {
            return 0;
        }
        return 1;
    }
}