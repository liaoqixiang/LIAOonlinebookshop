// --------------------------------------------------------------------------------------------------------------------
// <copyright file="CaptchaHelper.cs">
//     Copyright © LIAOQIXIANG
// </copyright>
// <summary>
//    Description:generate random validate code
// </summary>
// --------------------------------------------------------------------------------------------------------------------
namespace LeoBookShop.Utility
{
    using System;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.Globalization;
    using System.IO;
    using System.Text;

    /// <summary>  
    /// Description:spin some agles, randomly generate validate code. 
    /// </summary>  
    public static class CaptchaHelper
    {
        /// <summary>  
        /// generate random validate code  
        /// </summary>  
        /// <param  name="length">how many chracters</param>  
        /// <returns></returns>  
        public static string CreateRandomCode(int length)
        {
            return Guid.NewGuid().ToString("N").Substring(0, length);
        }

        /// <summary>  
        /// validate code image  
        /// </summary>  
        /// <param  name="vcode">validate code</param>
        /// <param name="fontSize">font size</param>
        /// <param name="background">background color</param>
        /// <param name="border">border color</param>
        /// <returns>Gif image binary stream</returns>
        public static byte[] DrawImage(string vcode, float fontSize = 14, Color background = default(Color), Color border = default(Color))
        {
            // random angle 
            const int RandAngle = 45;

            // var height = (int) (fontSize + 4);
            var width = vcode.Length * (int)fontSize;

            // image background
            using (var map = new Bitmap(width + 3, (int)fontSize + 10))
            {
                using (var graphics = Graphics.FromImage(map))
                {
                    graphics.Clear(background); // clear image，fill background 
                    graphics.DrawRectangle(new Pen(border, 0), 0, 0, map.Width - 1, map.Height - 1); // draw a border  
                    var random = new Random();

                    // a lot of dots
                    var blackPen = new Pen(Color.DarkGray, 0);
                    for (var i = 0; i < 50; i++)
                    {
                        int x = random.Next(0, map.Width);
                        int y = random.Next(0, map.Height);
                        graphics.DrawRectangle(blackPen, x, y, 1, 1);
                    }

                    // spin the validate code    
                    var chars = vcode.ToCharArray(); // string=>char array  
                    // words stay center  
                    var format = new StringFormat(StringFormatFlags.NoClip)
                    {
                        Alignment = StringAlignment.Center,
                        LineAlignment = StringAlignment.Center
                    };

                    // defin color  
                    Color[] colors = { Color.Black, Color.DarkBlue, Color.Green, Color.Orange, Color.Brown, Color.DarkCyan, Color.Purple, Color.DarkGoldenrod };

                    FontStyle[] styles = { FontStyle.Bold, FontStyle.Italic, FontStyle.Regular, /*FontStyle.Strikeout,*/ FontStyle.Underline };

                    // define fonts  
                    string[] fonts = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
                    foreach (char item in chars)
                    {
                        int cindex = random.Next(8);
                        int findex = random.Next(5);
                        int sindex = random.Next(4);
                        var font = new Font(fonts[findex], fontSize, styles[sindex]); // font style 
                        Brush b = new SolidBrush(colors[cindex]);
                        var dot = new Point(16, 16);
                        float angle = random.Next(-RandAngle, RandAngle); // angle  
                        graphics.TranslateTransform(dot.X, dot.Y); // Move the cursor to the specified position  
                        graphics.RotateTransform(angle);
                        graphics.DrawString(item.ToString(CultureInfo.InvariantCulture), font, b, 1, 1, format);

                        // graph.DrawString(chars.ToString(),fontstyle,new SolidBrush(Color.Blue),1,1,format);  
                        graphics.RotateTransform(-angle); // rotate back  
                        graphics.TranslateTransform(2, -dot.Y); // Move the cursor to the specified position  
                    }
                }

                // graph.DrawString(randomcode,fontstyle,new SolidBrush(Color.Blue),2,2); 
                // generate image  
                var stream = new MemoryStream();
                map.Save(stream, ImageFormat.Gif);

                //output image stream
                return stream.ToArray();
            }
        }
    }
}